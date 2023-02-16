import Stripe from 'stripe';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import { PaymentType } from '../../shared/models/Generic/Order';
import { StripeStatus } from './model';
import { CustomerInfo } from '../../shared/models/Generic/User';
import { HttpsError } from 'firebase-functions/v1/auth';
import { updateCustomerStripe } from '../../shared/graphql/user/customer/updateCustomer';
import { Operator, ServiceProvider } from '../../shared/models/Services/Service';
import { AuthorizationStatus } from "../../shared/models/Generic/Generic"
import { getServiceProviderDetails } from '../../shared/graphql/getServiceProvider';
import { createServiceProviderStripe, updateServiceProviderPayment, updateServiceProviderStripe } from '../../shared/graphql/updateServiceProvider';

let keys: Keys = getKeys();

export interface SetupDetails {
  serviceProviderDetailsId: number,
  // orderType: OrderType,
  // acceptedPayments?: Record<PaymentType, boolean>
}
export interface SetupResponse {
  object: string,
  created: number,
  expires_at: number,
  url: string
}
export async function setupServiceProvider(userId: number, setupDetails: SetupDetails): Promise<SetupResponse> {

  let serviceProvider: ServiceProvider = await getServiceProviderDetails(setupDetails.serviceProviderDetailsId)
  let operator: Operator;

  // switch (setupDetails.orderType) {
  //   case OrderType.Restaurant:
  //     serviceProvider = await getRestaurant(setupDetails.serviceProviderId);
  //     break;
  //   case OrderType.Laundry:
  //     serviceProvider = await getLaundryStore(setupDetails.serviceProviderId);
  //     break;
  //   default:
  //     throw new HttpsError(
  //       "internal",
  //       "invalid order type"
  //     );
  // }
  operator = serviceProvider.operators!.filter((o) => o.userId == userId)[0];

  if(!operator) {
    throw new HttpsError(
      "internal",
      "No operator with that user id or service provider id found"
    );
  }
  if(operator.status != AuthorizationStatus.Authorized) {
    throw new HttpsError(
      "internal",
      "operator not authorized"
    );
  }
  const stripeOptions = { apiVersion: <any>'2020-08-27' };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  if(!(serviceProvider.stripeInfo)) {
    let owner;
    owner = serviceProvider.operators?.filter((o) => o.owner == true)[0];
    
    const account = await stripe.accounts.create({
      type: 'standard',
      email: owner?.user?.email ?? operator.user?.email ?? undefined,
      business_type: 'individual',
      business_profile: {
        name: serviceProvider.name,
        support_email: owner?.user?.email ?? operator.user?.email ?? undefined,
        support_phone: owner?.user?.phoneNumber ?? operator.user?.phoneNumber ?? undefined,
        url: `https://mezcalmos.com/?id=${setupDetails.serviceProviderDetailsId}`
      },
      individual: {
        first_name: operator.user?.name ?? undefined,
        email: operator.user?.email ?? undefined,
        phone: operator.user?.phoneNumber ?? undefined,
      },
      country: "mx",
      default_currency: "mxn",
      metadata: {
        id: setupDetails.serviceProviderDetailsId,
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
    createServiceProviderStripe(serviceProvider);

    // switch (setupDetails.orderType) {
    //   case OrderType.Restaurant:
    //     updateRestaurantStripe(serviceProvider);
    //     break;
    //   case OrderType.Laundry:
    //     updateLaundryStripe(serviceProvider);
    //     break;
    //   default:
    //     throw new HttpsError(
    //       "internal",
    //       "invalid order type"
    //     );
    // }
  }

  const accountLink = await stripe.accountLinks.create({
    account: serviceProvider.stripeInfo.id,
    refresh_url: 'https://example.com/reauth',
    return_url: 'https://example.com/return',
    type: 'account_onboarding',
  }, stripeOptions);
  console.log("accountLink: ", accountLink)
  return {
    ...accountLink
  }
}

export interface UpdateDetails {
  serviceProviderDetailsId: number,
  // orderType: OrderType
}

export async function updateServiceProvider(userId: number, updateDetails: UpdateDetails) {
  let serviceProvider = await getServiceProviderDetails(updateDetails.serviceProviderDetailsId);
  let operator = serviceProvider.operators!.filter((o) => o.userId == userId)[0];

  // switch (updateDetails.orderType) {
  //   case OrderType.Restaurant:
  //     serviceProvider = await getRestaurant(updateDetails.serviceProviderId);
  //     break;
  //   case OrderType.Laundry:
  //     serviceProvider = await getLaundryStore(updateDetails.serviceProviderId);
  //     break;
  //   default:
  //     throw new HttpsError(
  //       "internal",
  //       "invalid order type"
  //     );
  // }
  // operator = serviceProvider.operators!.filter((o) => o.userId == userId)[0];

  if(!operator) {
    throw new HttpsError(
      "internal",
      "No operator with that user id or service provider id found"
    );
  }
  if(operator.status != AuthorizationStatus.Authorized) {
    throw new HttpsError(
      "internal",
      "operator not authorized"
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
  updateServiceProviderStripe(serviceProvider)

  if(isWorking) {
    serviceProvider.acceptedPayments![PaymentType.Card] = true
    updateServiceProviderPayment(serviceProvider);
  }
}

export async function verifyCustomerIdForServiceAccount(
  customerInfo: CustomerInfo, 
  serviceProviderId: number, 
  stripe: Stripe, 
  stripeOptions: any
): Promise<CustomerInfo> {
  if(!(customerInfo.stripeInfo)) {
    throw new HttpsError(
      "internal",
      "Customer does not have stripe account"
    );
  }
  if(customerInfo.stripeInfo.idsWithServiceProvider[serviceProviderId] == null) {
    const customer: Stripe.Customer = await stripe.customers.create({
      name: customerInfo.name,
      metadata: { customerId: customerInfo.id },
    }, stripeOptions)
    customerInfo.stripeInfo.idsWithServiceProvider[serviceProviderId] = customer.id;
    updateCustomerStripe(customerInfo);
  }
  return customerInfo;
}