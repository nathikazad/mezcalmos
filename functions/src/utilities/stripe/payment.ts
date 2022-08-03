import Stripe from 'stripe';
import * as functions from "firebase-functions";
import { isSignedIn } from "../../shared/helper/authorizer";
import { ServerResponseStatus } from '../../shared/models/Generic/Generic';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import * as serviceProviderNodes from '../../shared/databaseNodes/services/serviceProvider';
import { PaymentInfo, StripeStatus } from '../../shared/models/Generic/PaymentInfo';
import { Order, PaymentType } from '../../shared/models/Generic/Order';
import * as customerNodes from '../../shared/databaseNodes/customer';
import { userInfoNode } from '../../shared/databaseNodes/root';
import { UserInfo } from '../../shared/models/Generic/User';
import { StripePaymentStatus } from './model';
let keys: Keys = getKeys();


export const getPaymentIntent =
  functions.https.onCall(async (data, context) => {
    let response = await isSignedIn(context.auth)
    if (response != undefined) {
      return response;
    }

    if (data.serviceProviderId == null ||
      data.orderType == null || data.paymentAmount == null) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected customerId, serviceProviderId, orderType and paymentAmount`,
        errorCode: "incorrectParams"
      }
    }

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

    let stripeCustomerId: string = (await customerNodes.stripeIdsNode(context.auth!.uid, data.serviceProviderId).once('value')).val();
    if (stripeCustomerId == null) {
      let userInfo: UserInfo = (await userInfoNode(context.auth!.uid).once('value')).val()
      const customer: Stripe.Customer = await stripe.customers.create({
        name: userInfo.name,
        metadata: { customerId: context.auth!.uid },
      }, stripeOptions)
      stripeCustomerId = customer.id;
      customerNodes.stripeIdsNode(context.auth!.uid, data.serviceProviderId).set(stripeCustomerId);
    }



    const ephemeralKey: Stripe.EphemeralKey = await stripe.ephemeralKeys.create(
      { customer: stripeCustomerId },
      stripeOptions
    );

    const paymentIntent: Stripe.PaymentIntent = await stripe.paymentIntents.create({
      amount: parseInt(data.paymentAmount) * 100,
      currency: 'mxn',
      customer: stripeCustomerId,
      capture_method: 'manual'
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

export async function capturePayment(order: Order, amountToCapture?: number): Promise<Order> {
  let serviceProviderPaymentInfo: PaymentInfo = (await serviceProviderNodes.serviceProviderPaymentInfo(order.orderType, order.serviceProviderId!).once('value')).val()
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProviderPaymentInfo.stripe.id };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
  if (amountToCapture == null) {
    await stripe.paymentIntents.capture(order.stripePaymentInfo!.id, {}, stripeOptions)
    order.stripePaymentInfo!.status = StripePaymentStatus.Captured
  } else if (amountToCapture > 0) {
    await stripe.paymentIntents.capture(order.stripePaymentInfo!.id, {
      amount_to_capture: amountToCapture * 100,
    }, stripeOptions)
    order.stripePaymentInfo!.amountCharged = amountToCapture;
    order.stripePaymentInfo!.status = StripePaymentStatus.Captured
  } else {
    await stripe.paymentIntents.cancel(order.stripePaymentInfo!.id, stripeOptions)
    order.stripePaymentInfo!.amountCharged = 0;
    order.stripePaymentInfo!.status = StripePaymentStatus.Cancelled
  }
  return order;
}

export async function refundPayment(order: Order, amountToRefund: number): Promise<Order> {
  let serviceProviderPaymentInfo: PaymentInfo = (await serviceProviderNodes.serviceProviderPaymentInfo(order.orderType, order.serviceProviderId!).once('value')).val()
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProviderPaymentInfo.stripe.id };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
  await stripe.refunds.create({
    payment_intent: order.stripePaymentInfo!.id,
    amount: amountToRefund * 100,
  }, stripeOptions)
  order.stripePaymentInfo!.amountRefunded += amountToRefund;
  return order;
}

export async function updateOrderIdAndFetchPaymentInfo(orderId: string, order: Order, stripePaymentId: string, stripeFees: number): Promise<Order> {
  let serviceProviderPaymentInfo: PaymentInfo = (await serviceProviderNodes.serviceProviderPaymentInfo(order.orderType, order.serviceProviderId!).once('value')).val()
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProviderPaymentInfo.stripe.id };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  await stripe.paymentIntents.update(
    stripePaymentId,
    { metadata: { orderId: orderId, orderType: order.orderType, serviceProviderId: order.serviceProviderId ?? "unknown" } },
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
    stripeFees: stripeFees,
    amountCharged: pi.amount / 100,
    amountRefunded: 0,
    status: StripePaymentStatus.Authorized,
    serviceProviderAccount: serviceProviderPaymentInfo.stripe.id!
  }
  if (pm.card)
    order.stripePaymentInfo = {
      ...order.stripePaymentInfo,
      last4: pm.card!.last4,
      expMonth: pm.card!.exp_month,
      expYear: pm.card!.exp_year,
      brand: pm.card!.brand,
    }
  return order
}
