const firebaseAdmin = require("firebase-admin");
const keys = require("../functions/helpers/keys").keys()
const hasuraClass = require("../functions/helpers/hasura")
const expireOrder = require("../functions/helpers/taxi/expire");


const checkOpenOrdersInterval = 30 //seconds
let orderExpirationLimit = 5 * 60 // seconds

let hasuraParams;
let firebaseParams = {};

if (process.argv.length >= 3) {
  if (process.argv[2] == "emulate") {
    firebaseParams.databaseURL = "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
    hasuraParams = keys.hasuraTest
  } else if (process.argv[2] == "staging") {
    firebaseParams.databaseURL = "https://mezcalmos-staging-default-rtdb.firebaseio.com"
    firebaseParams.credential = firebaseAdmin.credential.cert(require(keys.firebaseStagingServiceAccount))
    hasuraParams = keys.hasuraStaging
  } else if (process.argv[2] == "production") {
    firebaseParams.databaseURL = "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
    firebaseParams.credential = firebaseAdmin.credential.cert(require(keys.firebaseProductionServiceAccount))
    hasuraParams = keys.hasura
  } else {
    console.log("Invalid environment variable")
    process.exit()
  }
} else {
  console.log("Required environment variable")
  process.exit()
}

if (process.argv.length == 4) {
  console.log("Test mode")
  orderExpirationLimit = 30;
}

const firebase = firebaseAdmin.initializeApp(firebaseParams)
const hasura = new hasuraClass.Hasura(hasuraParams)
let openOrders = {}


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