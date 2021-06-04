const firebaseAdmin = require("firebase-admin");
const serviceAccount = require("./service_account.json");
const notification = require("../functions/helpers/notification");
const productionFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
  credential: firebaseAdmin.credential.cert(serviceAccount)
}, "production");
const testFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-test.firebaseio.com",
  credential: firebaseAdmin.credential.cert(serviceAccount)
}, "test")

var fs = require('fs');
var config = JSON.parse(fs.readFileSync('.runtimeconfig.json', 'utf8'));

let openOrdersTest = {}
let openOrdersProduction = {}

testFirebase.database().ref(`/openOrders/taxi`).on('value', function(snap) {
  openOrdersTest = snap.val()
});

productionFirebase.database().ref(`/openOrders/taxi`).on('value', function(snap) {
  openOrdersProduction = snap.val()
});

setInterval(function(){
  checkOpenOrders(testFirebase, openOrdersTest)
  checkOpenOrders(productionFirebase, openOrdersProduction)
}, 10000)

function removeOrder(firebase, orderId, customerId) {
  console.log(`Removing order ${orderId} of ${customerId}`)
  firebase.database().ref(`/users/${customerId}/state/currentOrder`).remove()
  firebase.database().ref(`/users/${customerId}/orders/${orderId}`).remove();
  firebase.database().ref(`/openOrders/taxi/${orderId}`).remove();
  firebase.database().ref(`/chat/${orderId}`).remove();
  firebase.database().ref(`/orders/taxi/${orderId}/status`).set("expired")
  setTimeout(function(){
      firebase.database().ref(`/orders/taxi/${orderId}`).remove()
  }, 1000);
  notification.push(firebase, customerId, {
    status: "expired",
    notificationType: "orderStatusChange",
    orderId: orderId,
    orderType: "taxi",
    rideFinishTime: (new Date()).toUTCString()
  }, config.vapidkeys)
}

function checkOpenOrders(firebase, openOrders){
  for(let orderId in openOrders) {
    if(openOrders[orderId].orderTime){
      let orderTime = new Date(openOrders[orderId].orderTime)
      let orderExpirationTime = new Date(orderTime.getTime() + 300 * 1000);
      if (Date.now() > orderExpirationTime) {
        removeOrder(firebase, orderId, openOrders[orderId].customer.id);
      }
    } else {
      removeOrder(firebase, orderId, openOrders[orderId].customer.id)
    }
  }
}