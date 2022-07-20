import { PaymentType } from "./Order";

export interface PaymentInfo {
  stripeId: string;
  acceptedPayments: Record<PaymentType, boolean>;
}

export type StripeIds = Record<string, string>;