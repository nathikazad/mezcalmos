import { Location } from '../Generic';
import { PaymentType } from '../Order';

export interface OrderRequest {
  from: Location,
  to: Location,
  estimatedPrice: number,
  paymentType: PaymentType
  routeInformation: {
    duration: string,
    distance: string,
    polyline: string
  }
}