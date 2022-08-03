import * as firebase from "firebase-admin";
import { OrderType, pluralizeOrderType } from "../../models/Generic/Order";

export function serviceProviderInProcessOrders(orderType: OrderType, providerId: string, orderId?: string) {
  let dbNode: string = `/${pluralizeOrderType(orderType)}/inProcessOrders/${providerId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function serviceProviderPastOrders(orderType: OrderType, providerId: string, orderId?: string) {
  let dbNode: string = `/${pluralizeOrderType(orderType)}/pastOrders/${providerId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function serviceProviderInfo(orderType: OrderType, providerId?: string) {
  let dbNode: string = `/${pluralizeOrderType(orderType)}/info`
  if (providerId != undefined) {
    dbNode += `/${providerId}`
  }
  return firebase.database().ref(dbNode);
}

export function serviceProviderState(orderType: OrderType, providerId: string) {
  return serviceProviderInfo(orderType, providerId).child("state")
}

export function serviceProviderPaymentInfo(orderType: OrderType, providerId: string) {
  return serviceProviderInfo(orderType, providerId).child("details/paymentInfo")
}

export function serviceProviderStripeId(orderType: OrderType, providerId: string) {
  return serviceProviderPaymentInfo(orderType, providerId).child("stripe/id");
}