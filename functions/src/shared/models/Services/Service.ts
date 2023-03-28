import { ServiceProviderStripeInfo } from "../../../utilities/stripe/model";
import { ParticipantType } from "../Generic/Chat";
import { DeliveryDetails } from "../Generic/Delivery";
import { AuthorizationStatus, Language, Location, NotificationInfo } from "../Generic/Generic";
import {  PaymentType } from "../Generic/Order";
import { UserInfo } from "../Generic/User";
import { ForegroundNotification } from "../Notification";

export interface ServiceProvider {
  id: number;
  serviceProviderDetailsId: number;
  name: string;
  image: string;
  phoneNumber?: string;
  firebaseId?: string;
  location: Location;
  description?: Record<Language, string>;
  openStatus?: OpenStatus;
  stripeInfo?: ServiceProviderStripeInfo;
  acceptedPayments?: Record<PaymentType, boolean>;
  approved?: boolean;
  links?: ServiceLink;
  creationTime?: string;
  language: Record<Language, boolean>;
  schedule?: any;
  deliveryPartnerId?: number;
  deliveryDetails: DeliveryDetails;
  operators?: Operator[];
  serviceProviderType: ServiceProviderType;
  uniqueId?: string;
}

export interface Operator {
  id: number;
  detailsId: number;
  serviceProviderId: number;
  userId: number;
  status: AuthorizationStatus;
  online: boolean,
  owner?: boolean;
  appVersion?: string;
  currentGps?: Location;
  notificationInfo?: NotificationInfo;
  user?: UserInfo;
}

export enum OpenStatus {
  Open = "open",
  ClosedTemporarily = "closedTemporarily",
  ClosedIndefinitely = "closedIndefinitely",
}

export interface State {
  authorizationStatus: AuthorizationStatus;
  open: boolean;
}

export interface Details {
  description: Record<Language, string>;
  languages: Language[];
  paymentInfo: PaymentInfo;
}

export interface Service {
  state: State;
  info: UserInfo;
  details: Details
}

export interface PaymentInfo {
  stripe: ServiceProviderStripeInfo;
  acceptedPayments: Record<PaymentType, boolean>;
}
export interface ServiceLink{
  id?: number;
  serviceProviderId: number;
  serviceProviderType: ServiceProviderType;
  operatorDeepLink?: string; 
  operatorQrImageLink?: string;
  driverDeepLink?: string; 
  driverQrImageLink?: string; 
}
export enum ServiceProviderType {
  Restaurant = "restaurant",
  Laundry = "laundry",
  Taxi = "taxi",
  Business = "business",
  Delivery = "delivery",
}

export interface OperatorApprovedNotification extends ForegroundNotification {
  operatorId: number,
  approved: boolean,
  serviceProviderName: string,
  serviceProviderId: number,
  participantType: ParticipantType,
}