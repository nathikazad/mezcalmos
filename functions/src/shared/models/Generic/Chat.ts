import { NotificationForQueue } from "../Notification";
import { NotificationInfo } from "./Generic";
import { OrderType } from "./Order";
import { UserInfo } from "./User";

export type Participants = { [key in ParticipantType]?: Record<string, Participant> };

export interface ChatData {
  chatType: ChatType;
  orderType?: OrderType;
  chatId: string;
  orderId?: string;
  messages?: Record<string, Message>;
  participants: Participants
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
    // this.chatData.participants[participant.particpantType] = this.chatData.participants[participant.particpantType] || {};
    // this.chatData.participants[participant.particpantType]![participant.id] = participant;
  }
}

export enum ChatType {
  Order = "order",
}

export enum ParticipantType {
  Customer = "customer",
  Taxi = "taxi",
  DeliveryOperator = "deliveryOperator",
  Restaurant = "restaurant",
  DeliveryDriver = "deliveryDriver",
  Laundry = "laundry",
  LaundryOperator = "laundryOperator",
  RestaurantOperator = "restaurantOperator",
  MezAdmin = "mezAdmin"
}

export const nonNotifiableParticipants: Array<ParticipantType> = [ParticipantType.Restaurant, ParticipantType.Laundry];


export interface Participant extends UserInfo {
  participantType: ParticipantType,
  notificationInfo: NotificationInfo | null
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
  userId: number,
  chatId: number,
  participantType: ParticipantType,
  messageId: number,
  orderId?: number,
  orderType: OrderType
}

export enum CallNotificationtType {
  Incoming = "incoming",
  EndCall = "endCall"

}
export interface CallNotificationForQueue extends NotificationForQueue {
  chatId: number,
  callerId: number,
  callerParticipantType: ParticipantType,
  calleeId: number,
  calleeParticipantType: ParticipantType,
  callNotificationType: CallNotificationtType,
  orderId?: number
}

export interface ParticipantAgoraDetails {
  // uid: number,
  token: string,
  expirationTime: string
}

export interface ParticipantWithAgora extends Participant {
  agora: ParticipantAgoraDetails
}
