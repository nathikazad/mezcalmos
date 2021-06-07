const firebaseAdmin = require("firebase-admin");
const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");



async function main() {
  
  let drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  let users = (await firebase.database().ref(`/users`).once('value')).val();
  for (let driverId in drivers) {
    let driver = drivers[driverId]
    console.log(users[driverId].info.displayName," ",driverId," ", users[driverId].info.taxiNumber)
    for(let orderId in driver.orders) {
      let order = driver.orders[orderId]
      // console.log('\t '+driver.orders[orderId].acceptRideTime)
      // console.log('\t '+driver.orders[orderId].customer.name)
      // console.log('\t '+driver.orders[orderId].status)
    }
  }
  process.exit()
}

main()

