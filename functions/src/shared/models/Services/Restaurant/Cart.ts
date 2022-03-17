import { OrderType, PaymentType } from '../../Generic/Order';
import { Location } from '../../Generic/Generic';
export interface ChosenOneOption {
  chosenOptionName: string;
  chosenOptionId: string;
  name: string;
  chosenOptionCost: number;
}

export interface ChosenManyOption {
  name: string;
  chosenValue: boolean;
  chosenValueCost: number;
}

export interface Options {
  chosenOneOptions: Record<string, ChosenOneOption>;
  chosenManyOptions: Record<string, ChosenManyOption>;
}

export interface Item {
  quantity: number;
  id: string;
  notes: string;
  totalCost: number;
  image: string;
  costPerOne: number;
  name: string;
  options: Options;
}

export interface Cart {
  quantity: number;
  cost: number;
  itemsCost: number;
  shippingCost: number;
  notes?: string;
  paymentType: PaymentType;
  serviceProviderId: string;
  to: Location;
  orderType: OrderType.Restaurant;
  items: Record<string, Item>;
}

