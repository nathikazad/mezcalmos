import * as firebase from "firebase-admin";

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

export function stripeClonedCardsNode(customerId: string, cardId: string, serviceProviderId?: string) {
  let dbNode: string = `idsWithServiceProvider`;
  if (serviceProviderId != undefined) {
    dbNode += `/${serviceProviderId}`
  }
  return stripeCardsNode(customerId, cardId).child(dbNode)
}

export function stripeIdsWithServiceProviderNode(customerId: string, serviceProviderId?: string) {
  let dbNode: string = `idsWithServiceProvider`;
  if (serviceProviderId != undefined) {
    dbNode += `/${serviceProviderId}`
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



