// import { RestaurantOrderType } from './shared/models/Services/Restaurant/RestaurantOrder';
// import { PaymentType } from "./shared/models/Generic/Order";
// import { Location } from "./shared/models/Generic/Generic";
// import { checkout, CheckoutRequest } from "./restaurant/checkoutCart";
import * as firebase from "firebase-admin";
import { AuthorizeDetails, authorizeOperator } from "./restaurant/authorizeOperator";
// import { createNewRestaurant } from "./restaurant/createNewRestaurant";
// import { prepareOrder } from "./restaurant/adminStatusChanges"
// import { cancelOrderFromCustomer } from "./restaurant/cancelOrderFromCustomer";

firebase.initializeApp({
  databaseURL: "http://localhost:9000/?ns=mezcalmos-31f1c-default-rtdb"
});
process.env.FUNCTIONS_EMULATOR = "true"
// const location: Location = {
//   gps: {
//     type: "Point",
//     coordinates: [23, 44]
//   },
//   address: "qweul",
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
// }
// checkout(1, checkoutRequest);

// let statusDetails = {
//   orderId: 16,
//   fromRestaurantOperator: true
// }
// prepareOrder(2, statusDetails)

// cancelOrderFromCustomer(1, { orderId: 16 })

// let restaurantDetails = {
//   name: "restaurant2",
//   image: "abc",
//   location: location,
//   scheduleId: 1,
//   restaurantOperatorNotificationToken: "aaa",
//   firebaseId: "5"
// }
// createNewRestaurant(4, restaurantDetails);

let authorizeDetails: AuthorizeDetails = {
  restaurantOwnerOperatorId: 3,
  newOperatorUserId: 5,
  newOperatorNotificationToken: "rty"
}

authorizeOperator(4, authorizeDetails);