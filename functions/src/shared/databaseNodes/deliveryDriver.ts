import * as firebase from "firebase-admin";

export function inProcessOrders(deliveryDriverId: string, orderId?: string) {
  let dbNode: string = `/deliveryDrivers/inProcessOrders/${deliveryDriverId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function pastOrders(deliveryDriverId: string, orderId?: string) {
  let dbNode: string = `/deliveryDrivers/pastOrders/${deliveryDriverId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function info(taxiId?: string) {
  let dbNode: string = "/deliveryDrivers/info/"
  if (taxiId != undefined) {
    dbNode += `/${taxiId}`
  }
  return firebase.database().ref(dbNode);
}export function associatedRestaurants(taxiId: string) {
  let dbNode: string = `/deliveryDrivers/info/${taxiId}/state/associatedRestaurants`

  
  
  return firebase.database().ref(dbNode);
}