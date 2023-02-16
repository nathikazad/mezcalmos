import Stripe from 'stripe';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import { OrderType, PaymentType } from '../../shared/models/Generic/Order';
import { OrderStripeInfo, StripePaymentStatus, StripeStatus } from './model';
import { verifyCustomerIdForServiceAccount } from './serviceProvider';
import { HttpsError } from 'firebase-functions/v1/auth';
import { verifyCustomerStripeInfo } from './card';
import { updateRestaurantOrderStripe } from '../../shared/graphql/restaurant/order/updateOrder';
import { getCustomer } from '../../shared/graphql/user/customer/getCustomer';
import { CustomerInfo } from '../../shared/models/Generic/User';
import { ServiceProvider, ServiceProviderType } from '../../shared/models/Services/Service';
import { updateLaundryOrderStripe } from '../../shared/graphql/laundry/order/updateOrder';
import { getServiceProviderDetails } from '../../shared/graphql/getServiceProvider';

let keys: Keys = getKeys();

export interface PaymentIntentDetails {
  serviceProviderId: number,
  paymentAmount: number,
}
export interface PaymentIntentResponse {
  paymentIntent: string | null,
  ephemeralKey?: string,
  customer?: string,
  publishableKey: string,
  stripeAccountId: string
}
export async function getPaymentIntent(userId: number, paymentIntentDetails: PaymentIntentDetails): Promise<PaymentIntentResponse> {

  let serviceProvider: ServiceProvider = await getServiceProviderDetails(paymentIntentDetails.serviceProviderId)

  // switch (paymentIntentDetails.orderType) {
  //   case OrderType.Restaurant:
  //     serviceProvider = await getRestaurant(paymentIntentDetails.serviceProviderId);
  //     break;
  //   case OrderType.Laundry:
  //     serviceProvider = await getLaundryStore(paymentIntentDetails.serviceProviderId);
  //     break;
  //   default:
  //     throw new HttpsError(
  //       "internal",
  //       "invalid order type"
  //     );
  // }
  if (!(serviceProvider.acceptedPayments)
    || serviceProvider.acceptedPayments[PaymentType.Card] == false
    || serviceProvider.stripeInfo == null 
    || serviceProvider.stripeInfo.status != StripeStatus.IsWorking
  ) {
    throw new HttpsError(
      "internal",
      "This service provider does not accept cards, apple pay or google pay"
    );
  }
  let stripeOptionsDefault = { apiVersion: <any>'2020-08-27' };
  let stripe = new Stripe(keys.stripe.secretkey, stripeOptionsDefault);
  let customer: CustomerInfo = await getCustomer(userId);
  customer = await verifyCustomerStripeInfo(customer, stripe);

  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
  stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
  customer = await verifyCustomerIdForServiceAccount(
    customer, 
    paymentIntentDetails.serviceProviderId,
    stripe,
    stripeOptions
  )
  let stripeCustomerId = customer.stripeInfo?.idsWithServiceProvider[paymentIntentDetails.serviceProviderId];
  const ephemeralKey: Stripe.EphemeralKey = await stripe.ephemeralKeys.create(
    { customer: stripeCustomerId },
    stripeOptions
  );

  const paymentIntent: Stripe.PaymentIntent = await stripe.paymentIntents.create({
    amount: paymentIntentDetails.paymentAmount * 100,
    currency: 'mxn',
    customer: stripeCustomerId,
    capture_method: 'manual'
  }, stripeOptions);

  return <PaymentIntentResponse> {
    paymentIntent: paymentIntent.client_secret,
    ephemeralKey: ephemeralKey.secret,
    customer: stripeCustomerId,
    publishableKey: keys.stripe.publickey,
    stripeAccountId: serviceProvider.stripeInfo.id
  }
}
export interface PaymentDetails {
  serviceProviderId: number,
  orderId: number,
  orderStripePaymentInfo?: OrderStripeInfo,
}
export async function capturePayment(paymentDetails: PaymentDetails, amountToCapture?: number) {

  let serviceProvider: ServiceProvider = await getServiceProviderDetails(paymentDetails.serviceProviderId)
  if(!(paymentDetails.orderStripePaymentInfo)) {
    throw new HttpsError(
      "internal",
      "Order stripe payment info is undefined"
    );
  }
  // switch (paymentDetails.orderType) {
  //   case OrderType.Restaurant:
  //     serviceProvider = await getRestaurant(paymentDetails.serviceProviderId);
  //     break;
  //   case OrderType.Laundry:
  //     serviceProvider = await getLaundryStore(paymentDetails.serviceProviderId);
  //     break;
  //   default:
  //     throw new HttpsError(
  //       "internal",
  //       "invalid order type"
  //     );
  // }
  if(!(serviceProvider.stripeInfo)) {
    throw new HttpsError(
      "internal",
      "Service provider does not have a stripe account"
    );
  }
  
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
  if (amountToCapture == null) {
    await stripe.paymentIntents.capture(paymentDetails.orderStripePaymentInfo.id, {}, stripeOptions)
    paymentDetails.orderStripePaymentInfo.status = StripePaymentStatus.Captured
  } else if (amountToCapture > 0) {
    await stripe.paymentIntents.capture(paymentDetails.orderStripePaymentInfo.id, {
      amount_to_capture: amountToCapture * 100,
    }, stripeOptions)
    paymentDetails.orderStripePaymentInfo.amountCharged = amountToCapture;
    paymentDetails.orderStripePaymentInfo.status = StripePaymentStatus.Captured
  } else {
    await stripe.paymentIntents.cancel(paymentDetails.orderStripePaymentInfo.id, stripeOptions)
    paymentDetails.orderStripePaymentInfo.amountCharged = 0;
    paymentDetails.orderStripePaymentInfo.status = StripePaymentStatus.Cancelled
  }
  switch (serviceProvider.serviceProviderType) {
    case ServiceProviderType.Restaurant:
      updateRestaurantOrderStripe(paymentDetails.orderId, paymentDetails.orderStripePaymentInfo);
      break;
    case ServiceProviderType.Laundry:
      updateLaundryOrderStripe(paymentDetails.orderId, paymentDetails.orderStripePaymentInfo);
      break;
    default:
      break;
  }
}

export async function refundPayment(paymentDetails: PaymentDetails, amountToRefund: number) {

  let serviceProvider: ServiceProvider = await getServiceProviderDetails(paymentDetails.orderId)
  if(!(paymentDetails.orderStripePaymentInfo)) {
    throw new HttpsError(
      "internal",
      "Order stripe payment info is undefined"
    );
  }
  // switch (paymentDetails.orderType) {
  //   case OrderType.Restaurant:
  //     serviceProvider = await getRestaurant(paymentDetails.serviceProviderId);
  //     break;
  //   case OrderType.Laundry:
  //     serviceProvider = await getLaundryStore(paymentDetails.serviceProviderId);
  //     break;
  //   default:
  //     throw new HttpsError(
  //       "internal",
  //       "invalid order type"
  //     );
  // }
  if(!(serviceProvider.stripeInfo)) {
    throw new HttpsError(
      "internal",
      "Service provider does not have a stripe account"
    );
  }
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
  await stripe.refunds.create({
    payment_intent: paymentDetails.orderStripePaymentInfo.id,
    amount: amountToRefund * 100,
  }, stripeOptions)
  paymentDetails.orderStripePaymentInfo.amountRefunded += amountToRefund;

  switch (serviceProvider.serviceProviderType) {
    case ServiceProviderType.Restaurant:
      updateRestaurantOrderStripe(paymentDetails.orderId, paymentDetails.orderStripePaymentInfo);
      break;
    case ServiceProviderType.Laundry:
      updateLaundryOrderStripe(paymentDetails.orderId, paymentDetails.orderStripePaymentInfo);
      break;
    default:
      break;
  }

}

export async function updateOrderIdAndFetchPaymentInfo(
  paymentDetails: PaymentDetails, 
  stripePaymentId: string, 
  stripeFees: number
) {
  let serviceProvider: ServiceProvider = await getServiceProviderDetails(paymentDetails.serviceProviderId);
  // if(!(paymentDetails.serviceProviderId)) {
  //   throw new HttpsError(
  //     "internal",
  //     "Order service provider id is undefined"
  //   );
  // }
  let orderType: OrderType;
  switch (serviceProvider.serviceProviderType) {
    case ServiceProviderType.Restaurant:
      orderType = OrderType.Restaurant
      break;
    case ServiceProviderType.Laundry:
      orderType = OrderType.Laundry
      break;
    default:
      throw new HttpsError(
        "internal",
        "invalid order type"
      );
  }
  if(!(serviceProvider.stripeInfo)) {
    throw new HttpsError(
      "internal",
      "Service provider does not have a stripe account"
    );
  }
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  await stripe.paymentIntents.update(
    stripePaymentId,
    { metadata: { 
      orderId: paymentDetails.orderId, 
      orderType: orderType, 
      serviceProviderId: paymentDetails.serviceProviderId ?? "unknown" 
    } },
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
  paymentDetails.orderStripePaymentInfo = {
    id: stripePaymentId,
    stripeFees: stripeFees,
    chargeFeesOnCustomer : serviceProvider.stripeInfo.chargeFeesOnCustomer,
    amountCharged: pi.amount / 100,
    amountRefunded: 0,
    status: StripePaymentStatus.Authorized,
    serviceProviderAccount: serviceProvider.stripeInfo.id
  }
  if (pm.card)
    paymentDetails.orderStripePaymentInfo = {
      ...paymentDetails.orderStripePaymentInfo,
      last4: pm.card.last4,
      expMonth: pm.card.exp_month,
      expYear: pm.card.exp_year,
      brand: pm.card.brand,
    }

  switch (orderType) {
    case OrderType.Restaurant:
      updateRestaurantOrderStripe(paymentDetails.orderId, paymentDetails.orderStripePaymentInfo);
      break;
    case OrderType.Laundry:
      updateLaundryOrderStripe(paymentDetails.orderId, paymentDetails.orderStripePaymentInfo);
      break;
    default:
      break;
  }
}
