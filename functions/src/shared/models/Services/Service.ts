import { ServiceProviderStripeInfo } from "../../../utilities/stripe/model";
import { AuthorizationStatus, Language } from "../Generic/Generic";
import {  PaymentType } from "../Generic/Order";
import { UserInfo } from "../Generic/User";

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
  service_provider_id: number;
  service_provider_type: ServiceProviderType;
  operator_deep_link?: string; 
  operator_qr_image_link?: string;
  driver_deep_link?: string; 
  driver_qr_image_link?: string; 

}
export enum ServiceProviderType {
  Restaurant = "restaurant",
  Laundry = "laundry",
  Taxi = "taxi"
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
  FlatAmount = "flat_amount",
  Percentage = "percentage",
  AnotherSameFlat = "another_same_flat",
  AnotherSamePercentage = "another_same_percentage",
  StoreCredit = "store_credit",
}