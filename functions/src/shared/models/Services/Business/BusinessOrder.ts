import { Order } from "../../Generic/Order";
import { OrderNotification } from "../../Notification";
import { Business, BusinessService, ServiceType } from "./Business";

export interface BusinessOrder extends Order {
    businessId: number;
    status: BusinessOrderRequestStatus;
    // categories?: Array<OrderCategory>;
    business?: Business;
    items: BusinessOrderRequestItem[];
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
    service?: BusinessService;
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