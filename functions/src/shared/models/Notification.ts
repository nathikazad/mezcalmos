import { RestaurantOrderStatus } from "../../restaurant/models/RestaurantOrder";
import { fcmNotification } from "../../utilities/senders/fcm";
import { Language } from "./Generic";
import { OrderType } from "./Order";
import { GenericUser } from "./User";

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
  sender: GenericUser,
  message: string
}

export interface OrderNotification extends ForegroundNotification {
  orderType: OrderType,
  orderId: string,
}

export interface NewRestaurantOrderNotification extends OrderNotification {
  restaurant: GenericUser
}

export interface OrderStatusChangeNotification extends OrderNotification {
  status: RestaurantOrderStatus
}