import { Language } from "../Generic/Generic"
import { OfferingType } from "./Business/Business"
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
    Coupon = "coupon",
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
    // anyOrder/firstOrder
    offerForOrder: string, 
    // particularItems/particularCategories
    offerForItems?: string, 
     // flatAmount/percentage/anotherSameFlat/anotherSamePercentage/storeCredit
    discountType: DiscountType,
    discountValue: number,
    minimumOrderAmount?: number,
    // Array<itemsIds>,
    items?: Array<number>, 
     // Array<categoryIds>,
    categories?: Array<number>,
    // date_time both for coupon and promo
    offeringTypes?: Array<OfferingType>,
    validityRangeStart?: string 
    // date_time
    validityRangeEnd?: string 
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