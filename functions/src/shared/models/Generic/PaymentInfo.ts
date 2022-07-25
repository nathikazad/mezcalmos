import { PaymentType } from "./Order";

export interface PaymentInfo {
  stripe: StripeInfo;
  acceptedPayments: Record<PaymentType, boolean>;
}

export enum StripeStatus {
  InProcess = "inProcess",
  IsWorking = "isWorking",
  Inactive = "inactive"
}

export interface StripeInfo {
  id?: string;
  status: string;
  chargesEnabled: boolean;
  payoutsEnabled: boolean;
  detailsSubmitted: boolean;
  requirements: Array<string>;
}

export type StripeIds = Record<string, string>;