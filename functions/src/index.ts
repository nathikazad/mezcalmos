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
  deliverOrder: restaurantStatusChange.deliverOrder,
  dropOrder: restaurantStatusChange.dropOrder,
  cancelOrderFromAdmin: restaurantStatusChange.cancelOrder,
  cancelOrderFromCustomer: require("./restaurant/cancelOrderFromCustomer")
}

// // Taxi
export const taxi = {
  requestTaxi: require("./taxi/request"),
  // acceptTaxiOrder: require("./helpers/taxi/accept"),
  // startTaxiRide: require("./helpers/taxi/start"),
  // cancelTaxiFromCustomer: require("./helpers/taxi/cancelTaxiFromCustomer"),
  // cancelTaxiFromDriver: require("./helpers/taxi/cancelTaxiFromDriver"),
  // finishTaxiRide: require('./helpers/taxi/finish')
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





