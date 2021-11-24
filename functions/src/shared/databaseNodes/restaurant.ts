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
