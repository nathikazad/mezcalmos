import { Location, NotificationInfo } from "../../Generic/Generic";
import { PaymentType } from "../../Generic/Order";
import { UserInfo } from "../../Generic/User";
import { OrderNotification } from "../../Notification";

export interface DeliveryOrder {
    deliveryId?: number;
    pickupLocation: Location;
    dropoffLocation: Location;
    deliveryDriverType?: DeliveryDriverType
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
    serviceProviderType?: ServiceProviderType;
    tripPolyline?: string;
    deliveryCost: number;
    packageCost?: number;
    currentGps?: Location
    tripDistance?: number;
    tripDuration?: number;
    orderTime: string;
    cancellationTime?: string;
    deliveryDriver?: DeliveryDriver;
}

export interface DeliveryDriver {
    id?: number,
    userId: number,
    deliveryCompanyType?: string,
    deliveryCompanyId?: number,
    status?: string,
    appVersion?: string,
    currentLocation?: Location
    user?: UserInfo,
    online?: boolean,
    notificationInfo?: NotificationInfo,
    deliveryDriverType: DeliveryDriverType
}

export enum DelivererStatus {
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

export enum ServiceProviderType {
    Restaurnt = "restaurant",
}

export enum DeliveryDriverType {
    RestaurantOperator = "restaurant",
    DeliveryDriver = "delivery_driver"
}

export interface NewDeliveryOrderNotification extends OrderNotification {
    deliveryDriverType: DeliveryDriverType
}
  
export interface CancelDeliveryOrderNotification extends OrderNotification {
    deliveryDriverType: DeliveryDriverType
}

export interface DeliveryOrderStatusChangeNotification extends OrderNotification {
    status: DeliveryOrderStatus
}