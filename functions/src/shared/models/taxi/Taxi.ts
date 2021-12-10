import { info } from "../../databaseNodes/taxi"
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

export async function getTaxi(taxiId: string): Promise<Taxi> {
  console.log(`checking taxi node at @ ${info(taxiId)}`);
  return (await info(taxiId).once('value')).val();
}