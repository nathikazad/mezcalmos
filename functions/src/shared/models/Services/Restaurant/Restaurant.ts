import { ForegroundNotification, NotificationForQueue } from "../../Notification";

// export interface Restaurant extends ServiceProvider {
//   restaurantOperators?: Array<RestaurantOperator>
// }

// export interface RestaurantOperator extends Operator {
//   restaurantId: number;
// }

export interface NewRestaurantNotificationForQueue extends NotificationForQueue {
  name: string,
  image: string,
  id: number,
}

export interface NewRestaurantNotification extends ForegroundNotification {
  name: string,
  image: string,
  id: number,
}

export interface OperatorApprovedNotificationForQueue extends NotificationForQueue {
  operatorId: number,
  approved: boolean
  restaurantName: string,
  restaurantId: number
}

export interface RestaurantOperatorApprovedNotification extends ForegroundNotification {
  operatorId: number,
  approved: boolean,
  restaurantName: string,
  restaurantId: number
}

export interface AuthorizeOperatorNotificationForQueue extends NotificationForQueue {
  newOperatorName: string,
  newOperatorImage: string,
  restaurantId: number,
}