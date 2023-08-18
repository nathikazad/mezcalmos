import { OrderStripeInfo } from "../stripe";
import { CustomerAppType } from "./Generic";
import { UserInfo } from "./User";

export interface Order {
  orderId: number;
  spDetailsId: number;
  customerId: number;
  paymentType: PaymentType;
  refundAmount?: number;
  reviewId?: number;
  deliveryType: DeliveryType;
  orderTime?: string;
  firebaseId?: string;
  customerAppType: CustomerAppType;
  notes?: string;
  tax?: number;
  deliveryCost: number;
  chatId?: number;
  scheduledTime?: string;
  stripeInfo?: OrderStripeInfo;
  stripeFees?: number | null;
  cancellationTime?: string;
  discountValue?: number;
  totalCost?: number;
  itemsCost?: number;
}
export enum DeliveryType {
  Pickup = "pickup",
  Delivery = "delivery",
}

// export enum DeliveryAction {
//   Pickup = "pickup",
//   DropOff = "dropoff",
// }

export enum OrderType {
  Taxi = "taxi",
  Restaurant = "restaurant",
  Laundry = "laundry",
  Courier = "courier",
  Business = "business",
}
//TODO

export const pluralizeOrderType = function (orderType: OrderType): string {
  switch (orderType) {
    case OrderType.Taxi:
      return "taxis";
    case OrderType.Restaurant:
      return "restaurants";
    case OrderType.Laundry:
      return "laundries";
    case OrderType.Courier:
      return "couriers";
    case OrderType.Business:
      return "businesses";
  }
}

export enum PaymentType {
  Cash = "cash",
  Card = "card",
  BankTransfer = "bankTransfer"
}

// export enum SecondaryChat {
//   ServiceProviderDropOffDriverChat = "serviceProviderDropOffDriver",
//   ServiceProviderPickupDriverChat = "serviceProviderPickupDriver",
//   CustomerDropOffDriverChat = "customerDropOffDriver",
//   CustomerPickupDriverChat = "customerPickupDriver"
// }

export interface DeliverableOrder extends Order {
  dropoffDriver?: DeliveryDriverInfo;
  dropOffShippingCost?: number;
}

export interface TwoWayDeliverableOrder extends DeliverableOrder {
  pickupDriver?: DeliveryDriverInfo;
  pickupShippingCost?: number;
}

export interface DeliveryDriverInfo extends UserInfo {
}

export interface CounterOffer {
  price: number;
  time: string;
  name?: string;
  image?: string;
  status: CounterOfferStatus;
  expiryTime: string;
}
export enum CounterOfferStatus {
  Requested = "requested",
  Accepted = "accepted",
  Rejected = "rejected",
  Cancelled = "cancelled",
}
export interface CounterOfferResponse {
  success: boolean,
  error?: CounterOfferError
  unhandledError?: string,
}
export enum CounterOfferError {
  UnhandledError = "unhandledError",
  OrderNotFound = "orderNotFound",
  DriverNotFound = "driverNotFound",
  DriverAlreadyAssigned = "driverAlreadyAssigned",
  InvalidDriverId = "invalidDriverId",
  StatusNotOrderReceived = "statusNotOrderReceived",
  DriverUnAuthorized = "driverUnAuthorized",
  DriverCompanyNotChosen = "driverCompanyNotChosen",
  CustomerNotFound = "customerNotFound",
}

export interface AssignDriverDetails {
  orderId: number,
  driverId: number,
  changeDriver?: boolean,
}
export interface AssignDriverResponse {
  success: boolean,
  error?: AssignDriverError
  unhandledError?: string,
}

export enum AssignDriverError {
  UnhandledError = "unhandledError",
  OrderNotFound = "orderNotFound",
  DriverNotFound = "driverNotFound",
  OperatorNotFound = "operatorNotFound",
  InvalidOperator = "invalidOperator",
  UnauthorizedDriver = "unauthorizedDriver",
  ServiceProviderDeliveryChatNotFound = "serviceProviderDeliveryChatNotFound",
  DriverAlreadyAssigned = "driverAlreadyAssigned",
  IncorrectOrderId = "incorrectOrderId",
  NoCustomerOffer = "noCustomerOffer",
}