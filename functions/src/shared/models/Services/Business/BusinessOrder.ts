import { Order } from "../../Generic/Order";
import { OrderNotification } from "../../Notification";
import { Business, BusinessService, ServiceType, TimeUnit } from "./Business";

export interface BusinessOrder extends Order {
    businessId: number;
    status: BusinessOrderRequestStatus;
    // categories?: Array<OrderCategory>;
    business?: Business;
    items: BusinessOrderRequestItem[];
    estimatedCost: number;
    finalCost?: number;
    commenceTime?: string;
}

export interface BusinessOrderRequestItem {
    serviceId: number;
    serviceType: ServiceType;
    id: number;
    available?: boolean;
    service?: BusinessService;
    cost: BusinessItemCost;
}
export interface BusinessItemCost {
    estimatedCostPerOne: number;
    finalCostPerOne?: number;
    timeUnit?: TimeUnit;
    fromTime: string;
    toTime: string;
    quantity: number;
}
export enum BusinessOrderRequestStatus {
    RequestReceived = "requestReceived",
    ApprovedByBusiness = "approvedByBusiness",
    CancelledByBusiness = "cancelledByBusiness",
    ConfirmedByCustomer = "confirmedByCustomer",
    CancelledByCustomer = "cancelledByCustomer",
    InProgress = "inProgress",
    Completed = "completed"
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