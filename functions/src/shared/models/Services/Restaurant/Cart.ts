import { Item, Option } from "./Item";

export interface Cart {
  customerId: number;
  restaurantId?: number;
  itemsCost: number;
  deliveryCost?: number;
  totalCost: number;
  items: Record<string, CartItem>;
}

export interface CartItem extends Item {
  cartItemId: number;
  itemId: number;
  customerId: number;
  selectedOption: Option;
  quantity: number;
  costPerOne: number;
  note?: string;
}

