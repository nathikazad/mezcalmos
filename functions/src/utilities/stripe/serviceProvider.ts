import Stripe from 'stripe';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import { PaymentType } from '../../shared/models/Generic/Order';
import { StripeStatus } from './model';
import { CustomerInfo } from '../../shared/models/Generic/User';
import { updateCustomerStripe } from '../../shared/graphql/user/customer/updateCustomer';
import { Operator, ServiceProvider } from '../../shared/models/Services/Service';
import { AuthorizationStatus, MezError } from "../../shared/models/Generic/Generic"
import { getServiceProviderDetails } from '../../shared/graphql/getServiceProvider';
import { createServiceProviderStripe, updateServiceProviderPayment, updateServiceProviderStripe } from '../../shared/graphql/updateServiceProvider';

let keys: Keys = getKeys();

export interface SetupStripeDetails {
  serviceProviderDetailsId: number,
}
export interface SetupStripeResponse {
  success: boolean,
  error?: SetupStripeError
  unhandledError?: string,
  object?: string,
  created?: number,
  expires_at?: number,
  url?: string
}
export enum SetupStripeError {
  UnhandledError = "unhandledError",
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  UnauthorizedAccess = "unauthorizedAccess",
  OperatorNotAuthorized = "operatorNotAuthorized",
  StripeUpdateError = "stripeUpdateError",
}
export async function setupServiceProvider(userId: number, setupDetails: SetupStripeDetails): Promise<SetupStripeResponse> {
  try {
    let serviceProvider: ServiceProvider = await getServiceProviderDetails(setupDetails.serviceProviderDetailsId)
    if(serviceProvider.operators!.filter((o) => o.userId == userId).length == 0) {
      throw new MezError(SetupStripeError.UnauthorizedAccess);
    }
    let operator: Operator = serviceProvider.operators!.filter((o) => o.userId == userId)[0];
    
    if(operator.status != AuthorizationStatus.Authorized) {
      throw new MezError(SetupStripeError.OperatorNotAuthorized);
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
        chargeFeesOnCustomer : true,
        email: null,
        chargesEnabled: false,
        requirements: []
      }
      createServiceProviderStripe(serviceProvider);

    }

    const accountLink = await stripe.accountLinks.create({
      account: serviceProvider.stripeInfo.id,
      refresh_url: 'https://example.com/reauth',
      return_url: 'https://example.com/return',
      type: 'account_onboarding',
    }, stripeOptions);
    console.log("accountLink: ", accountLink)

    return {
      success: true,
      ...accountLink
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(SetupStripeError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: SetupStripeError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
}

export interface UpdateStripeDetails {
  serviceProviderDetailsId: number,
}
export interface UpdateStripeResponse {
  success: boolean,
  error?: UpdateStripeError
  unhandledError?: string,
}
export enum UpdateStripeError {
  UnhandledError = "unhandledError",
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  UnauthorizedAccess = "unauthorizedAccess",
  OperatorNotAuthorized = "operatorNotAuthorized",
  NoStripeAccount = "noStripeAccount"
}
export async function updateServiceProvider(userId: number, updateDetails: UpdateStripeDetails): Promise<UpdateStripeResponse> {
  try {
    let serviceProvider: ServiceProvider = await getServiceProviderDetails(updateDetails.serviceProviderDetailsId);

    if(serviceProvider.operators!.filter((o) => o.userId == userId).length == 0) {
      throw new MezError(UpdateStripeError.UnauthorizedAccess);
    }
    let operator: Operator = serviceProvider.operators!.filter((o) => o.userId == userId)[0];

    if(operator.status != AuthorizationStatus.Authorized) {
      throw new MezError(UpdateStripeError.OperatorNotAuthorized);
    }
    
    const stripeOptions = { apiVersion: <any>'2020-08-27' };
    const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

    let stripeInfo = serviceProvider.stripeInfo;
    if(!stripeInfo) {
      throw new MezError(UpdateStripeError.NoStripeAccount);
    }
    const account: Stripe.Account = await stripe.accounts.retrieve(stripeInfo.id, stripeOptions);
    let isWorking: boolean = account.details_submitted && account.charges_enabled;

    serviceProvider.stripeInfo = {
      id: stripeInfo.id,
      status: isWorking ? StripeStatus.IsWorking : StripeStatus.InProcess,
      detailsSubmitted: account.details_submitted,
      payoutsEnabled: account.payouts_enabled,
      chargeFeesOnCustomer: true,
      email: account.email,
      chargesEnabled: account.charges_enabled,
      requirements: account.requirements?.currently_due
    }
    updateServiceProviderStripe(serviceProvider.stripeInfo)

    if(isWorking) {
      serviceProvider.acceptedPayments![PaymentType.Card] = true
      updateServiceProviderPayment(serviceProvider);
    }
    return {
      success: true
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(UpdateStripeError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: UpdateStripeError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
}

export async function verifyCustomerIdForServiceAccount(
  customerInfo: CustomerInfo, 
  serviceProviderDetailsId: number, 
  stripe: Stripe, 
  stripeOptions: any
): Promise<CustomerInfo> {
  if(!(customerInfo.stripeInfo)) {
    throw new MezError("noCustomerStripeInfo");
  }
  if(customerInfo.stripeInfo.idsWithServiceProvider[serviceProviderDetailsId] == null) {
    const customer: Stripe.Customer = await stripe.customers.create({
      name: customerInfo.name,
      metadata: { customerId: customerInfo.id },
    }, stripeOptions)
    customerInfo.stripeInfo.idsWithServiceProvider[serviceProviderDetailsId] = customer.id;
    updateCustomerStripe(customerInfo);
  }
  return customerInfo;
}