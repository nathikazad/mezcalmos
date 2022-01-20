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