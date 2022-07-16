import { NotificationForQueue } from "../Notification";
import { OrderType } from "./Order";
import { UserInfo } from "./User";


export interface ChatData {
  chatType: ChatType;
  orderType?: OrderType;
  chatId: string;
  orderId?: string;
  messages?: Record<string, Message>;
  participants: { [key in ParticipantType]?: Record<string, Participant> }
  authorizedUsers: Record<string, boolean>
}

//Made chat object into class to add an instance method which is not easy on chatData interface
export class ChatObject {
  chatData: ChatData;
  constructor(chat: ChatData) {
    this.chatData = chat;
  }

  addParticipant(participant: Participant) {
    this.chatData.authorizedUsers = this.chatData.authorizedUsers || {};
    this.chatData.authorizedUsers[participant.id] = true;
    this.chatData.participants = this.chatData.participants || {};
    this.chatData.participants[participant.particpantType] = this.chatData.participants[participant.particpantType] || {};
    this.chatData.participants[participant.particpantType]![participant.id] = participant;
  }
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
  LaundryOperator = "laundryOperator",
  RestaurantOperator = "restaurantOperator",
}

export const nonNotifiableParticipants: Array<ParticipantType> = [ParticipantType.Restaurant];


export interface Participant extends UserInfo {
  particpantType: ParticipantType
}

export interface Message {
  chatId: string;
  orderId: string;
  userId: string;
  participantType: ParticipantType;
  notified?: boolean;
  message: string,
  timestamp: string
}

export function buildChatForOrder(
  chatId: string,
  orderType: OrderType,
  orderId?: string,
): ChatObject {
  let chat: ChatData = {
    orderId: orderId ?? chatId,
    chatId: chatId,
    chatType: ChatType.Order,
    orderType: orderType,
    participants: {},
    authorizedUsers: {}
  }
  return new ChatObject(chat);
}

export interface MessageNotificationForQueue extends NotificationForQueue {
  message: string,
  userId: string,
  chatId: string,
  participantType: ParticipantType,
  messageId: string,
  orderId?: string
}