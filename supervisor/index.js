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

let idleTaxiInterval = 10 * 60 //seconds
let offlineDriverTime = 3 * 60 * 60 //seconds

if(process.argv[2] && process.argv[2] == "test") {
  console.log("Supervisor test mode")
  checkOpenOrdersInterval = 10 //seconds
  orderExpirationLimit = 30 // seconds

  idleTaxiInterval = 30 //seconds
  offlineDriverTime = 120 //seconds
}

testFirebase.database().ref(`/openOrders/taxi`).on('value', function(snap) {
  openOrdersTest = snap.val()
});

productionFirebase.database().ref(`/openOrders/taxi`).on('value', function(snap) {
  openOrdersProduction = snap.val()
});

setInterval(function(){
  checkOpenOrders(testFirebase, openOrdersTest)
  checkOpenOrders(productionFirebase, openOrdersProduction)
}, checkOpenOrdersInterval)

function checkOpenOrders(firebase, openOrders){
  for(let orderId in openOrders) {
    if(openOrders[orderId].orderTime){
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

setInterval(function(){
  testFirebase.database().ref(`/taxiDrivers`).once('value', function(snap) {
    checkDriverStatus(testFirebase, snap.val())
  });
  
  productionFirebase.database().ref(`/taxiDrivers`).once('value', function(snap) {
    checkDriverStatus(productionFirebase, snap.val())
  });
  
}, idleTaxiInterval * 1000)


function checkDriverStatus(firebase, drivers){
  for(let driverId in drivers) {
    let driver = drivers[driverId]
    if(!driver.state || !driver.state.isLooking)
      continue
    if(!driver.location || !driver.location.lastUpdateTime) {
      setDriverOffline(firebase, driverId)
      continue
    }
      
    let lastUpdateTime = new Date(driver.location.lastUpdateTime)
    let staleTime = new Date(Date.now() - offlineDriverTime * 1000);
    // console.log("stale time ", staleTime.toUTCString())
    // console.log("lastUpdateTime time ", lastUpdateTime.toUTCString())
    if (lastUpdateTime < staleTime) {
      setDriverOffline(firebase, driverId)
    }
  }
}

function setDriverOffline(firebase, driverId){
  // console.log("Setting driver offline ", driverId)
  firebase.database().ref(`/taxiDrivers/${driverId}/state/isLooking`).set(false)
}