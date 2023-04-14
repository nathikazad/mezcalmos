import { AuthorizationStatus, Location, NotificationInfo } from "./Generic";
import { OrderType, PaymentType } from "./Order";
import { UserInfo } from "./User";
import {
  ForegroundNotification,
  NotificationForQueue,
  OrderNotification,
} from "../Notification";
import { ParticipantType } from "./Chat";

export interface DeliveryOrder {
  deliveryId: number;
  pickupLocation?: Location;
  pickupLocationText?: string;
  dropoffLocation: Location;
  deliveryDriverId?: number;
  chatWithServiceProviderId?: number;
  packageReady: boolean;
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
  serviceProviderId: number;
  serviceProviderType: DeliveryServiceProviderType;
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
  direction: DeliveryDirection;
  distanceFromBase?: number;
  changePriceRequest?: DeliveryChangePriceRequest
}
export enum DeliveryDirection {
  FromCustomer = "fromCustomer",
  ToCustomer = "toCustomer",
}

export interface DeliveryDriver {
  id: number;
  userId: number;
  deliveryCompanyType?: DeliveryServiceProviderType;
  deliveryCompanyId?: number;
  status: AuthorizationStatus;
  appVersion?: string;
  currentLocation?: Location;
  user?: UserInfo;
  online?: boolean;
  notificationInfo?: NotificationInfo;
}

// export interface DeliveryCompany extends ServiceProvider {
//   deliveryoperators?: DeliveryOperator[];
// }
export interface DeliveryDetails {
    minimumCost?: number,
    costPerKm?: number,
    radius?: number,
    freeDeliveryMinimumCost?: number,
    freeDeliveryKmRange?: number,
    deliveryAvailable: boolean;
    customerPickup: boolean;
    selfDelivery: boolean;
}
export interface DeliveryChangePriceRequest {
  status: ChangePriceStatus,
  newPrice: number,
  oldPrice: number,
  reason: string
}
export enum ChangePriceStatus {
  Requested = "requested",
  Accepted = "accepted",
  Rejected = "rejected",
}
export enum DeliveryOrderStatus {
  OrderReceived = "orderReceived",
  OnTheWayToPickup = "onTheWayToPickup",

  AtPickup = "atPickup",
  OnTheWayToDropoff = "onTheWayToDropoff",
  AtDropoff = "atDropoff",
  Delivered = "delivered",
  CancelledByCustomer = "cancelledByCustomer",
  CancelledByDeliverer = "cancelledByDeliverer",
  CancelledByServiceProvider = "cancelledByServiceProvider",
  CancelledByAdmin = "cancelledByAdmin",
}

export enum DeliveryServiceProviderType {
  Restaurant = "restaurant",
  DeliveryCompany = "deliveryCompany",
  Laundry = "laundry",
}

export interface NewDeliveryOrderNotification extends OrderNotification {
  deliveryDriverType: ParticipantType;
}

export interface CancelDeliveryOrderNotification extends OrderNotification {
  deliveryDriverType: ParticipantType;
}

export interface DeliveryOrderStatusChangeNotification
  extends OrderNotification {
  status: DeliveryOrderStatus;
}

export interface AssignDeliveryCompanyNotification
  extends ForegroundNotification {
  orderType: OrderType;
  orderId: number;
  deliveryCompanyId: number;
}

export interface AssignDeliveryCompanyNotificationForQueue
  extends NotificationForQueue {
  orderType: OrderType;
  orderId: number;
  deliveryCompanyId: number;
}

export interface AuthorizeDriverNotification extends ForegroundNotification {
  newDriverName: string;
  newDriverImage: string;
}
export interface DriverApprovedNotification extends ForegroundNotification {
  approved: boolean;
}
export interface PriceChangeApprovalNotification extends ForegroundNotification {
  accepted: boolean;
}

export interface DeliveryOperatorApprovedNotification
  extends ForegroundNotification {
  operatorId: number;
  approved: boolean;
  DeliveryCompanyName: string;
  DeliveryCompanyId: number;
}

export interface DeliveryAdmin {
  authorized: boolean;
  versionNumber: string;
  notificationInfo: NotificationInfo;
}
