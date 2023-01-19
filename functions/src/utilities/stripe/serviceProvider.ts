import Stripe from 'stripe';
import { ServerResponseStatus } from '../../shared/models/Generic/Generic';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import { OrderType, PaymentType } from '../../shared/models/Generic/Order';
import { StripeStatus } from './model';
import { CustomerInfo } from '../../shared/models/Generic/User';
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
  let serviceProvider;
  let operator;

  if(updateDetails.orderType == OrderType.Restaurant) {
    serviceProvider = await getRestaurant(updateDetails.serviceProviderId);
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