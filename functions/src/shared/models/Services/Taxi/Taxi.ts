import { AuthorizationStatus, NotificationInfo } from "../../Generic/Generic";
import { ForegroundNotification } from "../../Notification";
import { ServiceProvider } from "../Service";

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

export interface TaxiCompany {
  id: number,
  details: ServiceProvider,
  minimumCost: number,
  costPerKm: number,
}

export interface NewTaxiCompanyNotification extends ForegroundNotification {
  name: string,
  image: string,
  id: number,
}