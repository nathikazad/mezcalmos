import { ServiceProviderStripeInfo } from "../../../utilities/stripe/model";
import { AuthorizationStatus } from "../Generic/Generic";
import { PaymentType } from "../Generic/Order";
import { UserInfo } from "../Generic/User";

export interface State {
  authorizationStatus: AuthorizationStatus;
  open: boolean;
}

export interface Service {
  state: State;
  info: UserInfo;
  details: {
    paymentInfo: PaymentInfo
  };
}

export interface PaymentInfo {
  stripe: ServiceProviderStripeInfo;
  acceptedPayments: Record<PaymentType, boolean>;
}