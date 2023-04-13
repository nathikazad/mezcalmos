import { fcmNotification } from "../../utilities/senders/fcm";
import { CallNotificationtType, Participant, ParticipantType } from "./Generic/Chat";
import { Language } from "./Generic/Generic";
import { OrderType } from "./Generic/Order";

export enum NotificationType {
  NewOrder = "newOrder",
  OrderStatusChange = "orderStatusChange",
  NewMessage = "newMessage",
  NewCounterOffer = "newCounterOffer",
  AssignDriver = "assignDriver",
  Call = "call",
  OperatorApproved = "operatorApproved",
  AuthorizeOperator = "authorizeOperator",
  NewRestaurant = "newRestaurant",
  NewDriver = "newDriver",
  DriverApproved = "driverApproved",
  PriceChange = "priceChange"
}

export enum NotificationAction {
  ShowPopUp = "showPopUp",
  ShowSnackBarAlways = "showSnackbarAlways",
  ShowSnackbarOnlyIfNotOnPage = "showSnackbarOnlyIfNotOnPage",
  NavigteToLinkUrl = "navigteToLinkUrl"
}

export interface Notification {
  foreground: ForegroundNotification,
  background: BackgroundNotification,
  linkUrl: string
}

export interface ForegroundNotification {
  time: string,
  notificationType: NotificationType,
  notificationAction: NotificationAction,
  linkUrl?: string
}

export type BackgroundNotification = Record<Language, fcmNotification>

export interface NewMessageNotification extends ForegroundNotification {
  chatId: number,
  sender: Participant,
  message: string,
  orderId?: string
  orderType: OrderType
}

export interface NewCallBackgroundNotification {
  linkUrl: string,
  language: Language,
  callerName: string,
  callerImage: string,
  callerType: ParticipantType,
  notificationType: NotificationType,
  callNotificationType: CallNotificationtType,
  callerId: string,
  chatId: string,
  [key: string]: string;
}

export interface EndCallBackgroundNotification {
  linkUrl: string,
  callerType: ParticipantType,
  notificationType: NotificationType,
  callNotificationType: CallNotificationtType,
  callerId: string,
  chatId: string,
  [key: string]: string;
}

export interface OrderNotification extends ForegroundNotification {
  orderType: OrderType,
  orderId: number,
}

export interface NotificationForQueue {
  notificationType: NotificationType,
  timestamp: string
}

export interface AuthorizeOperatorNotification extends ForegroundNotification {
  newOperatorName: string,
  newOperatorImage: string,
  serviceProviderId: number,
}