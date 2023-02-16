// **** Customer Models ****


export interface CustomerStripe {
  id: string,
  idsWithServiceProvider: Record<number, string>, // Record<OrderType, Record<number, string>>,
  cards: Record<string, CustomerCard>
}
// export const emptyIdsWithServiceProvider: Record<OrderType, Record<number, string>> = {
//   restaurant: {},
//   laundry: {},
//   taxi: {},
//   water: {}
// }
export interface CustomerCard {
  cardId: string,
  last4?: string,
  brand?: string,
  expMonth?: number,
  expYear?: number,
  idsWithServiceProvider: Record<number, string>, // Record<OrderType, Record<number, string>>,
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
  id: string;
  status: string;
  chargeFeesOnCustomer : boolean | null;
  chargesEnabled: boolean;
  payoutsEnabled: boolean;
  detailsSubmitted: boolean;
  requirements?: Array<string> | null;
  email: string | null;
}

export type StripeIds = Record<string, string>;
