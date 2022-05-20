import { OrderType, PaymentType } from '../../Generic/Order';
import { Language, Location } from '../../Generic/Generic';
import { RouteInformation } from '../../Generic/RouteInformation';

export interface Option {
  optionNames: Record<Language, string>;
  choices: Array<Choice>
}

export interface Choice {
  name: Record<Language, string>;
  cost: number;
}


export interface Item {
  quantity: number;
  id: string;
  notes: string;
  totalCost: number;
  image: string;
  costPerOne: number;
  name: string;
  chosenChoices: Record<string, Option>;
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
  routeInformation?:RouteInformation;
}

