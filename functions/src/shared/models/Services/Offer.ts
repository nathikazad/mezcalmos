import { Language } from "../Generic/Generic";
import { OrderType } from "../Generic/Order";
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
  // influencer code for influencers
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
  Influencer = "influencer",
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

  // flatAmount/percentage/storeCredit
  discountType: DiscountType;

  discountValue: number;

  // // entireOrder/particularItems/particularCategories
  // eligibleForReward?: string;

  // // particularItems/particularCategories
  // rewardType?: string;
  
  // rewardItems?: Array<number>;
  // rewardCategories?: Array<number>;
  minimumOrderAmount?: number;
  influencerCommission?: InfluencerCommission;

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
export interface InfluencerCommission {
  commissionType: CommissionType;
  value: number;
}

export interface InfluencerOfferDetails {
  rewardType: DiscountType;
  rewardValue: number;
}

export enum CommissionType {
  FlatAmount = "flatAmount",
  Percentage = "percentage",
}

export enum DiscountType {
  FlatAmount = "flatAmount",
  Percentage = "percentage",
  // ParticularItems = "particularItems",
  // AnotherSamePercentage = "anotherSamePercentage",
  StoreCredit = "storeCredit",
}

export interface OfferApplied {
  offerId: number;
  orderId: number;
  orderType: OrderType;
  discount: number;
  commission: number;
}