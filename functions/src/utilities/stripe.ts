import Stripe from 'stripe';
import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import { ServerResponseStatus } from '../shared/models/Generic/Generic';
import { getKeys } from '../shared/keys';
import { Keys } from '../shared/models/Generic/Keys';
import * as serviceProviderNodes from '../shared/databaseNodes/services/serviceProvider';
import { PaymentInfo, StripeInfo, StripeStatus } from '../shared/models/Generic/PaymentInfo';
import { Order, OrderType, PaymentType } from '../shared/models/Generic/Order';
import * as customerNodes from '../shared/databaseNodes/customer';
import { userInfoNode } from '../shared/databaseNodes/root';
import { UserInfo } from '../shared/models/Generic/User';

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

export const setupServiceProvider =
  functions.https.onCall(async (data, context) => {

    let response = await isSignedIn(context.auth)
    if (response != undefined) {
      return response;
    }

    if (data.serviceProviderId == null || data.orderType == null
      || data.redirectUrl == null) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected redirectUrl`,
        errorCode: "incorrectParams"
      }
    }

    let authorized = (await serviceProviderNodes.serviceProviderState(data.orderType, data.serviceProviderId).child("/operators").child(context.auth!.uid).once('value')).val();
    if (!authorized)
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `User not authorized to run this operation`,
        errorCode: "unauthorized"
    }

    let stripeOptions = { apiVersion: <any>'2020-08-27' };
    const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

    const account = await stripe.accounts.create({ type: 'standard' }, stripeOptions);

    serviceProviderNodes.serviceProviderPaymentInfo(data.orderType, data.serviceProviderId).child('stripe').set(<StripeInfo>{
      id: account.id,
      status: StripeStatus.InProcess
    });

    serviceProviderNodes.serviceProviderPaymentInfo(data.orderType as OrderType, data.serviceProviderId).child(`acceptedPayments/${PaymentType.Card}`).set(true);

    const accountLink = await stripe.accountLinks.create({
      account: account.id,
      refresh_url: 'https://example.com/reauth',
      return_url: data.redirectUrl,
      type: 'account_onboarding',
    }, stripeOptions);

    return {
      status: ServerResponseStatus.Success,
      ...accountLink
    }
  })


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