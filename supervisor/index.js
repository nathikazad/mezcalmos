const firebaseAdmin = require("firebase-admin");
// const notification = require("../functions/helpers/notification");
const taxi = require("../functions/helpers/taxi");
const productionFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");
const testFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-test.firebaseio.com",
}, "test")

let openOrdersTest = {}
let openOrdersProduction = {}

let checkOpenOrdersInterval = 60 //seconds
let orderExpirationLimit = 5 * 60 // seconds

if (process.argv[2] && process.argv[2] == "test") {
  console.log("Supervisor test mode")
  checkOpenOrdersInterval = 10 //seconds
  orderExpirationLimit = 30 // seconds
}

testFirebase.database().ref(`/openOrders/taxi`).on('value', function (snap) {
  openOrdersTest = snap.val()
});

productionFirebase.database().ref(`/openOrders/taxi`).on('value', function (snap) {
  openOrdersProduction = snap.val()
});

setInterval(function () {
  checkOpenOrders(testFirebase, openOrdersTest)
  checkOpenOrders(productionFirebase, openOrdersProduction)
}, checkOpenOrdersInterval)

function checkOpenOrders(firebase, openOrders) {
  for (let orderId in openOrders) {
    if (openOrders[orderId].orderTime) {
      let orderTime = new Date(openOrders[orderId].orderTime)
      let orderExpirationTime = new Date(orderTime.getTime() + orderExpirationLimit * 1000);
      if (Date.now() > orderExpirationTime) {
        taxi.expireOrder(firebase, orderId, openOrders[orderId].customer.id);
      }
    } else {
      taxi.expireOrder(firebase, orderId, openOrders[orderId].customer.id)
    }
  }
}
