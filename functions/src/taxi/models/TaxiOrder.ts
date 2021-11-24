import { OrderType, PaymentType } from "../../shared/models/Order"
import { UserInfo } from "../../shared/models/User"
import { OrderRequest } from "./OrderRequest"
import { Location } from '../../shared/models/Generic';
import { OrderNotification } from "../../shared/models/Notification";
// status: "lookingForTaxi",

export interface TaxiOrder {
  from: Location,
  to: Location,
  customer: UserInfo;
  estimatedPrice: number,
  paymentType: PaymentType,
  orderType: OrderType,
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
}

export interface TaxiInfo extends UserInfo {
  taxiNumber?: string
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

export function constructTaxiOrder(
  orderRequest: OrderRequest,
  customer: UserInfo): TaxiOrder {
  return <TaxiOrder>{
    ...orderRequest,
    customer: customer,
    orderType: OrderType.Taxi,
    status: TaxiOrderStatus.LookingForTaxi,
    orderTime: (new Date()).toISOString(),
  }
}

export interface TaxiOrderStatusChangeNotification extends OrderNotification {
  status: TaxiOrderStatus
}