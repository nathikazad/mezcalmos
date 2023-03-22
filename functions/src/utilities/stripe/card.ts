import Stripe from 'stripe';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import { CustomerCard, StripeStatus } from './model';
import { PaymentType } from '../../shared/models/Generic/Order';
import { getCustomer } from '../../shared/graphql/user/customer/getCustomer';
import { updateCustomerStripe } from '../../shared/graphql/user/customer/updateCustomer';
import { getCustomerRestaurantOrders } from '../../shared/graphql/restaurant/order/getRestaurantOrder';
import { RestaurantOrder, RestaurantOrderStatus } from '../../shared/models/Services/Restaurant/RestaurantOrder';
import { CustomerInfo } from '../../shared/models/Generic/User';
import { verifyCustomerIdForServiceAccount } from './serviceProvider';
import { ServiceProvider } from '../../shared/models/Services/Service';
import { getCustomerLaundryOrders } from '../../shared/graphql/laundry/order/getLaundryOrder';
import { LaundryOrder, LaundryOrderStatus } from '../../shared/models/Services/Laundry/LaundryOrder';
import { getServiceProviderDetails } from '../../shared/graphql/getServiceProvider';
import { MezError } from '../../shared/models/Generic/Generic';
let keys: Keys = getKeys();

export interface CardDetails {
  paymentMethod: string,
}
export interface AddCardResponse {
  success: boolean,
  error?: AddCardError
  unhandledError?: string,
  cardId?: string
}
enum AddCardError {
  CustomerNotFound = "customerNotFound",
  NoCustomerStripeInfo = "noCustomerStripeInfo",
  CustomerUpdateError = "customerUpdateError",
}
export async function addCard(userId: number, cardDetails: CardDetails): Promise<AddCardResponse> {
  try {
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
      success: true,
      cardId: paymentMethod.id
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(AddCardError).includes(e.message as any)) {
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
};

export interface ChargeCardDetails {
  serviceProviderDetailsId: number,
  cardId: string,
  
  paymentAmount: number
}
export interface ChargeCardResponse {
  success: boolean,
  error?: AddCardError
  unhandledError?: string,
  paymentIntent?: string | null,
  customer?: string,
  publishableKey?: string,
  stripeAccountId?: string
}
enum ChargeCardError {
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  CardNotAccepted = "cardNotAccepted",
  StripeNotWorking = "stripeNotWorking",
  CustomerNotFound = "customerNotFound",
  NoCustomerStripeInfo = "noCustomerStripeInfo",
  CustomerUpdateError = "customerUpdateError",
  CardNotFound = "cardNotFound"
}
export async function chargeCard(userId: number, chargeCardDetails: ChargeCardDetails): Promise<ChargeCardResponse> {
  try {
    let serviceProvider: ServiceProvider = await getServiceProviderDetails(chargeCardDetails.serviceProviderDetailsId)
    
    if (!(serviceProvider.acceptedPayments) || serviceProvider.acceptedPayments[PaymentType.Card] == false) {
      throw new MezError(ChargeCardError.CardNotAccepted);
    }
    if (serviceProvider.stripeInfo == null || serviceProvider.stripeInfo.status != StripeStatus.IsWorking) {
      throw new MezError(ChargeCardError.StripeNotWorking);
    }
    let stripeOptionsDefault = { apiVersion: <any>'2020-08-27' };
    let stripe = new Stripe(keys.stripe.secretkey, stripeOptionsDefault);
    let customer: CustomerInfo = await getCustomer(userId);
    customer = await verifyCustomerStripeInfo(customer, stripe);

    if(customer.stripeInfo!.cards[chargeCardDetails.cardId] == undefined) {
      throw new MezError(ChargeCardError.CardNotFound);
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
      success: true,
      paymentIntent: paymentIntent.client_secret,
      customer: stripeCustomerId,
      publishableKey: keys.stripe.publickey,
      stripeAccountId: serviceProvider.stripeInfo.id
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(ChargeCardError).includes(e.message as any)) {
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
};
export interface RemoveCardDetails {
  cardId: string,
}
export interface RemoveCardResponse {
  success: boolean,
  error?: RemoveCardError
  unhandledError?: string,
}
enum RemoveCardError {
  OrdersInProcess = "ordersInProcess",
  CustomerNotFound = "customerNotFound",
  NoCustomerStripeInfo = "noCustomerStripeInfo",
  CardNotFound = "cardNotFound",
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  CustomerUpdateError = "customerUpdateError",
}
export async function removeCard(userId: number, removeCardDetails: RemoveCardDetails): Promise<RemoveCardResponse> {
  try {
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
      throw new MezError(RemoveCardError.OrdersInProcess);
    }
    let customer = await getCustomer(userId);
    if (!(customer.stripeInfo)) {
      throw new MezError(RemoveCardError.NoCustomerStripeInfo);
    }
    if (!(customer.stripeInfo.cards) || !(customer.stripeInfo.cards[removeCardDetails.cardId])) {
      throw new MezError(RemoveCardError.CardNotFound);
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
    return {
      success: true
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(RemoveCardError).includes(e.message as any)) {
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
    throw new MezError("noCustomerStripeInfo");
  }
  if(customer.stripeInfo!.cards[cardId] == null) {
    throw new MezError("cardNotFound");
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