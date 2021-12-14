import { OrderType } from "./Order";
import { UserInfo } from "./User";


export interface Chat {
  chatType: ChatType;
  orderType?: OrderType;
  messages?: Record<string, Message>;
  participants: Record<string, Participant>;
}

export enum ChatType {
  Order = "order",
}

export enum ParticipantType {
  Customer = "customer",
  Taxi = "taxi",
  // TaxiAdmin = "taxiAdmin",
  DeliveryAdmin = "deliveryAdmin",
  Restaurant = "restaurant"
}

export interface Participant extends UserInfo {
  particpantType: ParticipantType
}

export interface Message {
  orderId: string;
  userId: string;
  notified?: boolean;
  message: string,
  timestamp: string
}