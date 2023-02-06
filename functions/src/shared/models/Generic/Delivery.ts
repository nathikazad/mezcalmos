import { Location, NotificationInfo } from "./Generic";
import { OrderType, PaymentType } from "./Order";
import { UserInfo } from "./User";
import { ForegroundNotification, NotificationForQueue, OrderNotification } from "../Notification";
import { ParticipantType } from "./Chat";

export interface DeliveryOrder {
    deliveryId?: number;
    pickupLocation: Location;
    dropoffLocation: Location;
    deliveryDriverType?: ParticipantType
    deliveryDriverId?: number;
    chatWithServiceProviderId?: number;
    
    chatWithCustomerId: number;
    paymentType: PaymentType;
    stripePaymentId?: number;
    estimatedPackageReadyTime?: string;
    actualPackageReadyTime?: string;
    estimatedArrivalAtPickupTime?: string;
    actualArrivalAtPickupTime?: string;
    estimatedArrivalAtDropoffTime?: string;
    actualArrivalAtDropoffTime?: string;
    actualDeliveredTime?: string;
    status: DeliveryOrderStatus;
    driverReviewByServiceProviderId?: number;
    driverReviewByCustomerId?: number;
    serviceProviderReviewBydriverId?: number;
    customerReviewByDriverId?: number;
    customerId: number;
    serviceProviderId?: number;
    serviceProviderType?: DeliveryServiceProviderType;
    tripPolyline?: string;
    deliveryCost: number;
    packageCost?: number;
    currentGps?: Location
    tripDistance?: number;
    tripDuration?: number;
    orderTime: string;
    cancellationTime?: string;
    deliveryDriver?: DeliveryDriver;
    orderType: OrderType;
}

export interface DeliveryDriver {
    id?: number,
    userId: number,
    deliveryCompanyType?: DeliveryCompanyType,
    deliveryCompanyId?: number,
    status?: string,
    appVersion?: string,
    currentLocation?: Location
    user?: UserInfo,
    online?: boolean,
    notificationInfo?: NotificationInfo,
    deliveryDriverType: ParticipantType
}
export enum DeliveryCompanyType {
    DeliveryCompany = "delivery_company",
    Restaurant = "restaurant"
}

export interface DeliveryOperator {
    id?: number,
    userId: number,
    deliveryCompanyId: number,
    status: DeliveryOperatorStatus,
    owner: boolean,
    appVersion?: string,
    currentGPS?: Location,
    // deliveryDriverType:,
    notificationInfo?: NotificationInfo,
    user?: UserInfo
}
export interface DeliveryDetails {
    minimumCost: number,
    costPerKm: number,
    radius: number,
    freeDeliveryMinimumCost?: number,
    freeDeliveryKmRange?: number,
}

export enum DelivererStatus {
    AwaitingApproval = "awaiting_approval",
    Authorized = "authorized",
    Banned = "banned"
}
export enum DeliveryOperatorStatus {
    AwaitingApproval = "awaiting_approval",
    Authorized = "authorized",
    Banned = "banned"
}

export enum DeliveryOrderStatus {
    OrderReceived = "orderReceived",
    PackageReady = "packageReady", 
    AtPickup = "atPickup", 
    OnTheWayToDropoff = "onTheWayToDropoff", 
    AtDropoff = "atDropoff", 
    Delivered = "delivered", 
    CancelledByCustomer = "cancelledByCustomer", 
    CancelledByDeliverer = "cancelledByDeliverer", 
    CancelledByServiceProvider = "cancelledByServiceProvider"
}

export enum DeliveryServiceProviderType {
    Restaurant = "restaurant",
    DeliveryCompany = "delivery_company"
}

// export enum DeliveryDriverType {
//     RestaurantOperator = "restaurant_operator",
//     DeliveryDriver = "delivery_driver"
// }

export interface NewDeliveryOrderNotification extends OrderNotification {
    deliveryDriverType: ParticipantType
}
  
export interface CancelDeliveryOrderNotification extends OrderNotification {
    deliveryDriverType: ParticipantType
}

export interface DeliveryOrderStatusChangeNotification extends OrderNotification {
    status: DeliveryOrderStatus
}

export interface AssignDeliveryCompanyNotification extends ForegroundNotification {
    orderType: OrderType,
    orderId: number,
    deliveryCompanyId: number
}

export interface AssignDeliveryCompanyNotificationForQueue extends NotificationForQueue {
    orderType: OrderType,
    orderId: number,
    deliveryCompanyId: number
}

export interface AuthorizeDriverNotification extends ForegroundNotification {
    newDriverName: string,
    newDriverImage: string,
}
export interface DriverApprovedNotification extends ForegroundNotification {
    approved: boolean,
}

export interface DeliveryOperatorApprovedNotification extends ForegroundNotification {
    operatorId: number,
    approved: boolean,
    DeliveryCompanyName: string,
    DeliveryCompanyId: number
}

export interface DeliveryAdmin {
    authorized: boolean,
    versionNumber: string,
    notificationInfo: NotificationInfo
}