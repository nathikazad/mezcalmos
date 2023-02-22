import * as functions from "firebase-functions";
import * as firebase from "firebase-admin";
import * as stripePaymentFunctions from './utilities/stripe/payment'
import * as stripeServiceProvderFunctions from './utilities/stripe/serviceProvider'
import * as stripeCardFunctions from './utilities/stripe/card'
import * as restaurantStatusChange from './restaurant/adminStatusChanges'
 import { createNewRestaurant } from "./restaurant/createNewRestaurant";
import { checkout } from "./restaurant/checkoutCart";
// import { addReview } from "./restaurant/addReview";
 import { cancelOrderFromCustomer } from "./restaurant/cancelOrderFromCustomer";
// import { requestRide } from "./taxi/request";
// import * as taxiStatusChange from './taxi/taxiStatusChange'
// import { acceptRide } from "./taxi/accept";
// import { cancelTaxiFromCustomer } from "./taxi/cancelTaxiFromCustomer";
// import * as adminStatusChanges from './taxi/adminStatusChanges'
import * as laundryStatusChange from './laundry/adminStatusChanges'
// import { createLaundry } from "./laundry/createNewLaundry";
// import { requestLaundry } from "./laundry/laundryRequest";
// import { cancelFromCustomer } from "./laundry/cancelLaundryFromCustomer";
// import * as laundryDelivery from './delivery/laundryStatusChange'
// import * as restaurantDelivery from './delivery/restaurantStatusChange'
import { HttpsError } from "firebase-functions/v1/auth";

import { getAuthUsingOTP, sendOTPForLogin } from "./utilities/otpAuth";
// import { assignDriver } from "./delivery/assignDriver";
// import { setEstimatedTime } from "./delivery/setEstimatedTime";
import * as userChanges from './utilities/userChanges'
// import { generateDriverLink,generateOperatorLink } from "./utilities/links/generate";
import { assignDriver } from "./delivery/assignDriver";
import { addDriver } from "./delivery/addDriver";
import { authorizeDriver } from "./delivery/authorizeDriver";
// import { authorizeRestaurantOperator } from "./restaurant/authorizeOperator";
// import { authorizeDeliveryOperator } from "./delivery/authorizeOperator";
import { callUser } from "./utilities/agora";
import { requestLaundry } from "./laundry/laundryRequest";
import { createLaundry } from "./laundry/createNewLaundry";
import { cancelLaundryFromCustomer } from "./laundry/cancelLaundryFromCustomer";
import { changeDeliveryStatus } from "./delivery/statusChange";
import { addOperator } from "./shared/operator/addOperator";
import { authorizeOperator } from "./shared/operator/authorizeOperator";
import { addRestaurantOperator } from "./restaurant/addRestaurantOperator";
import { authorizeRestaurantOperator } from "./restaurant/authorizeOperator";
import { addDeliveryOperator } from "./delivery/addDeliveryOperator";
import { authorizeDeliveryOperator } from "./delivery/authorizeOperator";

if (process.env.FUNCTIONS_EMULATOR === "true") {
  firebase.initializeApp({
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
  });
} else {
  firebase.initializeApp()
}


export const user = {
  processSignUp: userChanges.processSignUp,
  // deleteUserAccount: authenticatedCall((userId, data) => userChanges.deleteAccount(userId, data))
  addHasuraClaim: functions.https.onCall((_, context) => userChanges.addHasuraClaim(context.auth?.uid, null))
}

export const otp = {
  sendOTPForLogin: functions.https.onCall((data) => sendOTPForLogin(null, data)),
  getAuthUsingOTP: functions.https.onCall((data) => getAuthUsingOTP(null, data)),
}

export const stripe = {
  getPaymentIntent: authenticatedCall((userId, data) => stripePaymentFunctions.getPaymentIntent(userId, data)),
  addCard: authenticatedCall((userId, data) => stripeCardFunctions.addCard(userId, data)),
  chargeCard: authenticatedCall((userId, data) => stripeCardFunctions.chargeCard(userId, data)),
  removeCard: authenticatedCall((userId, data) => stripeCardFunctions.removeCard(userId, data)),
  setupServiceProvider: authenticatedCall((userId, data) => stripeServiceProvderFunctions.setupServiceProvider(userId, data)),
  updateServiceProvider: authenticatedCall((userId, data) => stripeServiceProvderFunctions.updateServiceProvider(userId, data)),
}

export const agora = {
  callChatUser: authenticatedCall((userId, data) => callUser(userId, data))
}
export const serviceProvider = {
  addOperator: authenticatedCall((userId, data) => addOperator(userId, data)),
  authorizeOperator: authenticatedCall((userId, data) => authorizeOperator(userId, data)),
  addDriver: authenticatedCall((userId, data) => addDriver(userId, data)),
  authorizeDriver: authenticatedCall((userId, data) => authorizeDriver(userId, data)),
}

export const restaurant2 = {
  createRestaurant: authenticatedCall((userId, data) => createNewRestaurant(userId, data)),
  checkoutCart: authenticatedCall((userId, data) => checkout(userId, data)),
  prepareOrder: authenticatedCall((userId, data) => restaurantStatusChange.prepareOrder(userId, data)),
  readyForOrderPickup: authenticatedCall((userId, data) => restaurantStatusChange.readyForPickupOrder(userId, data)),
  orderPickedUpByCustomer: authenticatedCall((userId, data) => restaurantStatusChange.orderPickedUpByCustomer(userId, data)),
  cancelOrderFromAdmin: authenticatedCall((userId, data) => restaurantStatusChange.cancelOrder(userId, data)),
  cancelOrderFromCustomer: authenticatedCall((userId, data) => cancelOrderFromCustomer(userId, data)),
  addRestaurantOperator: authenticatedCall((userId, data) => addRestaurantOperator(userId, data)),
  authorizeRestaurantOperator: authenticatedCall((userId, data) => authorizeRestaurantOperator(userId, data)),
  // refundCustomerCustomAmount: authenticatedCall((userId, data) => restaurantStatusChange.refundCustomerCustomAmount(userId, data)),
}

// export const taxi = {
//   requestRide: authenticatedCall((userId, data) => requestRide(userId, data)),
//   startScheduledRide: authenticatedCall((userId, data) => taxiStatusChange.startScheduledRide(userId, data)),
//   acceptRide: authenticatedCall((userId, data) => acceptRide(userId, data)),
//   startRide: authenticatedCall((userId, data) => taxiStatusChange.startRide(userId, data)),
//   cancelFromCustomer: authenticatedCall((userId, data) => cancelTaxiFromCustomer(userId, data)),
//   cancelFromDriver: authenticatedCall((userId, data) => taxiStatusChange.cancelTaxiFromDriver(userId, data)),
//   finishRide: authenticatedCall((userId, data) => taxiStatusChange.finishRide(userId, data)),
//   forwardToLocalCompany: authenticatedCall((userId, data) => adminStatusChanges.forwardToLocalCompany(userId, data)),
//   submitForwardResult: authenticatedCall((userId, data) => adminStatusChanges.submitForwardResult(userId, data)),
// }

export const laundry = {
  createLaundry: authenticatedCall((userId, data) => createLaundry(userId, data)),
  requestLaundry: authenticatedCall((userId, data) => requestLaundry(userId, data)),
  readyForDeliveryOrder: authenticatedCall((userId, data) => laundryStatusChange.readyForDeliveryOrder(userId, data)),
  cancelFromCustomer: authenticatedCall((userId, data) => cancelLaundryFromCustomer(userId, data)),
  cancelFromAdmin: authenticatedCall((userId, data) => laundryStatusChange.cancelOrder(userId, data)),
//   setWeight: authenticatedCall((userId, data) => laundryStatusChange.setWeight(userId, data)),
//   setEstimatedLaundryReadyTime: authenticatedCall((userId, data) => laundryStatusChange.setEstimatedLaundryReadyTime(userId, data)),
}

export const delivery2 = {
  assignDriver: authenticatedCall((userId, data) => assignDriver(userId, data)),
  addDeliveryOperator: authenticatedCall((userId, data) => addDeliveryOperator(userId, data)),
  authorizeDeliveryOperator: authenticatedCall((userId, data) => authorizeDeliveryOperator(userId, data)),
  changeStatus: authenticatedCall((userId, data) => changeDeliveryStatus(userId, data)),
  
  // restaurantStartDelivery: authenticatedCall((userId, data) => restaurantDelivery.startDelivery(userId, data)),
  // restaurantFinishDelivery: authenticatedCall((userId, data) => restaurantDelivery.finishDelivery(userId, data)),
  // laundryStartPickupFromCustomer: authenticatedCall((userId, data) => laundryDelivery.startPickupFromCustomer(userId, data)),
  // laundryPickedUpFromCustomer: authenticatedCall((userId, data) => laundryDelivery.pickedUpFromCustomer(userId, data)),
  // laundryAtFacility: authenticatedCall((userId, data) => laundryDelivery.atFacility(userId, data)),
  // laundryStartPickupFromLaundry: authenticatedCall((userId, data) => laundryDelivery.startPickupFromLaundry(userId, data)),
  // laundryPickedUpFromLaundry: authenticatedCall((userId, data) => laundryDelivery.pickedUpFromLaundry(userId, data)),
  // laundryFinishDropoff: authenticatedCall((userId, data) => laundryDelivery.finishDropoff(userId, data)),
  // setEstimatedTime: authenticatedCall((userId, data) => setEstimatedTime(userId, data)),
}

// function adminOnlyCall(func:AuthenticatedFunction) {
//   return functions.https.onCall(async (data, context) => {
//     if (!context.auth?.uid) {
//       throw new HttpsError(
//         "unauthenticated",
//         "Request was not authenticated.",
//       );
//     }
//     let hasPermission = await isUserAdmin(context.auth?.uid);
//     if (!hasPermission) {
//       throw new HttpsError(
//         "permission-denied",
//         "Only admin users can call this function",
//       );
//     }
//     return func(context.auth!.uid, data);
//   });
// }

type AuthenticatedFunction = (userId:number, data:any) => any;
function authenticatedCall(func:AuthenticatedFunction) {
  return functions.https.onCall(async (data, context) => {
    
    console.log("[+] authenticatedCall :: ", data);
    if (!context.auth?.uid) {
      throw new HttpsError(
        "unauthenticated",
        "Request was not authenticated.",
      );
    }
    let firebaseUser = await firebase.auth().getUser(context.auth!.uid)
    console.log("Custom claims",firebaseUser.customClaims)
    if(firebaseUser.customClaims!["https://hasura.io/jwt/claims"]["x-hasura-user-id"] == null) {
      await userChanges.addHasuraClaim(context.auth?.uid, null);
      firebaseUser = await firebase.auth().getUser(context.auth!.uid)
    }
   
    return await func(parseInt(firebaseUser.customClaims!["https://hasura.io/jwt/claims"]["x-hasura-user-id"]), data);
  });
}

