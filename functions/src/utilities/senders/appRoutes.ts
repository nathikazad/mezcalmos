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
      return `/${orderType}Orders/${orderId}`
    case ParticipantType.DeliveryDriver:
      return `/${orderType}Orders/${orderId}`
    default:
      return "/";
  }
}

export function chatUrl(
  chatId: string, orderId?: string): string {
  let str = `/messages/${chatId}?showViewOrderBtn=1`;
  if (orderId != null)
    str += `&orderId=${orderId}`
  return str
}

export function taxiIncomingOrderUrl(
  orderId: string): string {
  return `/incomingOrders/${orderId}`
}

export function taxiPastOrderUrl(
  orderId: string): string {
  return `/pastOrders/${orderId}`
}