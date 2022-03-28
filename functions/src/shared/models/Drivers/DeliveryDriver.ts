import { AuthorizationStatus, NotificationInfo } from "../Generic/Generic";
import { OrderNotification } from "../Notification";

export interface State {
  authorizationStatus: AuthorizationStatus;
  isOnline: boolean;
}

export interface DeliveryDriver {
  state: State;
  notificationInfo: NotificationInfo;
}

export enum DeliveryDriverType {
  Pickup = "pickup",
  DropOff = "dropoff",
}

export interface NewDeliveryOrderNotification extends OrderNotification {
  deliveryDriverType: DeliveryDriverType
}