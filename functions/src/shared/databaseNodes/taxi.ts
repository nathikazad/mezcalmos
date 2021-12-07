import * as firebase from "firebase-admin";

export function inProcessOrders(taxiId: string, orderId?: string) {
  let dbNode: string = `/taxis/inProcessOrders/${taxiId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function pastOrders(taxiId: string, orderId?: string) {
  let dbNode: string = `/taxis/pastOrders/${taxiId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function currentOrderIdNode(taxiId: string) {
  return firebase.database().ref(`/taxis/info/${taxiId}/state/currentOrderId`)
}

export function info(taxiId?: string) {
  let dbNode: string = `/taxis/info/${taxiId}`
  if (taxiId != undefined) {
    dbNode += `/${taxiId}`
  }
  return firebase.database().ref(dbNode);
}