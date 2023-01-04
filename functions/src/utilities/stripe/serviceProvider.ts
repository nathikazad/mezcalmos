import Stripe from 'stripe';
import { ServerResponseStatus, ValidationPass } from '../../shared/models/Generic/Generic';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import * as serviceProviderNodes from '../../shared/databaseNodes/services/serviceProvider';
import { OrderType, PaymentType } from '../../shared/models/Generic/Order';
import { ServiceProviderStripeInfo, StripeStatus } from './model';
import * as customerNodes from '../../shared/databaseNodes/customer';
import { userInfoNode } from '../../shared/databaseNodes/root';
import { UserInfo } from '../../shared/models/Generic/User';
import { getUserInfo } from '../../shared/controllers/rootController';
let keys: Keys = getKeys();

export async function setupServiceProvider(userId: string, data: any) {
  
  let validation: ValidationPass = await passChecksForOperator(userId, data);
  if (!validation.ok)
    return validation.error;

  if (data.serviceProviderId == null || data.orderType == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected serviceProviderId and orderType`,
      errorCode: "incorrectParams"
    }
  }
  const stripeOptions = { apiVersion: <any>'2020-08-27' };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  const accountId = await getServiceProviderStripeId(data.serviceProviderId, data.orderType, userId, stripe, stripeOptions);

  const accountLink = await stripe.accountLinks.create({
    account: accountId,
    refresh_url: 'https://example.com/reauth',
    return_url: 'https://example.com/return',
    type: 'account_onboarding',
  }, stripeOptions);

  return {
    status: ServerResponseStatus.Success,
    ...accountLink
  }
};

export async function updateServiceProvider(userId: string, data: any) {

  let validation: ValidationPass = await passChecksForOperator(userId, data);
  if (!validation.ok)
    return validation.error;

  if (data.serviceProviderId == null || data.orderType == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected serviceProviderId and orderType`,
      errorCode: "incorrectParams"
    }
  }

  const stripeOptions = { apiVersion: <any>'2020-08-27' };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  let stripeAccount: string = (await serviceProviderNodes.serviceProviderPaymentInfo(data.orderType, data.serviceProviderId).child('stripe/id').once('value')).val()
  const account: Stripe.Account = await stripe.accounts.retrieve(stripeAccount, stripeOptions);
  if (!stripeAccount)
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Account has not setup stripe yet`,
      errorCode: "uncreated"
    }

  let isWorking: boolean = account.details_submitted && account.charges_enabled
  await serviceProviderNodes.serviceProviderPaymentInfo(data.orderType, data.serviceProviderId).child('stripe').update(<ServiceProviderStripeInfo>{
    status: isWorking ? StripeStatus.IsWorking : StripeStatus.InProcess,
    detailsSubmitted: account.details_submitted,
    payoutsEnabled: account.payouts_enabled,
    chargeFeesOnCustomer: null ,
    email: account.email,
    chargesEnabled: account.charges_enabled,
    requirements: account.requirements?.currently_due
  });

  return {
    status: ServerResponseStatus.Success
  }
};


export async function getCustomerIdFromServiceAccount(customerId: string, serviceProviderId: string, orderType: OrderType, stripe: Stripe, stripeOptions: any) {
  let stripeCustomerId: string = (await customerNodes.stripeIdsWithServiceProviderNode(customerId, serviceProviderId, orderType).once('value')).val();
  if (stripeCustomerId == null) {
    let userInfo: UserInfo = (await userInfoNode(customerId).once('value')).val()
    const customer: Stripe.Customer = await stripe.customers.create({
      name: userInfo.name,
      metadata: { customerId: customerId },
    }, stripeOptions)
    stripeCustomerId = customer.id;
    customerNodes.stripeIdsWithServiceProviderNode(customerId, serviceProviderId, orderType).set(stripeCustomerId);
  }
  return stripeCustomerId;
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

async function passChecksForOperator(userId: string, data: any): Promise<ValidationPass> {
  // let response = isSignedIn(userId);
  // if (response != undefined) {
  //   return {
  //     ok: false,
  //     error: response
  //   }
  // }

  if (data.serviceProviderId == null || data.orderType == null)
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected serviceProviderId and orderType`,
        errorCode: "incorrectParams"
      }
    }

  let authorized = (await serviceProviderNodes.serviceProviderState(data.orderType, data.serviceProviderId).child("/operators").child(userId).once('value')).val();
  if (!authorized)
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `User not authorized to run this operation`,
        errorCode: "unauthorized"
      }
    }

  return {
    ok: true
  }
}
