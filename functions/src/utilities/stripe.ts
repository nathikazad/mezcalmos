import Stripe from 'stripe';
import * as firebase from "firebase-admin";
import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import { ServerResponseStatus, ValidationPass } from '../shared/models/Generic/Generic';
import { getKeys } from '../shared/keys';
import { Keys } from '../shared/models/Generic/Keys';
import * as serviceProviderNodes from '../shared/databaseNodes/services/serviceProvider';
import { PaymentInfo, StripeInfo, StripeStatus } from '../shared/models/Generic/PaymentInfo';
import { Order, OrderType, PaymentType } from '../shared/models/Generic/Order';
import * as customerNodes from '../shared/databaseNodes/customer';
import { userInfoNode } from '../shared/databaseNodes/root';
import { UserInfo } from '../shared/models/Generic/User';
import { AuthData } from 'firebase-functions/lib/common/providers/https';

let keys: Keys = getKeys();

export interface StripePaymentInfo {
  id: string,
  stripeFees: number,
  brand?: string,
  expMonth?: number,
  expYear?: number,
  last4?: string,
}

export const getPaymentIntent =
  functions.https.onCall(async (data, context) => {
    let response = await isSignedIn(context.auth)
    if (response != undefined) {
      return response;
    }

    if (data.customerId == null || data.serviceProviderId == null ||
      data.orderType == null || data.paymentAmount == null) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected customerId, serviceProviderId, orderType and paymentAmount`,
        errorCode: "incorrectParams"
      }
    }
    console.log(data);
    let serviceProviderPaymentInfo: PaymentInfo = (await serviceProviderNodes.serviceProviderPaymentInfo(data.orderType, data.serviceProviderId).once('value')).val()

    if (!serviceProviderPaymentInfo || serviceProviderPaymentInfo.acceptedPayments[PaymentType.Card] == false || serviceProviderPaymentInfo.stripe.id == null || serviceProviderPaymentInfo.stripe.status != StripeStatus.IsWorking) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `This service provider does not accept cards`,
        errorCode: "paymentsNotSupported"
      }
    }

    let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProviderPaymentInfo.stripe.id };
    const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

    let stripeCustomerId: string = (await customerNodes.stripeIdsNode(data.customerId, data.serviceProviderId).once('value')).val();
    if (stripeCustomerId == null) {
      let userInfo: UserInfo = (await userInfoNode(data.customerId).once('value')).val()
      const customer: Stripe.Customer = await stripe.customers.create({
        name: userInfo.name,
        metadata: { customerId: data.customerId }
      }, stripeOptions)
      stripeCustomerId = customer.id;
      customerNodes.stripeIdsNode(data.customerId, data.serviceProviderId).set(stripeCustomerId);
    }



    const ephemeralKey: Stripe.EphemeralKey = await stripe.ephemeralKeys.create(
      { customer: stripeCustomerId },
      stripeOptions
    );

    const paymentIntent: Stripe.PaymentIntent = await stripe.paymentIntents.create({
      amount: data.paymentAmount,
      currency: 'mxn',
      customer: stripeCustomerId,
      capture_method: data.captureMethod || 'automatic'
    }, stripeOptions);

    return {
      status: ServerResponseStatus.Success,
      paymentIntent: paymentIntent.client_secret,
      ephemeralKey: ephemeralKey.secret,
      customer: stripeCustomerId,
      publishableKey: keys.stripe.publickey,
      stripeAccountId: serviceProviderPaymentInfo.stripe.id
    }
  });


export async function updateOrderIdAndFetchPaymentInfo(orderId: string, order: Order, stripePaymentId: string, stripeFees: number) {
  let serviceProviderPaymentInfo: PaymentInfo = (await serviceProviderNodes.serviceProviderPaymentInfo(order.orderType, order.serviceProviderId!).once('value')).val()
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProviderPaymentInfo.stripe.id };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  await stripe.paymentIntents.update(
    stripePaymentId,
    { metadata: { order_id: orderId } },
    stripeOptions
  );

  let pi = await stripe.paymentIntents.retrieve(
    stripePaymentId,
    stripeOptions
  );

  let pm: Stripe.PaymentMethod = await stripe.paymentMethods.retrieve(
    pi.payment_method as string,
    stripeOptions
  );
  order.stripePaymentInfo = {
    id: stripePaymentId,
    stripeFees: stripeFees
  }
  if (pm.card)
    order.stripePaymentInfo = {
      ...order.stripePaymentInfo,
      last4: pm.card!.last4,
      expMonth: pm.card!.exp_month,
      expYear: pm.card!.exp_year,
      brand: pm.card!.brand,
    }
}

export const accountUpdateEventHandler = functions.https.onRequest((request, response) => {

  const endpointSecret = keys.stripe.accountupdatedsigningsecret;
  let sig: string = request.headers["stripe-signature"] as string;

  try {
    let stripeOptions = { apiVersion: <any>'2020-08-27' };
    const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
    let event = stripe.webhooks.constructEvent(request.rawBody, sig, endpointSecret);
    return firebase.database().ref('/events').push(event)
      .then((snapshot) => {
        // Return a successful response to acknowledge the event was processed successfully
        response.json({ received: true });
      })
      .catch((err) => {
        console.error(err) // Catch any errors saving to the database
        return response.status(500).end();
      });
  }
  catch (err) {
    console.log("signing signature failure")
    return response.status(400).end(); // Signing signature failure, return an error 400
  }

});

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

    let isWorking: boolean = account.details_submitted && account.payouts_enabled && account.charges_enabled
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