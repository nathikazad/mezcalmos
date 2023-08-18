import { AuthorizationStatus, Location, NotificationInfo } from "../../Generic/Generic";
import { UserInfo } from "../../Generic/User";
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
  minimumCost?: number,
  costPerKm?: number
}

export interface State {
  authorizationStatus: AuthorizationStatus;
  isLooking: boolean;
  currentOrderId?: string;
}

export interface TaxiDriver {
  id: number;
  userId: number;
  companyId: number;
  status: AuthorizationStatus;
  appVersion?: string;
  currentLocation?: Location;
  user?: UserInfo;
  online?: boolean;
  notificationInfo?: NotificationInfo;
  taxi: Taxi;
}



export interface NewTaxiCompanyNotification extends ForegroundNotification {
  name: string,
  image: string,
  id: number,
}