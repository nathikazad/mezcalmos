import Stripe from 'stripe';
import { ServerResponseStatus } from '../../shared/models/Generic/Generic';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import * as customerNodes from '../../shared/databaseNodes/customer';
import * as serviceProviderNodes from '../../shared/databaseNodes/services/serviceProvider';
import { CustomerCard, CustomerStripe, StripeStatus } from './model';
import { UserInfo } from '../../shared/models/Generic/User';
import { userInfoNode } from '../../shared/databaseNodes/root';
import { PaymentInfo } from '../../shared/models/Services/Service';
// import * as serviceProviderNodes from '../../shared/databaseNodes/services/serviceProvider';
import { OrderType, PaymentType } from '../../shared/models/Generic/Order';
import { getCustomerIdFromServiceAccount } from './serviceProvider';
// import * as customerNodes from '../../shared/databaseNodes/customer';
// import { userInfoNode } from '../../shared/databaseNodes/root';
// import { UserInfo } from '../../shared/models/Generic/User';
// import { StripeStatus } from './model';
// import { PaymentInfo } from '../../shared/models/Services/Service';
let keys: Keys = getKeys();

export async function addCard(userId: string, data: any) {

  // let response = isSignedIn(userId)
  // if (response != undefined) {
  //   return response;
  // }

  if (data.paymentMethod == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected paymentMethod`,
      errorCode: "incorrectParams"
    }
  }
  const mezCustomerId: string = userId;
  let stripeOptions = { apiVersion: <any>'2020-08-27' };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
  const stripeCustomerId: string = await getCustomerId(mezCustomerId, stripe);

  const paymentMethod: Stripe.PaymentMethod = await stripe.paymentMethods.attach(
    data.paymentMethod,
    { customer: stripeCustomerId },
    stripeOptions
  );

  let cardRef = await customerNodes.stripeCardsNode(mezCustomerId).push(<CustomerCard>{
    id: paymentMethod.id,
    last4: paymentMethod.card?.last4,
    brand: paymentMethod.card?.brand,
    expMonth: paymentMethod.card?.exp_month,
    expYear: paymentMethod.card?.exp_year,
  })

  return {
    status: ServerResponseStatus.Success,
    cardId: cardRef.key
  }
};

export async function chargeCard(userId: string, data: any) {

  // let response = isSignedIn(userId)
  // if (response != undefined) {
  //   return response;
  // }

  if (data.serviceProviderId == null || data.cardId == null ||
    data.orderType == null || data.paymentAmount == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected cardId, serviceProviderId, orderType and paymentAmount`,
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

  const mezCustomerId: string = userId;
  let customerStripe: CustomerStripe = (await customerNodes.stripeNode(mezCustomerId).once('value')).val();

  if (customerStripe == null || customerStripe.cards == null || customerStripe.cards[data.cardId] == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `There is no card with this key`,
      errorCode: "cardIdNotValid"
    }
  }

  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProviderPaymentInfo.stripe.id };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  let stripeCustomerId: string = await getCustomerIdFromServiceAccount(mezCustomerId, data.serviceProviderId, data.orderType, stripe, stripeOptions);
  let stripeCardId: string = await getCardIdFromServiceAccount(mezCustomerId, data.cardId, data.serviceProviderId, data.orderType, mezCustomerId, stripe, stripeOptions);

  const paymentIntent = await stripe.paymentIntents.create(
    {
      amount: parseInt(data.paymentAmount) * 100,
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
    status: ServerResponseStatus.Success,
    paymentIntent: paymentIntent.client_secret,
    customer: stripeCustomerId,
    publishableKey: keys.stripe.publickey,
    stripeAccountId: serviceProviderPaymentInfo.stripe.id
  }
};

export async function removeCard(userId: string, data: any) {

  // let response = await isSignedIn(userId)
  // if (response != undefined) {
  //   return response;
  // }

  if (data.cardId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected cardId`,
      errorCode: "incorrectParams"
    }
  }

  const mezCustomerId: string = userId;
  let inProcessOrders = (await customerNodes.inProcessOrders(mezCustomerId).once('value')).val()
  if (inProcessOrders && Object.keys(inProcessOrders).length > 0) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Can't remove cards with in process orders, please wait till you finish your order`,
      errorCode: "incorrectParams"
    }
  }
  let customerStripe: CustomerStripe = (await customerNodes.stripeNode(mezCustomerId).once('value')).val()
  if (customerStripe == null || customerStripe.cards == null || customerStripe.cards[data.cardId] == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `There is no card with this key`,
      errorCode: "cardIdNotValid"
    }
  }
  const card = customerStripe.cards[data.cardId]

  const stripe = new Stripe(keys.stripe.secretkey, { apiVersion: <any>'2020-08-27' });
  await stripe.paymentMethods.detach(
    card.id,
    { apiVersion: <any>'2020-08-27' }
  );

  for (let orderTypeId in card.idsWithServiceProvider) {
    let orderType: OrderType = orderTypeId as OrderType;
    for (let serviceProviderId in card.idsWithServiceProvider[orderType]) {
      let clonedCardId = card.idsWithServiceProvider[orderType][serviceProviderId]
      let serviceProviderStripeId: string = (await serviceProviderNodes.serviceProviderStripeId(data.orderType, serviceProviderId).once('value')).val()

      if (!clonedCardId || !serviceProviderStripeId)
        continue
      let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProviderStripeId };
      const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
      await stripe.paymentMethods.detach(
        clonedCardId,
        stripeOptions
      );
    }
  }

  await customerNodes.stripeCardsNode(mezCustomerId, data.cardId).remove()

  return {
    status: ServerResponseStatus.Success,
  }
};


async function getCustomerId(customerId: string, stripe: Stripe) {
  let stripeCustomerId: string = (await customerNodes.stripeIdNode(customerId).once('value')).val();
  if (stripeCustomerId == null) {
    let userInfo: UserInfo = (await userInfoNode(customerId).once('value')).val()
    const customer: Stripe.Customer = await stripe.customers.create({
      name: userInfo.name,
      metadata: { customerId: customerId },
    })
    stripeCustomerId = customer.id;
    customerNodes.stripeIdNode(customerId).set(stripeCustomerId);
  }
  return stripeCustomerId;
}

export async function getCardIdFromServiceAccount(customerId: string, cardId: string, serviceProviderId: string, orderType: OrderType, mezCustomerId: string, stripe: Stripe, stripeOptions: any) {
  let stripeCardIdWithServiceProvider: string = (await customerNodes.stripeClonedCardsNode(customerId, cardId, serviceProviderId, orderType).once('value')).val();
  if (stripeCardIdWithServiceProvider == null) {
    let customerStripe: CustomerStripe = (await customerNodes.stripeNode(mezCustomerId).once('value')).val();
    const clonedPaymentMethod = await stripe.paymentMethods.create({
      customer: customerStripe.id,
      payment_method: customerStripe.cards[cardId].id,
    }, stripeOptions);

    const paymentMethod = await stripe.paymentMethods.attach(
      clonedPaymentMethod.id,
      { customer: customerStripe.idsWithServiceProvider[orderType][serviceProviderId] },
      stripeOptions
    );

    stripeCardIdWithServiceProvider = paymentMethod.id;
    customerNodes.stripeClonedCardsNode(customerId, cardId, serviceProviderId, orderType).set(stripeCardIdWithServiceProvider);
  }
  return stripeCardIdWithServiceProvider;
}