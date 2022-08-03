export enum StripePaymentStatus {
  Authorized = "authorized",
  Captured = "captured",
  Cancelled = "cancelled",
}
export interface StripePaymentInfo {
  id: string,
  stripeFees: number,
  amountCharged: number,
  amountRefunded: number,
  brand?: string,
  expMonth?: number,
  expYear?: number,
  last4?: string,
  status: StripePaymentStatus,
  serviceProviderAccount: string,
}

