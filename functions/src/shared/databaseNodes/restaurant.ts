// let orderRef = await firebase.database().ref(`/orders/restaurant`).push(order);
// await firebase.database().ref(`/customers/inProcessOrders/${uid}/${orderRef.key}`).set(order);
// firebase.database().ref(`/restaurants/inProcessOrders/${cart.serviceProviderId}/${orderRef.key}`).set(order);
// firebase.database().ref(`/inProcessOrders/restaurant/${orderRef.key}`).set(order);
// await firebase.database().ref(`/customers/info/${uid}/cart`).remove();
import * as firebase from "firebase-admin";

export function inProcessOrders(restaurantId: string, orderId?: string) {
  let dbNode: string = `/restaurants/inProcessOrders/${restaurantId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function pastOrders(restaurantId: string, orderId?: string) {
  let dbNode: string = `/restaurants/pastOrders/${restaurantId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function info(restaurantId: string) {
  return firebase.database().ref(`/restaurants/info/${restaurantId}`)
}

export function notificationInfo(restaurantId?: string) {
  firebase.database().ref(`/restaurants/info/${restaurantId}/notificationInfo`)
}
