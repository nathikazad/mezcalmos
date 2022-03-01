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
  secondaryChats: Record<SecondaryChat, string>;
}

export enum OrderType {
  Taxi = "taxi",
  Restaurant = "restaurant",
  Laundry = "laundry",
  Water = "water"
}

export enum PaymentType {
  Cash = "cash",
  Card = "card"
}

export enum SecondaryChat {
  DeliveryAdminDropOffDriverChat = "deliveryAdminDropOffDriver",
  DeliveryAdminPickupDriverChat = "deliveryAdminPickupDriver",
}

export interface DeliverableOrder extends Order {
  dropoffDriver: DeliveryDriverInfo
}

export interface TwoWayDeliverableOrder extends DeliverableOrder {
  pickupDriver: DeliveryDriverInfo
}

export interface DeliveryDriverInfo extends UserInfo {
}