import { Language } from "../../Generic/Generic";
import { SelectedOption } from "./RestaurantOrder";

export interface Cart {
  customerId: number;
  restaurantId?: number;
  cost: number;
  items: Array<CartItem>;
}

export interface CartItem {
  cartItemId?: number;
  itemId: number;
  customerId: number;
  selectedOptions?: Array<SelectedOption>;
  quantity: number;
  costPerOne: number;
  notes?: string;
  name: Record<Language, string>;
  image?:string;
}
