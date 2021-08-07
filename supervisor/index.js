const firebaseAdmin = require("firebase-admin");
const keys = require("../functions/helpers/keys").keys()
const hasura = require("../functions/helpers/hasura")
const { gql, GraphQLClient } = require('graphql-request')
// const notification = require("../functions/helpers/notification");
const expireOrder = require("../functions/helpers/taxi/expire");

const productionFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");
const testFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-test.firebaseio.com",
}, "test")

let openOrdersTest = {}
let openOrdersProduction = {}

let checkOpenOrdersInterval = 5 //seconds
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

if(process.env.FIREBASE_DATABASE_EMULATOR_HOST != null){
  const hasuraEmulator = new hasura.Hasura(keys.hasuraTest)
  setInterval(() => {
    checkOpenOrders(productionFirebase, openOrdersProduction, hasuraEmulator)
  }, checkOpenOrdersInterval * 1000);
} else {
  const hasuraTest = new hasura.Hasura(keys.hasuraStage)
  const hasuraProduction = new hasura.Hasura(keys.hasura)
  setInterval(() => {
    checkOpenOrders(testFirebase, openOrdersTest, hasuraTest)
    checkOpenOrders(productionFirebase, openOrdersProduction, hasuraProduction)
  }, checkOpenOrdersInterval * 1000);
}

// const getDriversQuery = gql`
// query GetDriversQuery($lat: float8, $long: float8, $bound: Int){
//   nearby_drivers(args: {lat: $lat, long: $long, bound: $bound}){
//     location
//   }
// }`

// setInterval(function () {
//   checkOpenOrders(testFirebase, openOrdersTest)
//   checkOpenOrders(productionFirebase, openOrdersProduction)
// }, checkOpenOrdersInterval * 1000)

function checkOpenOrders(firebase, openOrders, hasura) {
  for (let orderId in openOrders) {
    if (openOrders[orderId].orderTime) {
      let orderTime = new Date(openOrders[orderId].orderTime)
      let orderExpirationTime = new Date(orderTime.getTime() + orderExpirationLimit * 1000);
  	console.log("ordertime ", orderTime.toUTCString())
  	console.log("currentime", (new Date()).toUTCString())
  	console.log("expirationtime", orderExpirationTime.toUTCString())
  	console.log(openOrders)
      if (Date.now() > orderExpirationTime) {
        expireOrder(firebase, orderId, openOrders[orderId].customer.id);
      }
    } else {
      expireOrder(firebase, orderId, openOrders[orderId].customer.id)
    }
    let drivers = await hasura.getDrivers({
      "lat": openOrders[orderId].from.lat,
      "long": openOrders[orderId].from.long,
      "bound": 5
    })
    
    // let counter = 0
    // function sendDriversNotifications(drivers, counter){
    //    do{
         //notify drivers[0]
         // set driversNotified to true inside (openOrders/${orderId}/notifiedDrivers/${drivers[0]}/)
         // drivers = drivers.splice(0,1)
         // counter++
    //    } while(counter < 5)

    //    setInterval(() => {
    //      if(drivers.length() > 0){
    //        counter
    //        sendDriversNotifications(drivers, counter)
    //      } else{

    //      }
    //    }, 5000);
    // }

    
    
  }
}
