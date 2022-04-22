// import * as functions from "firebase-functions";

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
  addName: userChanges.addName,
  changeName: userChanges.changeName,
  addPhoto: userChanges.addPhoto,
  changePhoto: userChanges.changePhoto
}

import * as otpAuth from './utilities/otpAuth'
export const otp = {
  sendOTPForLogin: otpAuth.sendOTPForLogin,
  getAuthUsingOTP: otpAuth.getAuthUsingOTP
}

import * as restaurantStatusChange from './restaurant/adminStatusChanges'
export const restaurant = {
  checkoutCart: require("./restaurant/checkoutCart"),
  prepareOrder: restaurantStatusChange.prepareOrder,
  readyForOrderPickup: restaurantStatusChange.readyForPickupOrder,
  cancelOrderFromAdmin: restaurantStatusChange.cancelOrder,
  cancelOrderFromCustomer: require("./restaurant/cancelOrderFromCustomer")
}

// Taxi
export const taxi = {
  requestRide: require("./taxi/request"),
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
  requestLaundryTwo: require("./laundry/laundryRequest"),
  readyForDeliveryOrder: laundryStatusChange.readyForDeliveryOrder,
  cancelFromCustomer: require("./laundry/cancelLaundryFromCustomer"),
  cancelFromAdmin: laundryStatusChange.cancelOrder,
  setWeight: laundryStatusChange.setWeight
}

import * as laundryDelivery from './delivery/laundryStatusChange'
import * as restaurantDelivery from './delivery/restaurantStatusChange'
export const delivery = {
  assignDriver: require("./delivery/assignDriver"),
  restaurantStartDelivery: restaurantDelivery.startDelivery,
  restaurantFinishDelivery: restaurantDelivery.finishDelivery,
  laundryStartPickup: laundryDelivery.startPickup,
  laundryFinishPickup: laundryDelivery.finishPickup,
  laundryAtFacility: laundryDelivery.atFacility,
  laundryStartDropoff: laundryDelivery.startDropoff,
  laundryFinishDropoff: laundryDelivery.finishDropoff
}

// exports.submitAuthorizationRequest = functions.https.onCall(async (data, context) => {
//   data.userId = context.auth.uid
//   let response = await admin.submitAuthorizationRequest(firebase, data, hasura)
//   return response
// });

// exports.approveAuthorizationRequest = functions.https.onCall(async (data, context) => {
//   data.adminId = context.auth.uid
//   let response = await admin.approveAuthorizationRequest(firebase, data, hasura)
//   return response
// });





