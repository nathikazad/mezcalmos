import { OrderStripeInfo } from "../../../utilities/stripe/model";
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

export enum DeliveryAction {
  Pickup = "pickup",
  DropOff = "dropoff",
}

export enum OrderType {
  Taxi = "taxi",
  Restaurant = "restaurant",
  Laundry = "laundry",
  Courier = "courier",
  Water = "water"
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
    case OrderType.Water:
      return "waters";

  }
}

export enum PaymentType {
  Cash = "cash",
  Card = "card",
  BankTransfer = "bankTransfer"
}

export enum SecondaryChat {
  ServiceProviderDropOffDriverChat = "serviceProviderDropOffDriver",
  ServiceProviderPickupDriverChat = "serviceProviderPickupDriver",
  CustomerDropOffDriverChat = "customerDropOffDriver",
  CustomerPickupDriverChat = "customerPickupDriver"
}

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