import { RestaurantOrderStatus } from "../../restaurant/models/RestaurantOrder";
import { OrderType } from "./Order";
import { GenericUser } from "./User";

export enum NotificationType {
  NewOrder = "newOrder",
  OrderStatusChange = "orderStatusChange",
  NewMessage = "newMessage"
}

export interface Notification {
  time: string,
  notificationType: NotificationType,
}

export interface NewMessageNotification extends Notification {
  sender: GenericUser,
  message: string
}

export interface OrderNotification extends Notification {
  orderType: OrderType,
  orderId: string,
}

export interface NewRestaurantOrderNotification extends OrderNotification {
  restaurant: GenericUser
}

export interface OrderStatusChangeNotification extends OrderNotification {
  status: RestaurantOrderStatus
}