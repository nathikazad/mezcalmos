import Stripe from 'stripe';
import * as functions from "firebase-functions";
import { isSignedIn } from "../../shared/helper/authorizer";
import { ServerResponseStatus, ValidationPass } from '../../shared/models/Generic/Generic';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import * as serviceProviderNodes from '../../shared/databaseNodes/services/serviceProvider';
import { StripeInfo, StripeStatus } from '../../shared/models/Generic/PaymentInfo';
import { OrderType, PaymentType } from '../../shared/models/Generic/Order';
import { AuthData } from 'firebase-functions/lib/common/providers/https';

let keys: Keys = getKeys();


export const setupServiceProvider =
  functions.https.onCall(async (data, context) => {

    let validation: ValidationPass = await passChecksForOperator(data, context.auth);
    if (!validation.ok)
      return validation.error;

    const stripe: Stripe = validation.stripe;
    const stripeOptions = validation.stripeOptions
    const account = await stripe.accounts.create({
      type: 'standard',
      business_type: 'individual',
      business_profile: {
        url: `https://mezcalmos.com/?type=${data.orderType}&id=${data.serviceProviderId}`
      },
      country: "mx",
      default_currency: "mxn",
      metadata: {
        id: data.serviceProviderId,
        type: data.orderType,
        userId: context.auth!.uid
      }
    });
    // add name, link, descriptor, long name, short name, address, id
    serviceProviderNodes.serviceProviderPaymentInfo(data.orderType, data.serviceProviderId).child('stripe').set(<StripeInfo>{
      id: account.id,
      status: StripeStatus.InProcess,
      detailsSubmitted: false,
      payoutsEnabled: false,
      email: null,
      chargesEnabled: false,
      requirements: []
    });

    serviceProviderNodes.serviceProviderPaymentInfo(data.orderType as OrderType, data.serviceProviderId).child(`acceptedPayments/${PaymentType.Card}`).set(true);

    const accountLink = await stripe.accountLinks.create({
      account: account.id,
      refresh_url: 'https://example.com/reauth',
      return_url: 'https://example.com/return',
      type: 'account_onboarding',
    }, stripeOptions);

    return {
      status: ServerResponseStatus.Success,
      ...accountLink
    }
  })

export const updateServiceProvider =
  functions.https.onCall(async (data, context) => {

    let validation: ValidationPass = await passChecksForOperator(data, context.auth);
    if (!validation.ok)
      return validation.error;

    const stripe: Stripe = validation.stripe;
    const stripeOptions = validation.stripeOptions

    let authorized = (await serviceProviderNodes.serviceProviderState(data.orderType, data.serviceProviderId).child("/operators").child(context.auth!.uid).once('value')).val();
    if (!authorized)
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `User not authorized to run this operation`,
        errorCode: "unauthorized"
      }

    let stripeAccount: string = (await serviceProviderNodes.serviceProviderPaymentInfo(data.orderType, data.serviceProviderId).child('stripe/id').once('value')).val()
    const account: Stripe.Account = await stripe.accounts.retrieve(stripeAccount, stripeOptions);
    if (!stripeAccount)
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Account has not setup stripe yet`,
        errorCode: "uncreated"
      }

    let isWorking: boolean = account.details_submitted && account.charges_enabled
    await serviceProviderNodes.serviceProviderPaymentInfo(data.orderType, data.serviceProviderId).child('stripe').update(<StripeInfo>{
      status: isWorking ? StripeStatus.IsWorking : StripeStatus.InProcess,
      detailsSubmitted: account.details_submitted,
      payoutsEnabled: account.payouts_enabled,
      email: account.email,
      chargesEnabled: account.charges_enabled,
      requirements: account.requirements?.currently_due
    });



    return {
      status: ServerResponseStatus.Success
    }
  })

async function passChecksForOperator(data: any, auth?: AuthData): Promise<ValidationPass> {
  let response = await isSignedIn(auth)
  if (response != undefined) {
    return {
      ok: false,
      error: response
    }
  }

  if (data.serviceProviderId == null || data.orderType == null)
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected serviceProviderId and orderType`,
        errorCode: "incorrectParams"
      }
    }

  let authorized = (await serviceProviderNodes.serviceProviderState(data.orderType, data.serviceProviderId).child("/operators").child(auth!.uid).once('value')).val();
  if (!authorized)
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `User not authorized to run this operation`,
        errorCode: "unauthorized"
      }
    }

  let stripeOptions = { apiVersion: <any>'2020-08-27' };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
  return {
    ok: true,
    stripe: stripe,
    stripeOptions: stripeOptions
  }
}
