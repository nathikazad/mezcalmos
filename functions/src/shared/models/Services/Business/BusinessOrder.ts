import { Order } from "../../Generic/Order";
import { OrderNotification } from "../../Notification";
import { Business, Class, Rental, ServiceType } from "./Business";

export interface BusinessOrder extends Order {
    businessId: number;
    status: BusinessOrderRequestStatus;
    // categories?: Array<OrderCategory>;
    business?: Business;
    items?: BusinessOrderRequestItem[];
    estimatedCost: number;
    finalCost?: number;
}

export interface BusinessOrderRequestItem {
    serviceId: number;
    serviceType: ServiceType;
    quantity: number;
    id?: number;
    available?: boolean;
    finalCostPerOne?: number;
    service?: Rental | Class | Event;
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