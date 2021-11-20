export interface Order {
  quantity: number;
  cost: number;
  notes?: number;
  // paymentType: PaymentType;
  serviceProviderId: string;
  to: Location;
  orderType: string;
  // items: Record<string, CartItem>;
  // smnt: String
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