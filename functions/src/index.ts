// import * as functions from "firebase-functions";

import * as firebase from "firebase-admin";

if (process.env.FUNCTIONS_EMULATOR === "true") {
  firebase.initializeApp({
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
  });
} else {
  firebase.initializeApp()
}

export const testGroup = {
  helloWorld: require('./test')
}

// functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", { structuredData: true });
//   response.send("Hello from Firebase bro!");
// });


// // Taxi
// exports.requestTaxi = require("./helpers/taxi/request");
// exports.acceptTaxiOrder = require("./helpers/taxi/accept");
// exports.startTaxiRide = require("./helpers/taxi/start");
// exports.cancelTaxiFromCustomer = require("./helpers/taxi/cancelTaxiFromCustomer")
// exports.cancelTaxiFromDriver = require("./helpers/taxi/cancelTaxiFromDriver")
// exports.finishTaxiRide = require('./helpers/taxi/finish')

import * as restaurantStatusChange from './restaurant/adminStatusChanges'
export const restaurant = {
  checkoutCart: require("./restaurant/checkoutCart"),
  prepareOrder: restaurantStatusChange.prepareOrder,
  readyForOrderPickup: restaurantStatusChange.readyForPickupOrder,
  deliverOrder: restaurantStatusChange.deliverOrder,
  dropOrder: restaurantStatusChange.dropOrder,
  //   cancelRestaurantOrderFromCustomer: require("./helpers/restaurant/cancelOrder").cancelOrderFromCustomer,
  //   cancelRestaurantOrderFromAdmin: require("./helpers/restaurant/cancelOrder").cancelOrderFromAdmin
}