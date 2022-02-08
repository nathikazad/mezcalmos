import { Location } from '../../Generic/Generic';
import { PaymentType } from '../../Generic/Order';

export interface TaxiOrderRequest {
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