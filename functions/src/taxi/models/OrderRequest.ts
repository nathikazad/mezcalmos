import { Location } from '../../shared/models/Generic';
import { PaymentType } from '../../shared/models/Order';

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