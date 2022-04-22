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

export function serviceProviderInfo(orderType: OrderType, providerId: string) {
  return firebase.database().ref(`/${pluralizeOrderType(orderType)}/info/${providerId}`)
}

export function serviceProviderState(orderType: OrderType, providerId: string) {
  return firebase.database().ref(`/${pluralizeOrderType(orderType)}/state/${providerId}`)
}