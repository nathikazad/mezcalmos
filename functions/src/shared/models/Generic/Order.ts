import { Location } from "./Generic";
import { UserInfo } from "./User";

export interface Order {
  orderType: OrderType,
  serviceProviderId?: string,
  cost: number;
  paymentType: PaymentType,
  to: Location,
  customer: UserInfo,
  orderTime: string;
  secondaryChats: Record<SecondaryChat, string | null>;
}

export enum OrderType {
  Taxi = "taxi",
  Restaurant = "restaurant",
  Laundry = "laundry",
  Water = "water"
}

export const pluralizeOrderType = function (orderType: OrderType): string {
  switch (orderType) {
    case OrderType.Taxi:
      return "taxis";
    case OrderType.Restaurant:
      return "restaurants";
    case OrderType.Laundry:
      return "laundries";
    case OrderType.Water:
      return "waters";

  }
}

export enum PaymentType {
  Cash = "cash",
  Card = "card"
}

export enum SecondaryChat {
  ServiceProviderDropOffDriverChat = "serviceProviderDropOffDriver",
  ServiceProviderPickupDriverChat = "serviceProviderPickupDriver",
  CustomerDropOffDriverChat = "customerDropOffDriver",
  CustomerPickupDriverChat = "customerPickupDriver"
}

export interface DeliverableOrder extends Order {
  dropoffDriver?: DeliveryDriverInfo;
}

export interface TwoWayDeliverableOrder extends DeliverableOrder {
  pickupDriver?: DeliveryDriverInfo;
}

export interface DeliveryDriverInfo extends UserInfo {
}