import { OrderType, PaymentType } from "../../shared/models/Order"
import { GenericUser } from "../../shared/models/User"
import { OrderRequest } from "./OrderRequest"
import { Location } from '../../shared/models/Generic';
// status: "lookingForTaxi",

export interface TaxiOrder {
  from: Location,
  to: Location,
  customer: GenericUser;
  estimatedPrice: number,
  paymentType: PaymentType,
  orderType: OrderType,
  orderTime: string,
  status: TaxiOrdersStatus,
  routeInformation: {
    duration: string,
    distance: string,
    polyline: string
  }
}



export enum TaxiOrdersStatus {
  DroppedOff = "droppedOff",
  Cancelled = "cancelled",
  Expired = "expired",
  OnTheWay = "onTheWay",
  InTransit = "inTransit",
  LookingForTaxi = "lookingForTaxi"
}

export function constructTaxiOrder(
  orderRequest: OrderRequest,
  customer: GenericUser): TaxiOrder {
  return <TaxiOrder>{
    ...orderRequest,
    customer: customer,
    orderType: OrderType.Taxi,
    status: TaxiOrdersStatus.LookingForTaxi,
    orderTime: (new Date()).toISOString(),
  }
}