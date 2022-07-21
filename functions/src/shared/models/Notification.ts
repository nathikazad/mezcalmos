import { fcmNotification } from "../../utilities/senders/fcm";
import { Language } from "./Generic/Generic";
import { OrderType } from "./Generic/Order";
import { UserInfo } from "./Generic/User";

export enum NotificationType {
  NewOrder = "newOrder",
  OrderStatusChange = "orderStatusChange",
  NewMessage = "newMessage",
  NewCounterOffer = "newCounterOffer"
}

export enum NotificationAction {
  ShowPopUp = "showPopUp",
  ShowSnackBarAlways = "showSnackbarAlways",
  ShowSnackbarOnlyIfNotOnPage = "showSnackbarOnlyIfNotOnPage"
}

export interface Notification {
  foreground: ForegroundNotification,
  background: BackgroundNotification,
  linkUrl: string
}

export interface ForegroundNotification {
  time: string,
  notificationType: NotificationType,
  notificationAction: NotificationAction
}

export type BackgroundNotification = Record<Language, fcmNotification>

export interface NewMessageNotification extends ForegroundNotification {
  chatId: string,
  sender: UserInfo,
  message: string,
  orderId: string
}

<<<<<<< Updated upstream
=======
export interface NewCallBackgroundNotification {
  linkUrl: string,
  language: Language,
  callerName: string,
  callerImage: string,
  callerType: ParticipantType,
  notificationType: NotificationType,
  callNotificationType: CallNotificationtType,
  [key: string]: string;
}



>>>>>>> Stashed changes
export interface OrderNotification extends ForegroundNotification {
  orderType: OrderType,
  orderId: string,
}

export interface NotificationForQueue {
  notificationType: NotificationType,
  timestamp: string
}