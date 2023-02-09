import { NotificationForQueue } from "../Notification";
import { AppType, NotificationInfo } from "./Generic";
import { OrderType } from "./Order";
import { UserInfo } from "./User";

export type Participants = { [key in ParticipantType]?: Record<string, Participant> };


export enum ChatType {
  Direct = "direct",
  Group = "group"
}

export enum ChatInfoAppName {
  CustomerApp = "CustomerApp",
  DeliveryAdminApp = "DeliveryAdminApp",
  DeliveryApp = "DeliveryApp",
  MezAdminApp = "MezAdminApp",
  RestaurantApp = "RestaurantApp",
  LaundryApp = "LaundryApp"
}

export const AppTypeToChatInfoAppName: Record<AppType, ChatInfoAppName> = {
  [AppType.Customer]: ChatInfoAppName.CustomerApp,
  [AppType.DeliveryAdmin]: ChatInfoAppName.DeliveryAdminApp,
  [AppType.DeliveryApp]: ChatInfoAppName.DeliveryApp,
  [AppType.MezAdmin]: ChatInfoAppName.MezAdminApp,
  [AppType.RestaurantApp]: ChatInfoAppName.RestaurantApp,
  [AppType.LaundryApp]: ChatInfoAppName.LaundryApp,
}

export interface ChatInfo {
  chatTitle: string,
  chatImage: string,
  phoneNumber?: string,
  participantType?: ParticipantType,
  parentLink: string
}

export enum ParticipantType {
  Customer = "customer",
  Taxi = "taxi",
  DeliveryOperator = "deliveryOperator",
  DeliveryDriver = "deliveryDriver",
  LaundryOperator = "laundryOperator",
  RestaurantOperator = "restaurantOperator",
  MezAdmin = "mezAdmin"
}


export const AppParticipant: Record<AppType, ParticipantType> = {
  [AppType.Customer]: ParticipantType.Customer,
  [AppType.DeliveryAdmin]: ParticipantType.DeliveryOperator,
  [AppType.DeliveryApp]: ParticipantType.DeliveryDriver,
  [AppType.MezAdmin]: ParticipantType.MezAdmin,
  [AppType.RestaurantApp]: ParticipantType.RestaurantOperator,
  [AppType.LaundryApp]: ParticipantType.LaundryOperator
}


export function getAppTypeFromParticipantType(participantType: ParticipantType): AppType {
  return Object.keys(AppParticipant).filter(function(key) {return AppParticipant[key as AppType] === participantType})[0] as AppType;
}

export interface Chat {
  participants: Participant[]
  chatType: ChatType
  chatInfo: Record<ChatInfoAppName, ChatInfo>
}

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


export interface MessageNotificationForQueue extends NotificationForQueue {
  message: string,
  userId: number,
  chatId: number,
  chatType: ChatType,
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
  recipientId: number,
  recipientParticipantType: ParticipantType,
  callNotificationType: CallNotificationtType,
}

export interface ParticipantAgoraDetails {
  uid: number,
  token: string,
  expirationTime: string
}

export interface ParticipantWithAgora extends Participant {
  agora: ParticipantAgoraDetails
}
