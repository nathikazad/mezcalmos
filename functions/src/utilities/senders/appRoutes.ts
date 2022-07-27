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
    case ParticipantType.Taxi:
      return `/${orderType}Orders/${orderId}`;
    default:
      return "/";
  }
}

export function chatUrl(
  chatId: string,
  orderId?: string,
  orderType?: OrderType,
  participantType?: ParticipantType): string {
  let str = `/messages/${chatId}`;
  if (orderId != null)
    str += `?orderId=${orderId}`
  if (orderId != null && orderType != null && participantType != null)
    str += `&orderLink=${orderUrl(participantType, orderType, orderId!)}`
  if (participantType != null)
    str += `&recipientType=${participantType}`;

  return str
}

export function taxiIncomingOrderUrl(
  orderId: string): string {
  return `/incomingOrders/${orderId}`
}