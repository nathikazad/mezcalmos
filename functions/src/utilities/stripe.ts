import Stripe from 'stripe';
import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import { ServerResponseStatus } from '../shared/models/Generic/Generic';
import { getKeys } from '../shared/keys';
import { Keys } from '../shared/models/Generic/Keys';
import * as serviceProviderNodes from '../shared/databaseNodes/services/serviceProvider';
import { PaymentInfo } from '../shared/models/Generic/PaymentInfo';
import { Order, PaymentType } from '../shared/models/Generic/Order';
import { stripeIdsNode } from '../shared/databaseNodes/customer';
import { userInfoNode } from '../shared/databaseNodes/root';
import { UserInfo } from '../shared/models/Generic/User';

let keys: Keys = getKeys();

export interface StripePaymentInfo {
  id: string,
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

  if (!serviceProviderPaymentInfo || serviceProviderPaymentInfo.acceptedPayments[PaymentType.Card] == false || serviceProviderPaymentInfo.stripeId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `This service provider does not accept cards`,
      errorCode: "paymentsNotSupported"
    }
  }

  // remove
  // serviceProviderPaymentInfo.stripeId = "acct_102aka2sNwJeuaBL";

  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProviderPaymentInfo.stripeId };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  let stripeCustomerId = (await stripeIdsNode(data.customerId, data.serviceProviderId).once('value')).val();
  if (stripeCustomerId == null) {
    let userInfo: UserInfo = (await userInfoNode(data.customerId).once('value')).val()
    const customer: Stripe.Customer = await stripe.customers.create({
      name: userInfo.name,
      metadata: { customerId: data.customerId }
    }, stripeOptions)
    stripeCustomerId = customer.id;
    stripeIdsNode(data.customerId, data.serviceProviderId).set(stripeCustomerId);
  }



  const ephemeralKey = await stripe.ephemeralKeys.create(
    { customer: stripeCustomerId },
    stripeOptions
  );
    const paymentIntent: Stripe.PaymentIntent = await stripe.paymentIntents.create({
    amount: data.paymentAmount,
    currency: 'mxn',
    customer: stripeCustomerId,

  }, stripeOptions);

  return {
    status: ServerResponseStatus.Success,
    paymentIntent: paymentIntent.client_secret,
    ephemeralKey: ephemeralKey.secret,
    customer: stripeCustomerId,
    publishableKey: keys.stripe.publickey,
    stripeAccountId: serviceProviderPaymentInfo.stripeId
  }
});



export async function updateOrderIdAndFetchPaymentInfo(orderId: string, order: Order, stripePaymentId: string) {
  let serviceProviderPaymentInfo: PaymentInfo = (await serviceProviderNodes.serviceProviderPaymentInfo(order.orderType, order.serviceProviderId!).once('value')).val()
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProviderPaymentInfo.stripeId };
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
    id: stripePaymentId
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