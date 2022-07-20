import Stripe from 'stripe';
import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import { ServerResponseStatus } from '../shared/models/Generic/Generic';
import { getKeys } from '../shared/keys';
import { Keys } from '../shared/models/Generic/Keys';
import * as serviceProviderNodes from '../shared/databaseNodes/services/serviceProvider';
import { PaymentInfo } from '../shared/models/Generic/PaymentInfo';
import { PaymentType } from '../shared/models/Generic/Order';
import { stripeIdsNode } from '../shared/databaseNodes/customer';
import { userInfoNode } from '../shared/databaseNodes/root';
import { UserInfo } from '../shared/models/Generic/User';

let keys: Keys = getKeys();

export = functions.https.onCall(async (data, context) => {
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
  serviceProviderPaymentInfo.stripeId = "acct_102aka2sNwJeuaBL";

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

  //remove
  stripeCustomerId = 'cus_M5qBJBHZSRicoS';

  const ephemeralKey = await stripe.ephemeralKeys.create(
    { customer: stripeCustomerId },
    stripeOptions
  );
  const paymentIntent = await stripe.paymentIntents.create({
    amount: 1099,
    currency: 'usd',
    customer: stripeCustomerId,

  }, stripeOptions);

  return {
    status: ServerResponseStatus.Success,
    paymentIntent: paymentIntent.client_secret,
    ephemeralKey: ephemeralKey.secret,
    customer: stripeCustomerId,
    publishableKey: keys.stripe.publickey
  }
  return { status: ServerResponseStatus.Success, orderId: data.orderId }
});
