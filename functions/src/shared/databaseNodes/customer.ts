import * as firebase from "firebase-admin";

export function cart(customerId: string) {
  return firebase.database().ref(`/customers/info/${customerId}/cart`)
}

export function lock(customerId: string) {
  return firebase.database().ref(`/customers/info/${customerId}/lock`)
}

export function stripeIdsNode(customerId: string, serviceProviderId?: string) {
  let dbNode: string = `/customers/info/${customerId}/stripeIds`;
  if (serviceProviderId != undefined) {
    dbNode += `/${serviceProviderId}`
  }
  return firebase.database().ref(dbNode)
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



