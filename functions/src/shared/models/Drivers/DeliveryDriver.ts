import { AuthorizationStatus, NotificationInfo } from "../Generic/Generic";
import { OrderType } from "../Generic/Order";
import { OrderNotification } from "../Notification";

export interface State {
  authorizationStatus: AuthorizationStatus;
  isOnline: boolean;
  serviceProviderType?: OrderType;
  serviceProviderId?: string;
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

export interface CancelDeliveryOrderNotification extends OrderNotification {
  deliveryDriverType: DeliveryDriverType
}