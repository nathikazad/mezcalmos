import { RestaurantOrderType } from './shared/models/Services/Restaurant/RestaurantOrder';
import { PaymentType } from "./shared/models/Generic/Order";
import { AppType, Location } from "./shared/models/Generic/Generic";
import { checkout, CheckoutRequest } from "./restaurant/checkoutCart";
import * as firebase from "firebase-admin";
// import { ChangeDeliveryStatusDetails, finishDelivery } from "./delivery/restaurantStatusChange";
// import { DeliveryDriverType } from "./shared/models/Services/Delivery/DeliveryOrder";
// import { assignDriver, AssignDriverDetails } from "./delivery/assignDriver";
// import { AuthorizeDetails, authorizeOperator } from "./restaurant/authorizeOperator";
// import { OrderType } from "./shared/models/Generic/Order";
// import { DeliveryDriverType } from "./shared/models/Services/Delivery/DeliveryOrder";
// import { createNewRestaurant } from "./restaurant/createNewRestaurant";
// import { readyForPickupOrder } from "./restaurant/adminStatusChanges"
// import { cancelOrderFromCustomer } from "./restaurant/cancelOrderFromCustomer";
import { AuthorizeDetails, authorizeOperator } from "./restaurant/authorizeOperator";
import { prepareOrder } from "./restaurant/adminStatusChanges"
import { cancelOrderFromCustomer } from "./restaurant/cancelOrderFromCustomer";
import { Restaurant } from './shared/models/Services/Restaurant/Restaurant';
import { getRestaurant } from './shared/graphql/restaurant/getRestaurant';

firebase.initializeApp({
  databaseURL: "http://localhost:9000/?ns=mezcalmos-31f1c-default-rtdb"
});
process.env.FUNCTIONS_EMULATOR = "true"
const location: Location = {
  lat: 23,
  lng : 44,
  address: "Morocco, Agadir 77",
}

// let checkoutRequest: CheckoutRequest = {
//   customerAppType: AppType.CustomerMobile,
//   customerLocation: location,
//   deliveryCost: 15,
//   paymentType: PaymentType.Cash,
//   notes: "My notes",
//   restaurantId: 1,
//   restaurantOrderType: RestaurantOrderType.Delivery,
//   tripDistance: 0,
//   tripDuration: 0,
//   tripPolyline: "",


// }

let ch : CheckoutRequest = {

    restaurantOrderType: RestaurantOrderType.Pickup,
     tripDistance: 0, // this is null
      customerLocation: {
        address: 'Test _ Location ',
        lat: 15.872451864887513,
        lng: -97.0771243663329
      },
      customerAppType: AppType.CustomerMobile,
      notes: '',
      paymentType: PaymentType.Cash,
      restaurantId: 1,
      tripDuration: 0, // null
      deliveryCost: 20,
      tripPolyline: '' // null
}


// getRestaurant(checkoutRequest.restaurantId).then((restaurant: Restaurant) = {
//    console.log(restaurant);
// });
console.log("Calling make order ====================>>>>>>>>>>>>>>>>>",ch);
checkout(3, ch).then((resp) => {
  console.log(resp);
});
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

// });

// createNewRestaurant(4, restaurantDetails);

// let authorizeDetails: AuthorizeDetails = {
//   restaurantOwnerOperatorId: 3,
//   newOperatorUserId: 5,
//   newOperatorNotificationToken: "rty"
// }

// authorizeOperator(4, authorizeDetails);

// let assignDriverDetails: AssignDriverDetails = {
//   deliveryId: 22,
//   deliveryDriverId: 1,
//   orderType: OrderType.Restaurant,
//   orderId: 14,
//   deliveryDriverType: DeliveryDriverType.DeliveryDriver,
//   changeDriver: true,
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
