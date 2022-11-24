// import { RestaurantOrderType } from './shared/models/Services/Restaurant/RestaurantOrder';
// import { PaymentType } from "./shared/models/Generic/Order";
// import { Location, AppType } from "./shared/models/Generic/Generic";
// import { checkout, CheckoutRequest } from "./restaurant/checkoutCart";

import { prepareOrder } from "./restaurant/adminStatusChanges"

// const location: Location = {
//   gps: {
//     type: "point",
//     coordinates: [23, 44]
//   },
//   address: "qwe",
// }

// const checkoutRequest: CheckoutRequest = {
//   customerAppType: AppType.CustomerMobile,
//   customerLocation: location,
//   deliveryCost: 15,
//   paymentType: PaymentType.Cash,
//   notes: "",
//   restaurantId: 1,
//   restaurantOrderType: RestaurantOrderType.Delivery,
//   tripDistance: 0,
//   tripDuration: 0,
//   tripPolyline: "",
//   estimatedFoodReadyTime: "abc",
//   items: [
//     {
//       itemId: 1,
//       quantity: 2,
//       costPerOne: 25
//     },
//     {
//       itemId: 2,
//       quantity: 1,
//       costPerOne: 30
//     }
//   ]
// }
// checkout(1, checkoutRequest);

let statusDetails = {
  orderId: 13,
  fromRestaurantOperator: true
}
prepareOrder(2, statusDetails)
