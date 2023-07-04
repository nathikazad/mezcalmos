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
  serviceProviderDetailsId?: number;
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
  customerFlyerLinks?: Record<Language, string>;
}
export enum ServiceProviderType {
  Restaurant = "restaurant",
  Laundry = "laundry",
  Business = "business",
  DeliveryCompany = "deliveryCompany",
  Customer = "customer",
  DeliveryDriver = "deliveryDriver"
}

export interface Offer {
  id: number,
  serviceProviderId: number,
  serviceProviderType: ServiceProviderType,
  offerType: OfferType,
  couponCode?: string,
  details: OfferDetails,
  // status: OfferStatus
}

export enum OfferType {
  Promotion = "promotion",
  Coupon = "Coupon"
}
export enum OfferStatus {
  Active = "active",
  Inactive = "inactive",
}
export interface Discount {
  discountType: DiscountType,
  discountAmount: number
}

export interface OfferDetails {
  offerForOrder: string, // any_order/first_order
  offerForItems?: string, // particular_items/particular_categories
  discountType: DiscountType, // flat_amount/percentage/another_same_flat/another_same_percentage/store_credit
  discountValue: number,
  items?: Array<number>, // Array<items-ids>,
  categories?: Array<number>, // Array<category-ids>,
  validityRangeStart?: string // date_time both for coupon and promo
  validityRangeEnd?: string // date_time
  weeklyRepeat: boolean
  couponReusable?: boolean
}

export enum DiscountType {
  FlatAmount = "flatAmount",
  Percentage = "percentage",
  AnotherSameFlat = "anotherSameFlat",
  AnotherSamePercentage = "anotherSamePercentage",
  StoreCredit = "storeCredit",
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

export interface ServiceProviderDeletedNotification extends ForegroundNotification {
  serviceProviderName?: string,
  serviceProviderId: number,
  serviceProviderType: ServiceProviderType,
}