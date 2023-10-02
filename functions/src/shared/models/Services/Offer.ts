import { Language } from "../Generic/Generic";
import { OfferingType } from "./Business/Business";
import { ServiceProviderType } from "./Service";

export interface Offer {
  id: number;
  name?: Record<Language, string>;
  nameTranslations?: Array<Record<Language, string>>;
  nameId?: number;
  serviceProviderId: number;
  serviceProviderType: ServiceProviderType;
  offerType: OfferType;
  couponCode?: string;
  details: OfferDetails;
  status: OfferStatus;
  serviceProviderName?: string;
  serviceProviderImage?: string;
  influencerDetails?: InfluencerOfferDetails;
}

export enum OfferType {
  Promotion = "promotion",
  Coupon = "coupon",
  MonthlySubscription = "monthlySubscription",
}
export enum OfferStatus {
  Active = "active",
  Inactive = "inactive",
}
export interface Discount {
  discountType: DiscountType;
  discountAmount: number;
}

export interface OfferDetails {
  // anyOrder/firstOrder
  offerForOrder: string;
  // particularItems/particularCategories
  offerForItems?: string;
  // flatAmount/percentage/anotherSameFlat/anotherSamePercentage/storeCredit
  discountType: DiscountType;
  discountValue: number;
  minimumOrderAmount?: number;
  // Array<itemsIds>,
  items?: Array<number>;
  // Array<categoryIds>,
  categories?: Array<number>;
  nameIds?: Array<number>;
  // Array<offeringTypes>,
  offeringTypes?: Array<OfferingType>;
  // date_time both for coupon and promo
  validityRangeStart?: string;
  // date_time
  validityRangeEnd?: string;
  weeklyRepeat: boolean;
}
export interface InfluencerOfferDetails {
  rewardType: DiscountType;
  rewardValue: number;
}

export enum DiscountType {
  FlatAmount = "flatAmount",
  Percentage = "percentage",
  AnotherSameFlat = "anotherSameFlat",
  AnotherSamePercentage = "anotherSamePercentage",
  StoreCredit = "storeCredit",
}
