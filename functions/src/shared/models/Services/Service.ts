import { ServiceProviderStripeInfo } from "../stripe";
import { ParticipantType } from "../Generic/Chat";
import { DeliveryDetails } from "../Generic/Delivery";
import { AppType, AuthorizationStatus, Language, Location, NotificationInfo } from "../Generic/Generic";
import {  PaymentType } from "../Generic/Order";
import { UserInfo } from "../Generic/User";
import { ForegroundNotification } from "../Notification";
import { Schedule } from "../Generic/Schedule";

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
  language: ServiceProviderLanguage;
  schedule?: Schedule;
  deliveryPartnerId?: number;
  deliveryDetails: DeliveryDetails;
  operators?: Array<Operator>;
  serviceProviderType: ServiceProviderType;
  uniqueId?: string;
  currency?: Currency;
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

// export interface State {
//   authorizationStatus: AuthorizationStatus;
//   open: boolean;
// }

// export interface Details {
//   description: Record<Language, string>;
//   languages: Language[];
//   paymentInfo: PaymentInfo;
// }

// export interface PaymentInfo {
//   stripe: ServiceProviderStripeInfo;
//   acceptedPayments: Record<PaymentType, boolean>;
// }
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
  Business = "business",
  DeliveryCompany = "deliveryCompany",
  Customer = "customer",
  DeliveryDriver = "deliveryDriver"
}

export enum Currency {
  Peso = "peso",
}

export interface OperatorApprovedNotification extends ForegroundNotification {
  operatorId: number,
  approved: boolean,
  serviceProviderName: string,
  serviceProviderId: number,
  participantType: ParticipantType,
}

export interface ServiceProviderLanguage {
  primary: Language;
  secondary?: Language;
}

export const ServiceProviderToAppType: Record<ServiceProviderType, AppType> = {
  [ServiceProviderType.Restaurant]: AppType.Restaurant,
  [ServiceProviderType.Laundry]: AppType.Laundry,
  [ServiceProviderType.Business]: AppType.Business,
  [ServiceProviderType.DeliveryCompany]: AppType.DeliveryAdmin,
  [ServiceProviderType.Customer]: AppType.Customer,
  [ServiceProviderType.DeliveryDriver]: AppType.Delivery,
}