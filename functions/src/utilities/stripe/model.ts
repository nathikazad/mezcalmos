// **** Customer Models ****

import { OrderType } from "../../shared/models/Generic/Order";

export interface CustomerStripe {
  id: string,
  idsWithServiceProvider: Record<OrderType, Record<string, string>>,
  cards: Record<string, CustomerCard>
}

export interface CustomerCard {
  id: string,
  last4?: string,
  brand?: string,
  expMonth?: string,
  expYear?: string,
  idsWithServiceProvider: Record<OrderType, Record<string, string>>,
}

// **** Order Models ****
export enum StripePaymentStatus {
  Authorized = "authorized",
  Captured = "captured",
  Cancelled = "cancelled",
}
export interface OrderStripeInfo {
  id: string,
  stripeFees: number,
  amountCharged: number,
  amountRefunded: number,
  chargeFeesOnCustomer : boolean |null;
  brand?: string,
  expMonth?: number,
  expYear?: number,
  last4?: string,
  status: StripePaymentStatus,
  serviceProviderAccount: string,
}

export enum StripeStatus {
  InProcess = "inProcess",
  IsWorking = "isWorking",
  Inactive = "inactive"
}

// **** Service Provider Models ****
export interface ServiceProviderStripeInfo {
  id?: string;
  status: string;
  chargeFeesOnCustomer : boolean |null;
  chargesEnabled: boolean;
  payoutsEnabled: boolean;
  detailsSubmitted: boolean;
  requirements: Array<string>;
  email: string | null;
}

export type StripeIds = Record<string, string>;
