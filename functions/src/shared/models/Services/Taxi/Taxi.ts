import { AuthorizationStatus } from "../../Generic/Generic";
import { ForegroundNotification } from "../../Notification";
import { Business } from "../Business/Business";

export interface TaxiCompany {
  id: number,
  businessId: number,
  business: Business,
  minimumCost: number,
  costPerKm: number,
  maximumDeliveryDistance: number,
}

export interface Taxi {
  id: number,
  carNumber: string,  
  carName: string,
}

export interface State {
  authorizationStatus: AuthorizationStatus;
  isLooking: boolean;
  currentOrderId?: string;
}




export interface NewTaxiCompanyNotification extends ForegroundNotification {
  name: string,
  image: string,
  id: number,
}