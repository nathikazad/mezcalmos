import { fcmNotification } from "../../utilities/senders/fcm";
import { Language } from "./Generic";
import { OrderType } from "./Order";
import { UserInfo } from "./User";

export enum NotificationType {
  NewOrder = "newOrder",
  OrderStatusChange = "orderStatusChange",
  NewMessage = "newMessage"
}

export interface Notification {
  foreground: ForegroundNotification,
  background: BackgroundNotification
}

export interface ForegroundNotification {
  time: string,
  notificationType: NotificationType,
}

export type BackgroundNotification = Record<Language, fcmNotification>

export interface NewMessageNotification extends ForegroundNotification {
  sender: UserInfo,
  message: string
}

export interface OrderNotification extends ForegroundNotification {
  orderType: OrderType,
  orderId: string,
}