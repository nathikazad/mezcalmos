import * as firebase from "firebase-admin";
import { OrderType } from "../models/Order";
import { ParticipantType } from "../models/Chat";
import { NotificationInfo } from "../models/Generic";

export function notificationsNode(particpantType: ParticipantType, userId: string) {
  return firebase.database().ref(`/notifications/${particpantType}/${userId}`)
}

export function userInfoNode(userId: string) {
  return firebase.database().ref(`/users/${userId}/info`)
}

const participantTypeToNodeMap: { [id in ParticipantType]: string } = {
  [ParticipantType.Customer]: "customers",
  [ParticipantType.DeliveryAdmin]: "deliveryAdmins",
  [ParticipantType.Taxi]: "taxis",
  [ParticipantType.Restaurant]: "restaurants",
};

export function notificationInfoNode(participantType: ParticipantType, userId: string) {
  return firebase.database().ref(`/${participantTypeToNodeMap[participantType]}/info/${userId}/notificationInfo`);
}

export async function getNotificationInfo(participantType: ParticipantType, userId: string): Promise<NotificationInfo> {
  return (await notificationInfoNode(participantType, userId).once('value')).val();
}

export function inProcessOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.InProcess, orderType, orderId);
}

export function openOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.Open, orderType, orderId);
}

export function pastOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.PastOrders, orderType, orderId);
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