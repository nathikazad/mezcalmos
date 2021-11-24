import { AuthorizationStatus } from "../../shared/models/Generic";

export interface State {
  authorizationStatus: AuthorizationStatus;
  open: boolean;
  currentOrderId?: string;
}

export interface Taxi {
  state: State;
  details: TaxiDetails
}

export interface TaxiDetails {
  taxiNumber: string
}