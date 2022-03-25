import { ParticipantType } from "../../shared/models/Generic/Chat";
import { OrderType } from "../../shared/models/Generic/Order";

export function orderUrl(
  participantType: ParticipantType,
  orderType: OrderType,
  orderId: string): string {
  switch (participantType) {
    case ParticipantType.Customer:
      return `/${orderType}Orders/${orderId}`
    case ParticipantType.DeliveryAdmin:
      return `/orders/${orderType}/${orderId}`
    case ParticipantType.DeliveryDriver:
      return `/currentOrders/${orderType}/${orderId}`
    default:
      return "/";
  }
}

export function chatUrl(
  chatId: string): string {
  return `/messages/${chatId}`
}

export function taxiIncomingOrderUrl(
  orderId: string): string {
  return `/incomingOrders/${orderId}`
}

export function taxiPastOrderUrl(
  orderId: string): string {
  return `/pastOrders/${orderId}`
}