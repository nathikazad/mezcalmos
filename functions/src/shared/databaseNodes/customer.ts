import * as firebase from "firebase-admin";
import { OrderType } from "../models/Generic/Order";

export function cart(customerId: string) {
  return firebase.database().ref(`/customers/info/${customerId}/cart`)
}

export function lock(customerId: string) {
  return firebase.database().ref(`/customers/info/${customerId}/lock`)
}

export function stripeNode(customerId: string) {
  let dbNode: string = `/customers/info/${customerId}/stripe`;
  return firebase.database().ref(dbNode)
}

export function stripeIdNode(customerId: string) {
  let dbNode: string = `id`;
  return stripeNode(customerId).child(dbNode)
}

export function stripeCardsNode(customerId: string, cardId?: string) {
  let dbNode: string = `cards`;
  if (cardId != undefined) {
    dbNode += `/${cardId}`
  }
  return stripeNode(customerId).child(dbNode)
}

export function stripeClonedCardsNode(customerId: string, cardId: string, serviceProviderId: string, orderType: string) {
  let dbNode: string = `idsWithServiceProvider`;
  if (serviceProviderId != undefined && orderType != undefined) {
    dbNode += `/${serviceProviderId}/${orderType}`
  }
  return stripeCardsNode(customerId, cardId).child(dbNode)
}

export function stripeIdsWithServiceProviderNode(customerId: string, serviceProviderId?: string, orderType?: OrderType) {
  let dbNode: string = `idsWithServiceProvider`;
  if (serviceProviderId != undefined && orderType != undefined) {
    dbNode += `/${orderType}/${serviceProviderId}`
  }
  return stripeNode(customerId).child(dbNode)
}

export function pastOrders(customerId: string, orderId?: string) {
  let dbNode: string = `/customers/pastOrders/${customerId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function inProcessOrders(customerId: string, orderId?: string) {
  let dbNode: string = `/customers/inProcessOrders/${customerId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}



