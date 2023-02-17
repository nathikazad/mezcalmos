import Stripe from 'stripe';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import { CustomerCard, StripeStatus } from './model';
import { PaymentType } from '../../shared/models/Generic/Order';
import { getCustomer } from '../../shared/graphql/user/customer/getCustomer';
import { updateCustomerStripe } from '../../shared/graphql/user/customer/updateCustomer';
import { HttpsError } from 'firebase-functions/v1/auth';
import { getCustomerRestaurantOrders } from '../../shared/graphql/restaurant/order/getRestaurantOrder';
import { RestaurantOrder, RestaurantOrderStatus } from '../../shared/models/Services/Restaurant/RestaurantOrder';
import { CustomerInfo } from '../../shared/models/Generic/User';
import { verifyCustomerIdForServiceAccount } from './serviceProvider';
import { ServiceProvider } from '../../shared/models/Services/Service';
import { getCustomerLaundryOrders } from '../../shared/graphql/laundry/order/getLaundryOrder';
import { LaundryOrder, LaundryOrderStatus } from '../../shared/models/Services/Laundry/LaundryOrder';
import { getServiceProviderDetails } from '../../shared/graphql/getServiceProvider';
let keys: Keys = getKeys();

export interface CardDetails {
  paymentMethod: string,
}
export interface AddCardResponse {
  cardId: string
}
export async function addCard(userId: number, cardDetails: CardDetails): Promise<AddCardResponse> {

  let stripeOptions = { apiVersion: <any>'2020-08-27' };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
  let customer = await getCustomer(userId);
  customer = await verifyCustomerStripeInfo(customer, stripe)

  const paymentMethod: Stripe.PaymentMethod = await stripe.paymentMethods.attach(
    cardDetails.paymentMethod,
    { customer: customer.stripeInfo!.id },
    stripeOptions
  );
  customer.stripeInfo!.cards = customer.stripeInfo!.cards ?? {}
  customer.stripeInfo!.cards[paymentMethod.id] = {
    cardId: paymentMethod.id,
    last4: paymentMethod.card?.last4,
    brand: paymentMethod.card?.brand,
    expMonth: paymentMethod.card?.exp_month,
    expYear: paymentMethod.card?.exp_year,
    idsWithServiceProvider: {}
  };
  updateCustomerStripe(customer);

  return {
    cardId: paymentMethod.id
  }
};

export interface ChargeCardDetails {
  serviceProviderDetailsId: number,
  cardId: string,
  
  paymentAmount: number
}
export interface ChargeCardResponse {
  paymentIntent: string | null,
  customer: string,
  publishableKey: string,
  stripeAccountId: string
}
export async function chargeCard(userId: number, chargeCardDetails: ChargeCardDetails): Promise<ChargeCardResponse> {

  
  let serviceProvider: ServiceProvider = await getServiceProviderDetails(chargeCardDetails.serviceProviderDetailsId)
  // switch (chargeCardDetails.orderType) {
  //   case OrderType.Restaurant:
  //     serviceProvider = await getRestaurant(chargeCardDetails.serviceProviderDetailsId);
  //     break;
  //   case OrderType.Laundry:
  //     serviceProvider = await getLaundryStore(chargeCardDetails.serviceProviderDetailsId);
  //     break;
  //   default:
  //     throw new HttpsError(
  //       "internal",
  //       "invalid order type"
  //     );
  // }
  if (!(serviceProvider.stripeInfo)
    || !(serviceProvider.acceptedPayments)
    || serviceProvider.acceptedPayments[PaymentType.Card] == false
    || serviceProvider.stripeInfo.status != StripeStatus.IsWorking
  ) {
    throw new HttpsError(
      "internal",
      "This service provider does not accept cards"
    );
  }
  let stripeOptionsDefault = { apiVersion: <any>'2020-08-27' };
  let stripe = new Stripe(keys.stripe.secretkey, stripeOptionsDefault);
  let customer: CustomerInfo = await getCustomer(userId);
  customer = await verifyCustomerStripeInfo(customer, stripe);

  if(customer.stripeInfo!.cards[chargeCardDetails.cardId] == undefined) {
    throw new HttpsError(
      "internal",
      "There is no card with this key"
    );
  }
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
  stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  customer = await verifyCustomerIdForServiceAccount(
    customer, 
    chargeCardDetails.serviceProviderDetailsId,
    stripe, 
    stripeOptions
  );
  let stripeCustomerId: string = customer.stripeInfo!.idsWithServiceProvider[chargeCardDetails.serviceProviderDetailsId];
  let card: CustomerCard = await verifyCardForServiceAccount(customer, chargeCardDetails.cardId, chargeCardDetails.serviceProviderDetailsId, stripeCustomerId, stripe, stripeOptions);
  let stripeCardId: string = card.idsWithServiceProvider[chargeCardDetails.serviceProviderDetailsId];

  const paymentIntent = await stripe.paymentIntents.create(
    {
      amount: chargeCardDetails.paymentAmount * 100,
      currency: 'mxn',
      payment_method_types: ['card'],
      customer: stripeCustomerId,
      capture_method: 'manual',
      payment_method: stripeCardId,
    },
    stripeOptions
  );

  if (paymentIntent.status == 'requires_confirmation') {
    await stripe.paymentIntents.confirm(paymentIntent.id, stripeOptions);
  }
  return {
    paymentIntent: paymentIntent.client_secret,
    customer: stripeCustomerId,
    publishableKey: keys.stripe.publickey,
    stripeAccountId: serviceProvider.stripeInfo.id
  }
};
export interface RemoveCardDetails {
  cardId: string,
}
export async function removeCard(userId: number, removeCardDetails: RemoveCardDetails) {

  let response = await Promise.all([getCustomerRestaurantOrders(userId), getCustomerLaundryOrders(userId)])
  let restaurantOrders: RestaurantOrder[] = response[0];
  let laundryOrders: LaundryOrder[] = response[1];
  restaurantOrders.filter((o) => ((o.status != RestaurantOrderStatus.Delivered) 
    && (o.status != RestaurantOrderStatus.CancelledByAdmin)
    && (o.status != RestaurantOrderStatus.CancelledByCustomer)
  ))
  laundryOrders.filter((o) => ((o.status != LaundryOrderStatus.Delivered) 
    && (o.status != LaundryOrderStatus.CancelledByAdmin)
    && (o.status != LaundryOrderStatus.CancelledByCustomer)
  ))
  if(restaurantOrders.length || laundryOrders.length) {
    throw new HttpsError(
      "internal",
      "Can't remove cards with in process orders, please wait till you finish your order"
    );
  }
  let customer = await getCustomer(userId);
  if (!(customer.stripeInfo)
    || !(customer.stripeInfo.cards) 
    || !(customer.stripeInfo.cards[removeCardDetails.cardId])
  ) {
    throw new HttpsError(
      "internal",
      "There is no card with this key"
    );
  }
  const card: CustomerCard = customer.stripeInfo.cards[removeCardDetails.cardId]

  const stripe = new Stripe(keys.stripe.secretkey, { apiVersion: <any>'2020-08-27' });
  await stripe.paymentMethods.detach(
    card.cardId,
    { apiVersion: <any>'2020-08-27' }
  );
    for (let serviceProviderDetailsId in card.idsWithServiceProvider) {
      let clonedCardId = card.idsWithServiceProvider[serviceProviderDetailsId];
      let serviceProvider: ServiceProvider = await getServiceProviderDetails(parseInt(serviceProviderDetailsId))
      // switch (orderType) {
      //   case OrderType.Restaurant:
      //     serviceProvider = await getRestaurant(parseInt(serviceProviderDetailsId));
      //     break;
      //   case OrderType.Laundry:
      //     serviceProvider = await getLaundryStore(parseInt(serviceProviderDetailsId));
      //     break;
      //   default:
      //     throw new HttpsError(
      //       "internal",
      //       "invalid order type"
      //     );
      // }
      
      if (!clonedCardId || !(serviceProvider.stripeInfo))
        continue
      let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
      const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
      await stripe.paymentMethods.detach(
        clonedCardId,
        stripeOptions
      );
    }
  delete customer.stripeInfo.cards[removeCardDetails.cardId];
  await updateCustomerStripe(customer);
};

export async function verifyCustomerStripeInfo(customerInfo: CustomerInfo, stripe: Stripe): Promise<CustomerInfo> {

  if(!(customerInfo.stripeInfo)) {
    const customer: Stripe.Customer = await stripe.customers.create({
      name: customerInfo.name,
      metadata: { customerId: customerInfo.id },
    })
    customerInfo.stripeInfo = {
      id: customer.id,
      cards: {},
      idsWithServiceProvider: {}
    }
    updateCustomerStripe(customerInfo);
  }
  return customerInfo;
}

export async function verifyCardForServiceAccount(customer: CustomerInfo, cardId: string, serviceProviderDetailsId: number, stripeCustomerServiceAccountId: string, stripe: Stripe, stripeOptions: any): Promise<CustomerCard> {

  if(!(customer.stripeInfo)) {
    throw new HttpsError(
      "internal",
      "Customer does not have stripe account"
    );
  }
  if(customer.stripeInfo!.cards[cardId] == null) {
    throw new HttpsError(
      "internal",
      "There is no card with this key"
    );
  }
  let card: CustomerCard = customer.stripeInfo!.cards[cardId];

  if(card.idsWithServiceProvider[serviceProviderDetailsId] == null) {
    const clonedPaymentMethod = await stripe.paymentMethods.create({
      customer: customer.stripeInfo.id,
      payment_method: card.cardId,
    }, stripeOptions);
  
    const paymentMethod = await stripe.paymentMethods.attach(
      clonedPaymentMethod.id,
      { customer: stripeCustomerServiceAccountId },
      stripeOptions
    );
    card.idsWithServiceProvider[serviceProviderDetailsId] = paymentMethod.id;

    customer.stripeInfo.cards[cardId] = card;
    updateCustomerStripe(customer);
  }
  return card;
}