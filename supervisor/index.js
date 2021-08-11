
const firebaseAdmin = require("firebase-admin");
const keys = require("../functions/helpers/keys").keys()
const hasura = require("../functions/helpers/hasura")
const expireOrder = require("../functions/helpers/taxi/expire");

const firebase = firebaseAdmin.initializeApp();

let openOrdersTest = {}

let checkOpenOrdersInterval = 30 //seconds
let orderExpirationLimit = 5 * 60 // seconds

if (process.argv[2] && process.argv[2] == "test") {
  console.log("Supervisor test mode")
  checkOpenOrdersInterval = 10 //seconds
  orderExpirationLimit = 30 // seconds
}

firebase.database().ref(`/openOrders/taxi`).on('value', function (snap) {
  openOrders = snap.val()
});

let hasura;
if (process.env.FIREBASE_DATABASE_EMULATOR_HOST != null) {
  hasura = new hasura.Hasura(keys.hasuraTest)
} else {
  hasura = new hasura.Hasura(keys.hasura)
}




async function checkOpenOrders(firebase, openOrders, hasura) {
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