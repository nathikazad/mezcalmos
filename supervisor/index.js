
const firebaseAdmin = require("firebase-admin");
const keys = require("../functions/helpers/keys").keys()
const hasuraClass = require("../functions/helpers/hasura")
const expireOrder = require("../functions/helpers/taxi/expire");

let fbUrl, hasuraUrl;

if (process.argv[2]) {
  if (process.argv[2] == "emulate") {
    fbUrl = "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
    hasuraUrl = keys.hasuraTest
  } else if (process.argv[2] == "staging") {
    fbUrl = "https://mezcalmos-staging-default-rtdb.firebaseio.com"
    hasuraUrl = keys.hasura
  } else if (process.argv[2] == "production") {
    fbUrl = "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
    hasuraUrl = keys.hasura
  } else {
    console.log("Invalid environment variable")
    process.exit()
  }
} else {
  console.log("Required environment variable")
  process.exit()
}

const firebase = firebaseAdmin.initializeApp({
  databaseURL: fbUrl
});
const hasura = new hasuraClass.Hasura(hasuraUrl)
let openOrders = {}

let checkOpenOrdersInterval = 30 //seconds
let orderExpirationLimit = 5 * 60 // seconds



firebase.database().ref(`/openOrders/taxi`).on('value', function (snap) {
  openOrders = snap.val()
});

async function checkOpenOrders() {
  console.log(openOrders);
  for (let orderId in openOrders) {
    if (openOrders[orderId].orderTime) {
      let orderTime = new Date(openOrders[orderId].orderTime)
      let orderExpirationTime = new Date(orderTime.getTime() + orderExpirationLimit * 1000);
      if (Date.now() > orderExpirationTime) {
        expireOrder(firebase, orderId, openOrders[orderId].customer.id, hasura);
      }
    } else {
      expireOrder(firebase, orderId, openOrders[orderId].customer.id, hasura)
    }
  }
}

setInterval(checkOpenOrders, checkOpenOrdersInterval * 1000);



// const getDriversQuery = gql`
// query GetDriversQuery($lat: float8, $long: float8, $bound: Int) {
//   nearby_drivers(args: {bound: $bound, lat: $lat, long: $long}) {
//     location
//   }
// }`

// let drivers = await hasura.request(getDriversQuery, {
//   "lat": openOrders[orderId].from.lat,
//   "long": openOrders[orderId].from.lng,
//   "bound": 5
// });
// console.log(drivers)
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

// let drivers = await hasura.getDrivers({
//   "lat": openOrders[orderId].from.lat,
//   "long": openOrders[orderId].from.long,
//   "bound": 5
// })

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


// drivers = [driver1, driver2 .....] 8
// notifiedDrivers = 0
// while(notifiedDrivers < 5)
//     if(openOrders/${orderId}/notifiedDrivers/{$driverId}){
//        skip
//     }
//     sendNotification(drivers[i])
//     openOrders/${orderId}/drivers/{$driverId}/notificationSent  true TRANSACTION
//     notifiedDrivers++