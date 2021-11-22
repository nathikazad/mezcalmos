import { OrderType } from "./Order";


export interface Chat {
  chatType: "order",
  orderType?: OrderType
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

export interface Participant {
  name: string,
  image: string,
  particpantType: ParticipantType,
  language: string,
  phoneNumber?: string
}