import Stripe from 'stripe';
import { ServerResponseStatus } from '../../shared/models/Generic/Generic';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import * as serviceProviderNodes from '../../shared/databaseNodes/services/serviceProvider';
import { OrderType, PaymentType } from '../../shared/models/Generic/Order';
import { ServiceProviderStripeInfo, StripeStatus } from './model';
import { CustomerInfo, UserInfo } from '../../shared/models/Generic/User';
import { getUserInfo } from '../../shared/controllers/rootController';
import { OperatorStatus } from '../../shared/models/Services/Restaurant/Restaurant';
import { HttpsError } from 'firebase-functions/v1/auth';
import { getRestaurant } from '../../shared/graphql/restaurant/getRestaurant';
import { updateRestaurantStripe } from '../../shared/graphql/restaurant/updateRestaurant';
import { updateCustomerStripe } from '../../shared/graphql/user/customer/updateCustomer';
let keys: Keys = getKeys();

export interface SetupDetails {
  serviceProviderId: number,
  orderType: OrderType,
  acceptedPayments?: Record<PaymentType, boolean>
}

export async function setupServiceProvider(userId: number, setupDetails: SetupDetails) {

  let serviceProvider;
  let operator;

  if(setupDetails.orderType == OrderType.Restaurant) {
    serviceProvider = await getRestaurant(setupDetails.serviceProviderId);
    operator = serviceProvider.restaurantOperators?.filter((o) => o.userId == userId)[0];
  } else {
    throw new HttpsError(
      "internal",
      "invalid order type"
    );
  }
  if(!operator) {
    throw new HttpsError(
      "internal",
      "No restaurant operator with that user id or restaurant id found"
    );
  }
  if(operator.status != OperatorStatus.Authorized) {
    throw new HttpsError(
      "internal",
      "restaurant operator not authorized"
    );
  }
  const stripeOptions = { apiVersion: <any>'2020-08-27' };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  if(!(serviceProvider.stripeInfo)) {
    let owner;
    if(setupDetails.orderType == OrderType.Restaurant)
      owner = serviceProvider.restaurantOperators?.filter((o) => o.owner == true)[0];
    
    const account = await stripe.accounts.create({
      type: 'standard',
      email: owner?.user?.email ?? operator.user?.email ?? undefined,
      business_type: 'individual',
      business_profile: {
        name: serviceProvider.name,
        support_email: owner?.user?.email ?? operator.user?.email ?? undefined,
        support_phone: owner?.user?.phoneNumber ?? operator.user?.phoneNumber ?? undefined,
        url: `https://mezcalmos.com/?type=${setupDetails.orderType}&id=${setupDetails.serviceProviderId}`
      },
      individual: {
        first_name: operator.user?.name ?? undefined,
        email: operator.user?.email ?? undefined,
        phone: operator.user?.phoneNumber ?? undefined,
      },
      country: "mx",
      default_currency: "mxn",
      metadata: {
        id: setupDetails.serviceProviderId,
        type: setupDetails.orderType,
        user_id: userId
      }
    });
    serviceProvider.stripeInfo = {
      id: account.id,
      status: StripeStatus.InProcess,
      detailsSubmitted: false,
      payoutsEnabled: false,
      chargeFeesOnCustomer : null,
      email: null,
      chargesEnabled: false,
      requirements: []
    }
    serviceProvider.acceptedPayments = setupDetails.acceptedPayments;
    if(setupDetails.orderType == OrderType.Restaurant)
      updateRestaurantStripe(serviceProvider);
  }

  const accountLink = await stripe.accountLinks.create({
    account: serviceProvider.stripeInfo.id,
    refresh_url: 'https://example.com/reauth',
    return_url: 'https://example.com/return',
    type: 'account_onboarding',
  }, stripeOptions);
  console.log("accountLink: ", accountLink)
  return {
    status: ServerResponseStatus.Success,
    ...accountLink
  }
}

export interface UpdateDetails {
  serviceProviderId: number,
  orderType: OrderType
}

export async function updateServiceProvider(userId: number, updateDetails: UpdateDetails) {
  
  const stripeOptions = { apiVersion: <any>'2020-08-27' };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  let serviceProvider;
  if(updateDetails.orderType == OrderType.Restaurant) {
    serviceProvider = await getRestaurant(updateDetails.serviceProviderId);
  } else {
    throw new HttpsError(
      "internal",
      "invalid order type"
    );
  }

  let stripeInfo = serviceProvider.stripeInfo;
  if(!stripeInfo) {
    throw new HttpsError(
      "internal",
      "Account has not setup stripe yet"
    );
  }
  const account: Stripe.Account = await stripe.accounts.retrieve(stripeInfo.id, stripeOptions);
  let isWorking: boolean = account.details_submitted && account.charges_enabled;

  serviceProvider.stripeInfo = {
    id: stripeInfo.id,
    status: isWorking ? StripeStatus.IsWorking : StripeStatus.InProcess,
    detailsSubmitted: account.details_submitted,
    payoutsEnabled: account.payouts_enabled,
    chargeFeesOnCustomer: null ,
    email: account.email,
    chargesEnabled: account.charges_enabled,
    requirements: account.requirements?.currently_due
  }
  if(updateDetails.orderType == OrderType.Restaurant)
    updateRestaurantStripe(serviceProvider);

  return {
    status: ServerResponseStatus.Success
  }
}

export async function verifyCustomerIdForServiceAccount(
  customerInfo: CustomerInfo, 
  serviceProviderId: number, 
  orderType: OrderType, 
  stripe: Stripe, 
  stripeOptions: any
): Promise<CustomerInfo> {
  // let customerInfo = await getCustomer(customerId);
  if(!(customerInfo.stripeInfo)) {
    throw new HttpsError(
      "internal",
      "Customer does not have stripe account"
    );
  }
  if(customerInfo.stripeInfo.idsWithServiceProvider[orderType][serviceProviderId] == null) {
    const customer: Stripe.Customer = await stripe.customers.create({
      name: customerInfo.name,
      metadata: { customerId: customerInfo.id },
    }, stripeOptions)
    customerInfo.stripeInfo.idsWithServiceProvider[orderType][serviceProviderId] = customer.id;
    updateCustomerStripe(customerInfo);
  }
  return customerInfo;
}

export async function getServiceProviderStripeId(serviceProviderId: string, orderType: OrderType, userId: string, stripe: Stripe, stripeOptions: any) {
  let serviceProviderStripeId: string = (await serviceProviderNodes.serviceProviderStripeId(orderType, serviceProviderId).once('value')).val();
  if (serviceProviderStripeId == null) {
    let serviceProviderInfo: UserInfo = (await serviceProviderNodes.serviceProviderInfo(orderType, serviceProviderId).once('value')).val().info;
    let userInfo: UserInfo = await getUserInfo(userId);
    const account = await stripe.accounts.create({
      type: 'standard',
      email: serviceProviderInfo.email ?? userInfo.email,
      business_type: 'individual',
      business_profile: {
        name: serviceProviderInfo.name,
        support_email: serviceProviderInfo.email ?? userInfo.email,
        support_phone: serviceProviderInfo.phoneNumber ?? userInfo.phoneNumber,
        url: `https://mezcalmos.com/?type=${orderType}&id=${serviceProviderId}`
      },
      individual: {
        first_name: userInfo.name,
        email: userInfo.email,
        phone: userInfo.phoneNumber,
      },
      country: "mx",
      default_currency: "mxn",
      metadata: {
        id: serviceProviderId,
        type: orderType,
        user_id: userId
      }
    });
    // add name, link, descriptor, long name, short name, address, id
    serviceProviderNodes.serviceProviderPaymentInfo(orderType, serviceProviderId).child('stripe').set(<ServiceProviderStripeInfo>{
      id: account.id,
      status: StripeStatus.InProcess,
      detailsSubmitted: false,
      payoutsEnabled: false,
      chargeFeesOnCustomer : null,
      email: null,
      chargesEnabled: false,
      requirements: []
    });
    serviceProviderStripeId = account.id;
    serviceProviderNodes.serviceProviderPaymentInfo(orderType as OrderType, serviceProviderId).child(`acceptedPayments`).set({
      [PaymentType.Card]: true,
      [PaymentType.Cash]: true
    });
  }
  return serviceProviderStripeId;
}

// async function passChecksForOperator(userId: string, data: any): Promise<ValidationPass> {
  // let response = isSignedIn(userId);
  // if (response != undefined) {
  //   return {
  //     ok: false,
  //     error: response
  //   }
  // }

//   if (data.serviceProviderId == null || data.orderType == null)
//     return {
//       ok: false,
//       error: {
//         status: ServerResponseStatus.Error,
//         errorMessage: `Expected serviceProviderId and orderType`,
//         errorCode: "incorrectParams"
//       }
//     }

//   let authorized = (await serviceProviderNodes.serviceProviderState(data.orderType, data.serviceProviderId).child("/operators").child(userId).once('value')).val();
//   if (!authorized)
//     return {
//       ok: false,
//       error: {
//         status: ServerResponseStatus.Error,
//         errorMessage: `User not authorized to run this operation`,
//         errorCode: "unauthorized"
//       }
//     }

//   return {
//     ok: true
//   }
// }
