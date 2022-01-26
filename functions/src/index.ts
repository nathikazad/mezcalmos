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

// Taxi
export const taxi = {
  requestRide: require("./taxi/request"),
  acceptRide: require("./taxi/accept"),
  startRide: require("./taxi/taxiStatusChange").startRide,
  cancelFromCustomer: require("./taxi/cancelTaxiFromCustomer"),
  cancelFromDriver: require("./taxi/taxiStatusChange").cancelTaxiFromDriver,
  finishRide: require("./taxi/taxiStatusChange").finishRide,
}

import * as laundryStatusChange from './laundry/adminStatusChanges'
export const laundry = {
  requestLaundry: require("./laundry/laundryRequest"),
  otwPickupOrder: laundryStatusChange.otwPickupOrder,
  pickedUpOrder: laundryStatusChange.pickedUpOrder,
  atLaundryOrder: laundryStatusChange.atLaundryOrder,
  readyForDeliveryOrder: laundryStatusChange.readyForDeliveryOrder,
  otwDeliveryOrder: laundryStatusChange.otwDeliveryOrder,
  cancelFromCustomer: require("./laundry/cancelLaundryFromCustomer"),
  cancelFromAdmin: laundryStatusChange.cancelOrder,
  deliveredOrder: laundryStatusChange.deliveredOrder,
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





