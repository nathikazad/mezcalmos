import { Location } from '../../Generic/Generic';
import { PaymentType } from '../../Generic/Order';
import { RouteInformation } from '../../Generic/RouteInformation';

export interface TaxiOrderRequest {
  from: Location,
  to: Location,
  estimatedPrice: number,
  paymentType: PaymentType
  routeInformation: RouteInformation
}