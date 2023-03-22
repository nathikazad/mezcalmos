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
import { MezError } from '../../shared/models/Generic/Generic';

let keys: Keys = getKeys();
 
export interface PaymentIntentDetails {
  serviceProviderDetailsId: number,
  paymentAmount: number,
}
export interface PaymentIntentResponse {
  success: boolean,
  error?: PaymentIntentError
  unhandledError?: string,
  paymentIntent?: string | null,
  ephemeralKey?: string,
  customer?: string,
  publishableKey?: string,
  stripeAccountId?: string
}
enum PaymentIntentError {
  ServiceProviderDetailsNotFound = 'serviceProviderDetailsNotFound',
  CardNotAccepted = "cardNotAccepted",
  StripeNotWorking = "stripeNotWorking",
  CustomerNotFound = "customerNotFound",
  NoCustomerStripeInfo = "noCustomerStripeInfo",
  CustomerUpdateError = "customerUpdateError",
}
export async function getPaymentIntent(userId: number, paymentIntentDetails: PaymentIntentDetails): Promise<PaymentIntentResponse> {
  try {
    let serviceProvider: ServiceProvider = await getServiceProviderDetails(paymentIntentDetails.serviceProviderDetailsId)

    if (!(serviceProvider.acceptedPayments) || serviceProvider.acceptedPayments[PaymentType.Card] == false) {
      throw new MezError(PaymentIntentError.CardNotAccepted);
    }
    if (serviceProvider.stripeInfo == null || serviceProvider.stripeInfo.status != StripeStatus.IsWorking) {
      throw new MezError(PaymentIntentError.StripeNotWorking);
    }
    let stripeOptionsDefault = { apiVersion: <any>'2020-08-27' };
    let stripe = new Stripe(keys.stripe.secretkey, stripeOptionsDefault);
    let customer: CustomerInfo = await getCustomer(userId);
    customer = await verifyCustomerStripeInfo(customer, stripe);

    let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
    stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
    customer = await verifyCustomerIdForServiceAccount(
      customer, 
      paymentIntentDetails.serviceProviderDetailsId,
      stripe,
      stripeOptions
    )
    let stripeCustomerId = customer.stripeInfo?.idsWithServiceProvider[paymentIntentDetails.serviceProviderDetailsId];
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
      success: true,
      paymentIntent: paymentIntent.client_secret,
      ephemeralKey: ephemeralKey.secret,
      customer: stripeCustomerId,
      publishableKey: keys.stripe.publickey,
      stripeAccountId: serviceProvider.stripeInfo.id
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(PaymentIntentError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
}
export interface PaymentDetails {
  serviceProviderDetailsId: number,
  orderId: number,
  orderStripePaymentInfo?: OrderStripeInfo,
}
export async function capturePayment(paymentDetails: PaymentDetails, amountToCapture?: number) {

  let serviceProvider: ServiceProvider = await getServiceProviderDetails(paymentDetails.serviceProviderDetailsId)
  if(!(paymentDetails.orderStripePaymentInfo)) {
    throw new MezError("orderStripeInfoNotDefined");
  }
  // switch (paymentDetails.orderType) {
  //   case OrderType.Restaurant:
  //     serviceProvider = await getRestaurant(paymentDetails.serviceProviderDetailsId);
  //     break;
  //   case OrderType.Laundry:
  //     serviceProvider = await getLaundryStore(paymentDetails.serviceProviderDetailsId);
  //     break;
  //   default:
  //     throw new HttpsError(
  //       "internal",
  //       "invalid order type"
  //     );
  // }
  if(!(serviceProvider.stripeInfo)) {
    throw new MezError("serviceProviderStripeAccountDoesNotExist");
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
  //     serviceProvider = await getRestaurant(paymentDetails.serviceProviderDetailsId);
  //     break;
  //   case OrderType.Laundry:
  //     serviceProvider = await getLaundryStore(paymentDetails.serviceProviderDetailsId);
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
  let serviceProvider: ServiceProvider = await getServiceProviderDetails(paymentDetails.serviceProviderDetailsId);
  // if(!(paymentDetails.serviceProviderDetailsId)) {
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
      throw new MezError("invalidOrderType");

  }
  if(!(serviceProvider.stripeInfo)) {
    throw new MezError("noStripeAccountOfServiceProvider");
  }
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  await stripe.paymentIntents.update(
    stripePaymentId,
    { metadata: { 
      orderId: paymentDetails.orderId,
      serviceProviderId: paymentDetails.serviceProviderDetailsId ?? "unknown" 
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
