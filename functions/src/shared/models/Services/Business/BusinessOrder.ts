import { CustomerAppType } from "../../Generic/Generic";
import { OrderNotification } from "../../Notification";
import { Business, BusinessItemDetails, TimeUnit } from "./Business";

export interface BusinessOrder {
    orderId: number;
    customerId: number;
    businessId: number;
    spDetailsId: number;
    status: BusinessOrderRequestStatus;
    business?: Business;
    items: Array<BusinessOrderItem>;
    estimatedCost: number;
    finalCost?: number;
    commenceTime: string;
    reviewId?: number;
    orderTime?: string;
    customerAppType: CustomerAppType;
    notes?: string;
    chatId?: number;
    cancellationTime?: string;
}

export interface BusinessOrderItem {
    id: number;
    itemDetailsId: number;
    available?: boolean;
    item?: BusinessItemDetails;
    parameters: BusinessItemParameters;
    orderRequestId?: number;
}

export interface BusinessItemParameters {
    estimatedCost: number;
    finalCost?: number;
    timeUnit?: TimeUnit;
    estimatedFromTime: string;
    finalFromTime: string;
    numberOfUnits?: number;
    guests?: number;
}
export enum BusinessOrderRequestStatus {
    RequestReceived = "requestReceived",
    ApprovedByBusiness = "approvedByBusiness",
    ModificationRequestByBusiness = "modificationRequestByBusiness",
    CancelledByBusiness = "cancelledByBusiness",
    ConfirmedByCustomer = "confirmedByCustomer",
    CancelledByCustomer = "cancelledByCustomer",
    InProgress = "inProgress",
    Completed = "completed"
}

export interface BusinessCart {
    customerId: number;
    businessId: number;
    cost: number;
    items: Array<BusinessOrderItem>;
    discountValue?: number;
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