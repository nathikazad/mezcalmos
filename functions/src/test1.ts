// import { setupServiceProvider } from "./utilities/stripe/serviceProvider"
import * as firebase from "firebase-admin";
import { checkout, CheckoutRequest } from "./restaurant/checkoutCart";
import { CustomerAppType } from "./shared/models/Generic/Generic";
import { DeliveryType, PaymentType } from "./shared/models/Generic/Order";
// import { updateServiceProvider } from "./utilities/stripe/serviceProvider";
// import { createNewRestaurant, RestaurantDetails } from "./restaurant/createNewRestaurant";
// import { Language } from "./shared/models/Generic/Generic";

firebase.initializeApp({
    databaseURL: "http://localhost:9000/?ns=mezcalmos-31f1c-default-rtdb"
  });
process.env.FUNCTIONS_EMULATOR = "true"

// setupServiceProvider(16543, { serviceProviderDetailsId: 20 }).then(() => {
//     console.log("done")
// })

// updateServiceProvider(16543, { serviceProviderDetailsId: 20 }).then(() => {
//     console.log("done")
// })

// let r: RestaurantDetails = {
//     name: "testRestaurant7",
//     image: "abc",
//     location: {
//         address: 'Test _ Location ',
//         lat: 15.872451864887513,
//         lng: -97.0771243663329
//     },
//     schedule: JSON.parse("{}"),
//     // restaurantOperatorNotificationToken?: string,
//     // firebaseId?: string,
//     // selfDelivery?: boolean,
//     // deliveryPartnerId?: number,
//     deliveryDetails: {
//         customerPickup: true,
//         deliveryAvailable: true,
//         selfDelivery: true,
//     },
//     language: {
//         [Language.EN]: true,
//         [Language.ES]: false,
//     }
//   }

// createNewRestaurant(16524, r)
const test = async () => {
  let ch : CheckoutRequest = {
    deliveryType: DeliveryType.Delivery,
     tripDistance: 0, // this is null
      customerLocation: {
        address: 'Test _ Location ',
        lat: 15.872451864887513,
        lng: -97.0771243663329
      },
      customerAppType: CustomerAppType.Native,
      notes: '',
      paymentType: PaymentType.Cash,
      restaurantId: 1,
      tripDuration: 0, // null
      deliveryCost: 20,
      tripPolyline: '' // null
  }
  let a = await checkout(16509, ch);
  console.log(a);
}
test()
