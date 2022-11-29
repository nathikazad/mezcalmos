import { AppType, GPS, Location, NotificationInfo } from "./Generic";
import { PaymentType } from "./Order";
import { UserInfo } from "./User";

export interface Delivery {
    deliveryId?: number;
    pickupLocation: Location;
    dropoffLocation: Location;
    delivererAppType?: AppType;
    delivererId?: number;
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
    status: DeliveryStatus;
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
    currentGps?: GPS;
    tripDistance?: number;
    tripDuration?: number;
    orderTime: string;
    deliverer?: Deliverer;
}

export interface Deliverer {
    id?: number,
    userId: number,
    deliveryCompanyType?: string,
    deliveryCompanyId?: number,
    status?: string,
    appVersion?: string,
    currentLocation?: Location
    user?: UserInfo,
    notificationInfo?: NotificationInfo
}

export enum DeliveryStatus {
    OrderReceived = "orderReceived",
}

export enum ServiceProviderType {
    Restaurnt = "restaurant",
}