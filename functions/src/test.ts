// import { RestaurantOrderType } from './shared/models/Services/Restaurant/RestaurantOrder';
// import { PaymentType } from "./shared/models/Generic/Order";
// import { Location } from "./shared/models/Generic/Generic";
// import * as firebase from "firebase-admin";
// // import { AssignDriverDetails, assignDriver } from "./delivery/assignDriver";
// // import { AssignCompanyDetails, assignDeliveryCompany } from "./restaurant/assignDeliveryCompany";
// // import { OperatorType } from "./shared/models/Generic/Generic";
// // import { OrderType } from "./shared/models/Generic/Order";
// // import { DeliveryDriverType } from "./shared/models/Services/Delivery/DeliveryOrder";
// import { createNewRestaurant, RestaurantDetails } from "./restaurant/createNewRestaurant";
// // import { readyForPickupOrder } from "./restaurant/adminStatusChanges"
// // import { cancelOrderFromCustomer } from "./restaurant/cancelOrderFromCustomer";
// import { AuthorizeDetails, authorizeOperator } from "./restaurant/authorizeOperator";
// import { prepareOrder } from "./restaurant/adminStatusChanges"
// import { cancelOrderFromCustomer } from "./restaurant/cancelOrderFromCustomer";
// import { Restaurant } from './shared/models/Services/Restaurant/Restaurant';
// import { getRestaurant } from './shared/graphql/restaurant/getRestaurant';

// import { checkout, CheckoutRequest } from "./restaurant/checkoutCart";
import { ParticipantType as _ParticipantType } from "./shared/models/Generic/Chat"
// import { AppType } from "./shared/models/Generic/Generic";
// import { PaymentType } from "./shared/models/Generic/Order";
// import { DeliveryType } from "./shared/models/Services/Restaurant/RestaurantOrder";
import { callUser as _callUser} from "./utilities/agora";

// firebase.initializeApp({
//   databaseURL: "http://localhost:9000/?ns=mezcalmos-31f1c-default-rtdb"
// });
process.env.FUNCTIONS_EMULATOR = "true"
// const location:Location = {
//   lat: 23,
//   lng : 44,
//   address: "Morocco, Agadir 77",
// }

// // let checkoutRequest: CheckoutRequest = {
// //   customerAppType: AppType.CustomerMobile,
// //   customerLocation: location,
// //   deliveryCost: 15,
// //   paymentType: PaymentType.Cash,
// //   notes: "My notes",
// //   restaurantId: 1,
// //   restaurantOrderType: RestaurantOrderType.Delivery,
// //   tripDistance: 0,
// //   tripDuration: 0,
// //   tripPolyline: "",
// // }

// let ch : CheckoutRequest = {
//     deliveryType: DeliveryType.Delivery,
//      tripDistance: 0, // this is null
//       customerLocation: {
//         address: 'Test _ Location ',
//         lat: 15.872451864887513,
//         lng: -97.0771243663329
//       },
//       customerAppType: AppType.Customer,
//       notes: '',
//       paymentType: PaymentType.Cash,
//       restaurantId: 1,
//       tripDuration: 0, // null
//       deliveryCost: 20,
//       tripPolyline: '' // null
// }


// // getRestaurant(checkoutRequest.restaurantId).then((restaurant: Restaurant) = {
// //    console.log(restaurant);
// // });
// console.log("Calling make order ====================>>>>>>>>>>>>>>>>>",ch);
_callUser(2, {chatId: 28, callerParticipantType: _ParticipantType.Customer}).then((resp) => {
  console.log(resp);
});

// checkout(2, ch).then((resp) => {
//   console.log(resp);
// });
// // let statusDetails = {
  
// //   orderId: 16,
// //   fromRestaurantOperator: true
// // }
// // prepareOrder(2, statusDetails)

// // cancelOrderFromCustomer(1, { orderId: 16 })

// let restaurantDetails:RestaurantDetails = {
//   name: "restaurant2",
//   image: "abc",
//   location: location,
//   schedule: JSON.parse('{"monday":{"from":"8:0","to":"20:0","isOpen":true},"tuesday":{"from":"8:0","to":"20:0","isOpen":true},"wednesday":{"from":"8:0","to":"20:0","isOpen":true},"thursday":{"from":"8:0","to":"20:0","isOpen":true},"friday":{"from":"8:0","to":"20:0","isOpen":true},"saturday":{"from":"8:0","to":"19:0","isOpen":false},"sunday":{"from":"8:0","to":"16:0","isOpen":false}}'),
//   customerPickup: false,
//   delivery:true,
//   restaurantOperatorNotificationToken: "aaa",
//   firebaseId: "5",
//   selfDelivery: true,
//   deliveryDetails: {
//     costPerKm: 2,
//     minimumCost: 40,
//     radius: 5000,
//     freeDeliveryKmRange: 0,
//     freeDeliveryMinimumCost: 100
//   }
// }

// });

// createNewRestaurant(4, restaurantDetails);

// // let authorizeDetails: AuthorizeDetails = {
// //   restaurantOwnerOperatorId: 3,
// //   newOperatorUserId: 5,
// //   newOperatorNotificationToken: "rty"
// // }

// // authorizeOperator(4, authorizeDetails);

// // let assignDriverDetails: AssignDriverDetails = {
// //   deliveryId: 1,
// //   deliveryDriverId: 20,
// //   orderType: OrderType.Restaurant,
// //   orderId: 1,
// //   deliveryDriverType: DeliveryDriverType.DeliveryDriver,
// //   changeDriver: false,
// //   operatorType: OperatorType.Restaurant,
// //   deliveryCompanyId: 1
// // }

// // assignDriver(1, assignDriverDetails);

// // let changeDeliveryStatusDetails: ChangeDeliveryStatusDetails = {
// //   deliveryId: 22,
// //   deliveryDriverId: 1,
// //   deliveryDriverType: DeliveryDriverType.DeliveryDriver,
// //   restaurantOrderId: 14,
// // }
// // deliveryDriverAtPickup(6, changeDeliveryStatusDetails)
// // startDelivery(6, changeDeliveryStatusDetails)
// // deliveryDriverAtDropoff(6, changeDeliveryStatusDetails)
// // finishDelivery(6, changeDeliveryStatusDetails)

// // let assignCompanyDetails: AssignCompanyDetails = {
// //   deliveryCompanyId: 1,
// //   restaurantOrderId: 1
// // }
// // assignDeliveryCompany(1, assignCompanyDetails)