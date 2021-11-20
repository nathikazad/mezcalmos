// let orderRef = await firebase.database().ref(`/orders/restaurant`).push(order);
// await firebase.database().ref(`/customers/inProcessOrders/${uid}/${orderRef.key}`).set(order);
// firebase.database().ref(`/restaurants/inProcessOrders/${cart.serviceProviderId}/${orderRef.key}`).set(order);
// firebase.database().ref(`/inProcessOrders/restaurant/${orderRef.key}`).set(order);
// await firebase.database().ref(`/customers/info/${uid}/cart`).remove();
import * as firebase from "firebase-admin";

export function inProcessOrders(customerId: string, orderId?: string) {
  let dbNode: string = `/customers/inProcessOrders/${customerId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function pastOrders(customerId: string, orderId?: string) {
  let dbNode: string = `/customers/pastOrders/${customerId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function cart(customerId: string) {
  return firebase.database().ref(`/customers/info/${customerId}/cart`)
}