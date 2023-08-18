import { CounterOffer, PaymentType } from "../../Generic/Order"
import { UserInfo } from "../../Generic/User"
import { CustomerAppType, Location } from '../../Generic/Generic';
// import { RouteInformation } from '../../Generic/RouteInformation';
import { ForegroundNotification, NotificationForQueue, OrderNotification } from "../../Notification";
import { OrderStripeInfo } from "../../stripe";

export interface TaxiOrder  {
  id: number;
  fromLocation: Location;
  toLocation: Location;
  customerId: number;
  orderTime: string;
  status: TaxiOrderStatus,
  paymentType: PaymentType;
  tax?: number;
  stripeFees?: number;
  discountValue?: number;
  customerAppType: CustomerAppType;
  refundAmount: number;
  chatId: number;
  cost: number;
  finalCost?: number;
  driverId?: number;
  cancellationTime?: string;
  estimatedArrivalAtPickupTime?: string;
  actualArrivalAtPickupTime?: string;
  estimatedArrivalAtDropoffTime?: string;
  actualArrivalAtDropoffTime?: string;
  stripeInfo?: OrderStripeInfo;
  driverReviewByCustomerId?: number;
  customerReviewByDriverId?: number;
  taxiCompanyId?: number;
  tripPolyline?: string;
  tripDistance?: number;
  tripDuration?: number;
  billImage?: string;
  currentGps?: Location
  notifiedDrivers: Record<number, boolean>;
  chosenCompanies: Array<number>;
  counterOffers: Record<number, CounterOffer>;
  scheduledTime?: string,

  // routeInformation: RouteInformation,
  // acceptRideTime?: string,
  // startRideTime?: string,
  // finishRideTime?: string,
  // scheduledTime?: string,
  // notificationStatus?: Record<string, NotificationStatus>;
  // counterOffers?: Record<string, CounterOffer>;
  // lock?: boolean;
  // driver?: TaxiInfo;
}

// export interface TaxiInfo extends UserInfo {
//   taxiNumber?: string,
//   sitio?: string
// }

export enum TaxiOrderStatus {
  OrderReceived = "orderReceived",
  OnTheWayToPickup = "onTheWayToPickup",
  AtPickup = "atPickup",
  OnTheWayToDropoff = "onTheWayToDropoff",
  AtDropoff = "atDropoff",
  RideComplete = "rideComplete",
  CancelledByCustomer = "cancelledByCustomer",
  CancelledByDriver = "cancelledByDriver",
  CancelledByServiceProvider = "cancelledByServiceProvider",
  CancelledByAdmin = "cancelledByAdmin",
  // CancelledByTaxi = "cancelledByTaxi",
  // ForwardingToLocalCompany = "forwardingToLocalCompany",
  // ForwardingSuccessful = "forwardingSuccessful",
  // ForwardingUnsuccessful = "forwardingUnsuccessful"
}

export function orderInProcess(status: TaxiOrderStatus): boolean {
  return !(status == TaxiOrderStatus.RideComplete ||
    status == TaxiOrderStatus.CancelledByCustomer ||
    status == TaxiOrderStatus.CancelledByServiceProvider || 
    status == TaxiOrderStatus.CancelledByDriver || 
    status == TaxiOrderStatus.CancelledByAdmin)
}

// export function constructTaxiOrder(
//   orderRequest: TaxiOrderRequest,
//   customer: UserInfo): TaxiOrder {
//   let requestCopy: any = orderRequest;
//   requestCopy.cost = orderRequest.estimatedPrice;
//   delete requestCopy.estimatedPrice;
//   return Object.assign(requestCopy,
//     {
//       customer: customer,
//       orderType: OrderType.Taxi,
//       status: (requestCopy.scheduledTime) ?
//         TaxiOrderStatus.LookingForTaxiScheduled : TaxiOrderStatus.LookingForTaxi,
//       orderTime: (new Date()).toISOString(),
//     });
// }

export interface TaxiOrderStatusChangeNotification extends OrderNotification {
  status: TaxiOrderStatus
}

export interface NotificationStatus {
  sent: boolean,
  sentCount: number,
  sentTime: string,
  read?: boolean,
  readTime?: string,
  received?: boolean,
  receievedTime?: string
}

// export interface CounterOffer {
//   price: number,
//   offerValidTime: string,
//   offerValidTimeEpoch: number,
//   status: CounterOfferStatus
// }

// export enum CounterOfferStatus {
//   Submitted = "submitted",
//   Accepted = "accepted",
//   Rejected = "rejected",
//   Expired = "expired",
//   Cancelled = "cancelled",
// }

export interface CounterOfferNotificationForQueue extends NotificationForQueue {
  driver: UserInfo,
  orderId: number,
  customerId: number,
  price: number
}

export interface CounterOfferNotification extends ForegroundNotification {
  driver: UserInfo,
  orderId: number,
  customerId: number,
  price: number,
}