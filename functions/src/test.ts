
import * as firebase from "firebase-admin";
// import { AssignDriverDetails, assignDriver } from "./delivery/assignDriver";
// import { AssignCompanyDetails, assignDeliveryCompany } from "./restaurant/assignDeliveryCompany";
// import { OperatorType } from "./shared/models/Generic/Generic";
// import { OrderType } from "./shared/models/Generic/Order";
// import { DeliveryDriverType } from "./shared/models/Services/Delivery/DeliveryOrder";
// import { CheckoutRequest, checkout } from "./restaurant/checkoutCart";
// import { AppType, Location } from "./shared/models/Generic/Generic";
// import { PaymentType } from "./shared/models/Generic/Order";
// import { RestaurantOrderType } from "./shared/models/Services/Restaurant/RestaurantOrder";
firebase.initializeApp({
  databaseURL: "http://localhost:9000/?ns=mezcalmos-31f1c-default-rtdb"
});
process.env.FUNCTIONS_EMULATOR = "true"
// const location: Location = {
//   lat: 44,
//   lng: 23,
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
// checkout(4411, checkoutRequest);

// let statusDetails = {
//   orderId: 14,
//   fromRestaurantOperator: true
// }
// readyForPickupOrder(2, statusDetails)

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

// let authorizeDetails: AuthorizeDetails = {
//   restaurantOwnerOperatorId: 3,
//   newOperatorUserId: 5,
//   newOperatorNotificationToken: "rty"
// }

// authorizeOperator(4, authorizeDetails);

// let assignDriverDetails: AssignDriverDetails = {
//   deliveryId: 1,
//   deliveryDriverId: 20,
//   orderType: OrderType.Restaurant,
//   orderId: 1,
//   deliveryDriverType: DeliveryDriverType.DeliveryDriver,
//   changeDriver: false,
//   operatorType: OperatorType.Restaurant,
//   deliveryCompanyId: 1
// }

// assignDriver(1, assignDriverDetails);

// let changeDeliveryStatusDetails: ChangeDeliveryStatusDetails = {
//   deliveryId: 22,
//   deliveryDriverId: 1,
//   deliveryDriverType: DeliveryDriverType.DeliveryDriver,
//   restaurantOrderId: 14,
// }
// deliveryDriverAtPickup(6, changeDeliveryStatusDetails)
// startDelivery(6, changeDeliveryStatusDetails)
// deliveryDriverAtDropoff(6, changeDeliveryStatusDetails)
// finishDelivery(6, changeDeliveryStatusDetails)

// let assignCompanyDetails: AssignCompanyDetails = {
//   deliveryCompanyId: 1,
//   restaurantOrderId: 1
// }
// assignDeliveryCompany(1, assignCompanyDetails)