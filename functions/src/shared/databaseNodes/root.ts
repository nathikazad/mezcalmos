import * as firebase from "firebase-admin";
import { OrderType } from "../models/Generic/Order";
import { ParticipantType } from "../models/Generic/Chat";
import { ServiceProviderType } from "../../utilities/setLink";

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
  [ParticipantType.DeliveryDriver]: "deliveryDrivers",
  [ParticipantType.Laundry]: "laundries",
  [ParticipantType.LaundryOperator]: "operators/laundry",
  [ParticipantType.RestaurantOperator]: "operators/restaurant",
};

export function notificationInfoNode(participantType: ParticipantType, userId: string) {
  return firebase.database().ref(`/${participantTypeToNodeMap[participantType]}/info/${userId}/notificationInfo`);
}

export function inProcessOrders(orderType?: OrderType, orderId?: string) {
  return orders(OrderStatus.InProcess, orderType, orderId);
}

export function openOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.Open, orderType, orderId);
}

export function pastOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.PastOrders, orderType, orderId);
}

export function notificationsQueueNode(notificationId?: string) {
  let dbNode: string = `notificationQueue`
  if (notificationId != undefined) {
    dbNode += `/${notificationId}`
  }
  return firebase.database().ref(dbNode);
}

export function providerLinkNode(providerType: ServiceProviderType, providerId: string) {
  let dbNode = "";
  switch (providerType) {
    case ServiceProviderType.Restaurant:
      dbNode += "restaurants/"
      break;
    case ServiceProviderType.Laundry:
      dbNode += "laundries/"
      break;
    case ServiceProviderType.Taxi:
      dbNode += "taxis/";
      break;
    default:
      return undefined;
  }
  dbNode += `info/${providerId}/link`;
  return firebase.database().ref(dbNode);
}

// export function deepLinksNode(providerType: ServiceProviderType, linkId: string) {
//   let dbNode = `deeplinks/${providerType}/${linkId}`;
//   return firebase.database().ref(dbNode);
// }





enum OrderStatus {
  InProcess = "inProcess",
  Open = "open",
  PastOrders = "past"
}

function orders(orderStatus: OrderStatus, orderType?: OrderType, orderId?: string) {
  let dbNode: string = `orders/${orderStatus}`
  if (orderType != undefined) {
    dbNode += `/${orderType}`
  }
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}