const firebaseAdmin = require("firebase-admin");
const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");



async function main() {
  
  let drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  let users = (await firebase.database().ref(`/users`).once('value')).val();
  for (let driverId in drivers) {
    console.log(users[driverId].info.displayName," ", users[driverId].info.taxiNumber)
  }
  process.exit()
}

main()

