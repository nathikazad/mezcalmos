const { gql, GraphQLClient } = require('graphql-request')
const firebaseAdmin = require("firebase-admin");
const keys = require("../functions/helpers/keys").keys();
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

if (process.env.FIREBASE_DATABASE_EMULATOR_HOST != null) {
  const hasuraEmulator = new GraphQLClient(
    keys.hasuraTest.url,
    {
      headers: {
        'x-hasura-admin-secret': keys.hasuraTest.key
      }
    });
  setInterval(function () {
    checkOpenOrders(productionFirebase, openOrdersProduction, hasuraEmulator)
  }, checkOpenOrdersInterval * 1000)
} else {
  const hasuraTest = new GraphQLClient(
    keys.hasuraStage.url,
    {
      headers: {
        'x-hasura-admin-secret': keys.hasuraStage.key
      }
    });
  const hasuraProduction = new GraphQLClient(
    keys.hasura.url,
    {
      headers: {
        'x-hasura-admin-secret': keys.hasura.key
      }
    });
  setInterval(function () {
    checkOpenOrders(testFirebase, openOrdersTest, hasuraTest)
    checkOpenOrders(productionFirebase, openOrdersProduction, hasuraProduction)
  }, checkOpenOrdersInterval * 1000)
}

const getDriversQuery = gql` 
query GetDriversQuery($lat: float8, $long: float8, $bound: Int) {
  nearby_drivers(args: {bound: $bound, lat: $lat, long: $long}) {
    location
  }
}`

async function checkOpenOrders(firebase, openOrders, hasura) {
  console.log(openOrders);

  for (let orderId in openOrders) {
    if (openOrders[orderId].orderTime) {
      let orderTime = new Date(openOrders[orderId].orderTime)
      let orderExpirationTime = new Date(orderTime.getTime() + orderExpirationLimit * 1000);
      if (Date.now() > orderExpirationTime) {
        expireOrder(firebase, orderId, openOrders[orderId].customer.id);
      }
      let drivers = await hasura.request(getDriversQuery, {
        "lat": openOrders[orderId].from.lat,
        "long": openOrders[orderId].from.lng,
        "bound": 5
      });
      console.log(drivers)
      // drivers = [driver1, driver2 .....] 8
      // notifiedDrivers = 0
      // while(notifiedDrivers < 5)
      //     if(openOrders/${orderId}/notifiedDrivers/{$driverId}){
      //        skip
      //     }
      //     sendNotification(drivers[i])
      //     openOrders/${orderId}/drivers/{$driverId}/notificationSent  true TRANSACTION
      //     notifiedDrivers++
    } else {
      expireOrder(firebase, orderId, openOrders[orderId].customer.id)
    }
  }
}