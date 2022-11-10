import * as functions from "firebase-functions";

import * as firebase from "firebase-admin";

if (process.env.FUNCTIONS_EMULATOR === "true") {
  firebase.initializeApp({
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
  });
} else {
  firebase.initializeApp()
}

import * as userChanges from './utilities/userChanges'
export const user = {
  processSignUp: userChanges.processSignUp,
  changeName: userChanges.onNameUpdate,
  changePhoto: userChanges.onPhotoUpdate,
  deleteUserAccount : userChanges.deleteAccount
}

export const otp = {
  sendOTPForLogin: functions.https.onCall((data) => sendOTPForLogin(data)),
  getAuthUsingOTP: functions.https.onCall((data) => getAuthUsingOTP(data)),
}

import * as stripePaymentFunctions from './utilities/stripe/payment'
import * as stripeServiceProvderFunctions from './utilities/stripe/serviceProvider'
import * as stripeCardFunctions from './utilities/stripe/card'
export const stripe = {
  getPaymentIntent: stripePaymentFunctions.getPaymentIntent,
  addCard: stripeCardFunctions.addCard,
  chargeCard: stripeCardFunctions.chargeCard,
  removeCard: stripeCardFunctions.removeCard,
  setupServiceProvider: stripeServiceProvderFunctions.setupServiceProvider,
  updateServiceProvider: stripeServiceProvderFunctions.updateServiceProvider
}

import * as restaurantStatusChange from './restaurant/adminStatusChanges'
export const restaurant = {
  createRestaurant: require("./restaurant/createNewRestaurant"),
  // checkoutCart: require("./restaurant/checkoutCart"),
  checkoutCart: authenticatedCall((userId, data) => checkout(userId, data)),
  addReview: require("./restaurant/addReview"),
  prepareOrder: authenticatedCall((userId, data) => restaurantStatusChange.prepareOrder(userId, data)),
  readyForOrderPickup: authenticatedCall((userId, data) => restaurantStatusChange.readyForPickupOrder(userId, data)),
  cancelOrderFromAdmin: authenticatedCall((userId, data) => restaurantStatusChange.cancelOrder(userId, data)),
  cancelOrderFromCustomer: require("./restaurant/cancelOrderFromCustomer"),
  setEstimatedFoodReadyTime: authenticatedCall((userId, data) => restaurantStatusChange.setEstimatedFoodReadyTime(userId, data)),
  markOrderItemUnavailable: authenticatedCall((userId, data) => restaurantStatusChange.markOrderItemUnavailable(userId, data)),
  refundCustomerCustomAmount: authenticatedCall((userId, data) => restaurantStatusChange.refundCustomerCustomAmount(userId, data)),
}

// Taxi
export const taxi = {
  requestRide: require("./taxi/request"),
  startScheduledRide: require("./taxi/taxiStatusChange").startScheduledRide,
  acceptRide: require("./taxi/accept"),
  startRide: require("./taxi/taxiStatusChange").startRide,
  cancelFromCustomer: require("./taxi/cancelTaxiFromCustomer"),
  cancelFromDriver: require("./taxi/taxiStatusChange").cancelTaxiFromDriver,
  finishRide: require("./taxi/taxiStatusChange").finishRide,
  forwardToLocalCompany: require("./taxi/adminStatusChanges").forwardToLocalCompany,
  submitForwardResult: require("./taxi/adminStatusChanges").submitForwardResult,
}

import * as laundryStatusChange from './laundry/adminStatusChanges'
export const laundry = {
  createLaundry: require("./laundry/createNewLaundry"),
  requestLaundry: require("./laundry/laundryRequest"),
  readyForDeliveryOrder: laundryStatusChange.readyForDeliveryOrder,
  cancelFromCustomer: require("./laundry/cancelLaundryFromCustomer"),
  cancelFromAdmin: laundryStatusChange.cancelOrder,
  setWeight: laundryStatusChange.setWeight,
  setEstimatedLaundryReadyTime: laundryStatusChange.setEstimatedLaundryReadyTime
}

import * as laundryDelivery from './delivery/laundryStatusChange'
import * as restaurantDelivery from './delivery/restaurantStatusChange'
import { checkout } from "./restaurant/checkoutCart";
import { HttpsError } from "firebase-functions/v1/auth";
import { getAuthUsingOTP, sendOTPForLogin } from "./utilities/otpAuth";

export const delivery = {
  assignDriver: require("./delivery/assignDriver"),
  restaurantStartDelivery: restaurantDelivery.startDelivery,
  restaurantFinishDelivery: restaurantDelivery.finishDelivery,
  laundryStartPickupFromCustomer: laundryDelivery.startPickupFromCustomer,
  laundryPickedUpFromCustomer: laundryDelivery.pickedUpFromCustomer,
  laundryAtFacility: laundryDelivery.atFacility,
  laundryStartPickupFromLaundry: laundryDelivery.startPickupFromLaundry,
  laundryPickedUpFromLaundry: laundryDelivery.pickedUpFromLaundry,
  laundryFinishDropoff: laundryDelivery.finishDropoff,
  setEstimatedTime: require("./delivery/setEstimatedTime")
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

type AuthenticatedFunction = (userId:string, data:any) => any;
function authenticatedCall(func:AuthenticatedFunction) {
  return functions.https.onCall((data, context) => {
    if (!context.auth?.uid) {
      throw new HttpsError(
        "unauthenticated",
        "Request was not authenticated.",
      );
    }
    return func(context.auth!.uid, data);
  });
}