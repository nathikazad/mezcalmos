import { Location } from '../../shared/models/Generic';
import { PaymentType } from '../../shared/models/Order';

// { 
// from: {address: Whitman Way & Shelter Creek Ln, San Bruno, CA 94066, USA, lat: 37.61740850144434, lng: -122.42423705756664},
// to: {address: Shelter Creek Ln & Fire Rd 3, San Bruno, CA 94066, USA, lat: 37.619963807040605, lng: -122.425517141819}, distance: {distance: {text: 0.3 km, value: 308}}, duration: {duration: {text: 1 min, value: 10}},
// estimatedPrice: 35, 
// paymentType: PaymentType.Cash, 
// polyline: {crdFd~ejVsBb@cCx@mBz@_Ah@{Ax@}





// {
//   from: {address: Junipero Serra Fwy, Los Altos, CA 94022, USA, lat: 37.38660109, lng: -122.15352321},
//   to: {address: 27690 Arastradero Rd, Los Altos Hills, CA 94022, USA, lat: 37.38789157912909, lng: -122.155407294631}, 
//   estimatedPrice: 35, 
//   paymentType: PaymentType.Cash, 
//   routeInformation: {
//     duration: Instance of 'RideDuration', 
//     distance: Instance of 'RideDistance', 
//     polyline: iaecFlbqhVuAdBiAfBq@pAm@zA
//   }
// }
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