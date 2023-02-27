import { Order } from "../../Generic/Order";
import { OrderNotification } from "../../Notification";
import { Business } from "./Business";

export interface BusinessOrder extends Order {
    businessId: number;
    status: BusinessOrderRequestStatus;
    // categories?: Array<OrderCategory>;
    business?: Business;
}

export interface BusinessOrderRequestItem {
    
}

export enum BusinessOrderRequestStatus {
    RequestReceived = "requestReceived",
    RequestApprovedByBusiness = "requestApprovedByBusiness",
    RequestRejectedByBusiness = "requestRejectedByBusiness",
    RequestConfirmedByCustomer = "requestConfirmedByCustomer",
    RequestCancelledByCustomer = "requestCancelledByCustomer",
}

export interface NewBusinessOrderRequestNotification extends OrderNotification {
    business?: {
        name: string,
        image: string,
        id: number
    }
}