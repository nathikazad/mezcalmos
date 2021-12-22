import { Order, OrderType } from "../Order"
import { UserInfo } from "../User"
import { OrderRequest } from "./OrderRequest"
import { Location } from '../Generic';
import { OrderNotification } from "../Notification";

export interface TaxiOrder extends Order {
  from: Location,
  cost: number,
  orderTime: string,
  status: TaxiOrderStatus,
  routeInformation: {
    duration: string,
    distance: string,
    polyline: string
  },
  acceptRideTime?: string,
  startRideTime?: string,
  finishRideTime?: string,
  driver: TaxiInfo;
  notificationStatus?: Record<string, NotificationStatus>;
  lock?: boolean;
}

export interface TaxiInfo extends UserInfo {
  taxiNumber?: string,
  sitio?: string
}

export enum TaxiOrderStatus {
  DroppedOff = "droppedOff",
  CancelledByCustomer = "cancelledByCustomer",
  CancelledByTaxi = "cancelledByTaxi",
  Expired = "expired",
  OnTheWay = "onTheWay",
  InTransit = "inTransit",
  LookingForTaxi = "lookingForTaxi"
}

export function orderInProcess(status: TaxiOrderStatus): boolean {
  return !(status == TaxiOrderStatus.CancelledByTaxi ||
    status == TaxiOrderStatus.CancelledByCustomer ||
    status == TaxiOrderStatus.DroppedOff)
}

export function constructTaxiOrder(
  orderRequest: OrderRequest,
  customer: UserInfo): TaxiOrder {
  let requestCopy: any = orderRequest;
  requestCopy.cost = orderRequest.estimatedPrice;
  delete requestCopy.estimatedPrice;
  return Object.assign(requestCopy,
    {
      customer: customer,
      orderType: OrderType.Taxi,
      status: TaxiOrderStatus.LookingForTaxi,
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