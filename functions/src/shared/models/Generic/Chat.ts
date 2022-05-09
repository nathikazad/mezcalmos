import { NotificationForQueue } from "../Notification";
import { OrderType } from "./Order";
import { UserInfo } from "./User";


export interface Chat {
  chatType: ChatType;
  orderType?: OrderType;
  chatId: string;
  orderId?: string;
  messages?: Record<string, Message>;
  participants: Record<string, Participant>;
}

export enum ChatType {
  Order = "order",
}

export enum ParticipantType {
  Customer = "customer",
  Taxi = "taxi",
  DeliveryAdmin = "deliveryAdmin",
  Restaurant = "restaurant",
  DeliveryDriver = "deliveryDriver",
  Laundry = "laundry",
  LaundryOperator = "laundryOperator"
}


export interface Participant extends UserInfo {
  particpantType: ParticipantType
}

export interface Message {
  chatId: string;
  orderId: string;
  userId: string;
  notified?: boolean;
  message: string,
  timestamp: string
}

export async function buildChatForOrder(
  orderId: string,
  orderType: OrderType,
  customerId: string,
  customerInfo: Participant,
  serviceProviderId?: string,
  serviceProviderInfo?: Participant,
): Promise<Chat> {
  let chat: Chat = {
    orderId: orderId,
    chatId: orderId,
    chatType: ChatType.Order,
    orderType: orderType,
    participants: {
      [customerId]: customerInfo,
    }
  }
  if (serviceProviderId && serviceProviderInfo) {
    chat.participants[serviceProviderId] = serviceProviderInfo;
  }
  return chat;
}

export interface MessageNotificationForQueue extends NotificationForQueue {
  message: string,
  userId: string,
  chatId: string,
  messageId: string,
  orderId?: string
}