import { OrderType } from "./Order";
import { GenericUser } from "./User";

export enum NotificationType {
  NewOrder = "newOrder",
}

export interface NewRestaurantOrderNotification {
  time: string,
  notificationType: NotificationType,
  orderType: OrderType,
  orderId: string,
  restaurant: GenericUser
}