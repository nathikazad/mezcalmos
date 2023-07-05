import { Language } from "../Generic/Generic"
import { ServiceProviderType } from "./Service"

export interface Offer {
    id: number,
    name?: Record<Language, string>,
    serviceProviderId: number,
    serviceProviderType: ServiceProviderType,
    offerType: OfferType,
    couponCode?: string,
    details: OfferDetails,
    status: OfferStatus,
  }
  
  export enum OfferType {
    Promotion = "promotion",
    Coupon = "Coupon",
    MonthlySubscription = "monthlySubscription",
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
    offerForOrder: string, // anyOrder/firstOrder
    offerForItems?: string, // particularItems/particularCategories
    discountType: DiscountType, // flatAmount/percentage/anotherSameFlat/anotherSamePercentage/storeCredit
    discountValue: number,
    minimumOrderAmount?: number,
    items?: Array<number>, // Array<itemsIds>,
    categories?: Array<number>, // Array<categoryIds>,
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