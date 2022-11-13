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
  deleteUserAccount: authenticatedCall((userId, data) => userChanges.deleteAccount(userId, data))
}

export const otp = {
  sendOTPForLogin: functions.https.onCall((data) => sendOTPForLogin(data)),
  getAuthUsingOTP: functions.https.onCall((data) => getAuthUsingOTP(data)),
}

import * as stripePaymentFunctions from './utilities/stripe/payment'
import * as stripeServiceProvderFunctions from './utilities/stripe/serviceProvider'
import * as stripeCardFunctions from './utilities/stripe/card'

export const stripe = {
  getPaymentIntent: authenticatedCall((userId, data) => stripePaymentFunctions.getPaymentIntent(userId, data)),
  addCard: authenticatedCall((userId, data) => stripeCardFunctions.addCard(userId, data)),
  chargeCard: authenticatedCall((userId, data) => stripeCardFunctions.chargeCard(userId, data)),
  removeCard: authenticatedCall((userId, data) => stripeCardFunctions.removeCard(userId, data)),
  setupServiceProvider: authenticatedCall((userId, data) => stripeServiceProvderFunctions.setupServiceProvider(userId, data)),
  updateServiceProvider: authenticatedCall((userId, data) => stripeServiceProvderFunctions.updateServiceProvider(userId, data)),
}

import * as restaurantStatusChange from './restaurant/adminStatusChanges'
import { createRestaurant } from "./restaurant/createNewRestaurant";
import { checkout } from "./restaurant/checkoutCart";
import { addReview } from "./restaurant/addReview";
import { cancelOrderFromCustomer } from "./restaurant/cancelOrderFromCustomer";
export const restaurant = {
  createRestaurant: authenticatedCall((userId, data) => createRestaurant(userId, data)),
  checkoutCart: authenticatedCall((userId, data) => checkout(userId, data)),
  addReview: authenticatedCall((userId, data) => addReview(userId, data)),
  prepareOrder: authenticatedCall((userId, data) => restaurantStatusChange.prepareOrder(userId, data)),
  readyForOrderPickup: authenticatedCall((userId, data) => restaurantStatusChange.readyForPickupOrder(userId, data)),
  cancelOrderFromAdmin: authenticatedCall((userId, data) => restaurantStatusChange.cancelOrder(userId, data)),
  cancelOrderFromCustomer: authenticatedCall((userId, data) => cancelOrderFromCustomer(userId, data)),
  setEstimatedFoodReadyTime: authenticatedCall((userId, data) => restaurantStatusChange.setEstimatedFoodReadyTime(userId, data)),
  markOrderItemUnavailable: authenticatedCall((userId, data) => restaurantStatusChange.markOrderItemUnavailable(userId, data)),
  refundCustomerCustomAmount: authenticatedCall((userId, data) => restaurantStatusChange.refundCustomerCustomAmount(userId, data)),
}

// Taxi
import { requestRide } from "./taxi/request";
import * as taxiStatusChange from './taxi/taxiStatusChange'
import { acceptRide } from "./taxi/accept";
import { cancelTaxiFromCustomer } from "./taxi/cancelTaxiFromCustomer";
import * as adminStatusChanges from './taxi/adminStatusChanges'

export const taxi = {
  requestRide: authenticatedCall((userId, data) => requestRide(userId, data)),
  startScheduledRide: authenticatedCall((userId, data) => taxiStatusChange.startScheduledRide(userId, data)),
  acceptRide: authenticatedCall((userId, data) => acceptRide(userId, data)),
  startRide: authenticatedCall((userId, data) => taxiStatusChange.startRide(userId, data)),
  cancelFromCustomer: authenticatedCall((userId, data) => cancelTaxiFromCustomer(userId, data)),
  cancelFromDriver: authenticatedCall((userId, data) => taxiStatusChange.cancelTaxiFromDriver(userId, data)),
  finishRide: authenticatedCall((userId, data) => taxiStatusChange.finishRide(userId, data)),
  forwardToLocalCompany: authenticatedCall((userId, data) => adminStatusChanges.forwardToLocalCompany(userId, data)),
  submitForwardResult: authenticatedCall((userId, data) => adminStatusChanges.submitForwardResult(userId, data)),
}

import * as laundryStatusChange from './laundry/adminStatusChanges'
import { createLaundry } from "./laundry/createNewLaundry";
import { requestLaundry } from "./laundry/laundryRequest";
import { cancelFromCustomer } from "./laundry/cancelLaundryFromCustomer";

export const laundry = {
  createLaundry: authenticatedCall((userId, data) => createLaundry(userId, data)),
  requestLaundry: authenticatedCall((userId, data) => requestLaundry(userId, data)),
  readyForDeliveryOrder: authenticatedCall((userId, data) => laundryStatusChange.readyForDeliveryOrder(userId, data)),
  cancelFromCustomer: authenticatedCall((userId, data) => cancelFromCustomer(userId, data)),
  cancelFromAdmin: authenticatedCall((userId, data) => laundryStatusChange.cancelOrder(userId, data)),
  setWeight: authenticatedCall((userId, data) => laundryStatusChange.setWeight(userId, data)),
  setEstimatedLaundryReadyTime: authenticatedCall((userId, data) => laundryStatusChange.setEstimatedLaundryReadyTime(userId, data)),
}

import * as laundryDelivery from './delivery/laundryStatusChange'
import * as restaurantDelivery from './delivery/restaurantStatusChange'
import { HttpsError } from "firebase-functions/v1/auth";
import { getAuthUsingOTP, sendOTPForLogin } from "./utilities/otpAuth";
import { assignDriver } from "./delivery/assignDriver";
import { setEstimatedTime } from "./delivery/setEstimatedTime";

export const delivery = {
  assignDriver: authenticatedCall((userId, data) => assignDriver(userId, data)),
  restaurantStartDelivery: authenticatedCall((userId, data) => restaurantDelivery.startDelivery(userId, data)),
  restaurantFinishDelivery: authenticatedCall((userId, data) => restaurantDelivery.finishDelivery(userId, data)),
  laundryStartPickupFromCustomer: authenticatedCall((userId, data) => laundryDelivery.startPickupFromCustomer(userId, data)),
  laundryPickedUpFromCustomer: authenticatedCall((userId, data) => laundryDelivery.pickedUpFromCustomer(userId, data)),
  laundryAtFacility: authenticatedCall((userId, data) => laundryDelivery.atFacility(userId, data)),
  laundryStartPickupFromLaundry: authenticatedCall((userId, data) => laundryDelivery.startPickupFromLaundry(userId, data)),
  laundryPickedUpFromLaundry: authenticatedCall((userId, data) => laundryDelivery.pickedUpFromLaundry(userId, data)),
  laundryFinishDropoff: authenticatedCall((userId, data) => laundryDelivery.finishDropoff(userId, data)),
  setEstimatedTime: authenticatedCall((userId, data) => setEstimatedTime(userId, data)),
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