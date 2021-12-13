import { AuthorizationStatus, NotificationInfo } from "../Generic";

export interface State {
  authorizationStatus: AuthorizationStatus;
  isLooking: boolean;
  currentOrderId?: string;
}

export interface Taxi {
  state: State;
  notificationInfo: NotificationInfo;
  details: TaxiDetails
}

export interface TaxiDetails {
  taxiNumber: string
}