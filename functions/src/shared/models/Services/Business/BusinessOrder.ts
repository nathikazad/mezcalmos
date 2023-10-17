import { UserInfo } from "firebase-functions/v1/auth";
import { CustomerAppType } from "../../Generic/Generic";
import { OrderNotification } from "../../Notification";
import { Business, BusinessItemDetails, OfferingType, TimeUnit } from "./Business";

export interface BusinessOrder {
    orderId: number;
    customerId: number;
    businessId: number;
    spDetailsId: number;
    status: BusinessOrderRequestStatus;
    business?: Business;
    items: Array<BusinessOrderItem>;
    cost: number;
    reviewId?: number;
    orderTime?: string;
    customerAppType: CustomerAppType;
    notes?: string;
    chatId?: number;
    cancellationTime?: string;
    customer?: UserInfo,
}

export interface BusinessOrderItem {
    id: number;
    itemId: number;
    offeringType: OfferingType;
    parameters: BusinessItemParameters;
    cost: number;
    time?: string;
    available?: boolean;
    item?: BusinessItemDetails;
    orderRequestId?: number;
}

export interface BusinessItemParameters {
    previousCost?: number;
    timeUnit?: TimeUnit;
    previoustime?: string;
    numberOfUnits?: number;
    guests?: number;
    roomType?: string;
}
export enum BusinessOrderRequestStatus {
    RequestReceived = "requestReceived",
    ModificationRequestByBusiness = "modificationRequestByBusiness",
    CancelledByBusiness = "cancelledByBusiness",
    Confirmed = "confirmed",
    CancelledByCustomer = "cancelledByCustomer"
}

export interface BusinessCart {
    customerId: number;
    businessId?: number;
    cost: number;
    items: Array<BusinessOrderItem>;
    discountValue: number;
    appliedOffers: Array<number>;
}

export interface NewBusinessOrderRequestNotification extends OrderNotification {
    business?: {
        name: string,
        image: string,
        id: number
    }
}
export interface BusinessStatusChangeNotification extends OrderNotification {
    status: BusinessOrderRequestStatus
  }