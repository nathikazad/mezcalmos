import { AuthorizationStatus, NotificationInfo } from "../Generic/Generic";

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