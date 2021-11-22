import * as firebase from "firebase-admin";
import { OrderType } from "../models/Order";
import { ParticipantType } from "../models/Chat";


export function notificationsNode(particpantType: ParticipantType, userId: string) {
  return firebase.database().ref(`/notifications/${particpantType}/${userId}`)
}

export function userInfo(uid: string) {
  return firebase.database().ref(`/users/${uid}/info`)
}

export function inProcessOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.InProcess, orderType, orderId);
}

export function openOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.InProcess, orderType, orderId);
}

export function pastOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.InProcess, orderType, orderId);
}

enum OrderStatus {
  InProcess = "inProcess",
  Open = "open",
  PastOrders = "past"
}

function orders(orderStatus: OrderStatus, orderType: OrderType, orderId?: string) {
  let dbNode: string = `orders/${orderStatus}/${orderType}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function chat(orderId?: string) {
  let dbNode: string = `/chat`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}