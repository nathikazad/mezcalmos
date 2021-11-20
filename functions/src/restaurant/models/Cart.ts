import { OrderType, PaymentType } from '../../shared/models/Order';

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
  notes?: number;
  paymentType: PaymentType;
  serviceProviderId: string;
  to: Location;
  orderType: OrderType.Restaurant;
  items: Record<string, Item>;
}

