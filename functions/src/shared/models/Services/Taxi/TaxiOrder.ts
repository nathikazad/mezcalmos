import { Order, OrderType } from "../../Generic/Order"
import { UserInfo } from "../../Generic/User"
import { TaxiOrderRequest } from "./TaxiOrderRequest"
import { Location } from '../../Generic/Generic';
// import { RouteInformation } from '../../Generic/RouteInformation';
import { ForegroundNotification, NotificationForQueue, OrderNotification } from "../../Notification";

export interface TaxiOrder extends Order {
  from: Location,
  cost: number,
  status: TaxiOrderStatus,
  // routeInformation: RouteInformation,
  acceptRideTime?: string,
  startRideTime?: string,
  finishRideTime?: string,
  scheduledTime?: string,
  notificationStatus?: Record<string, NotificationStatus>;
  counterOffers?: Record<string, CounterOffer>;
  lock?: boolean;
  driver?: TaxiInfo;
}

export interface TaxiInfo extends UserInfo {
  taxiNumber?: string,
  sitio?: string
}

export enum TaxiOrderStatus {
  LookingForTaxiScheduled = "lookingForTaxiScheduled",
  Scheduled = "scheduled",
  LookingForTaxi = "lookingForTaxi",
  OnTheWay = "onTheWay",
  InTransit = "inTransit",
  DroppedOff = "droppedOff",
  Expired = "expired",
  CancelledByCustomer = "cancelledByCustomer",
  CancelledByTaxi = "cancelledByTaxi",
  ForwardingToLocalCompany = "forwardingToLocalCompany",
  ForwardingSuccessful = "forwardingSuccessful",
  ForwardingUnsuccessful = "forwardingUnsuccessful"
}

export function orderInProcess(status: TaxiOrderStatus): boolean {
  return !(status == TaxiOrderStatus.CancelledByTaxi ||
    status == TaxiOrderStatus.CancelledByCustomer ||
    status == TaxiOrderStatus.DroppedOff)
}

export function constructTaxiOrder(
  orderRequest: TaxiOrderRequest,
  customer: UserInfo): TaxiOrder {
  let requestCopy: any = orderRequest;
  requestCopy.cost = orderRequest.estimatedPrice;
  delete requestCopy.estimatedPrice;
  return Object.assign(requestCopy,
    {
      customer: customer,
      orderType: OrderType.Taxi,
      status: (requestCopy.scheduledTime) ?
        TaxiOrderStatus.LookingForTaxiScheduled : TaxiOrderStatus.LookingForTaxi,
      orderTime: (new Date()).toISOString(),
    });
}

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

export interface CounterOffer {
  price: number,
  offerValidTime: string,
  offerValidTimeEpoch: number,
  status: CounterOfferStatus
}

export enum CounterOfferStatus {
  Submitted = "submitted",
  Accepted = "accepted",
  Rejected = "rejected",
  Expired = "expired",
  Cancelled = "cancelled",
}

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