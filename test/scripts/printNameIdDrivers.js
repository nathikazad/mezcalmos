const firebaseAdmin = require("firebase-admin");
const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");



async function main() {
  
  let drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  let users = (await firebase.database().ref(`/users`).once('value')).val();
  let total = 0;
  for (let driverId in drivers) {
    let displayName = users[driverId].info.displayName
    if(displayName == "Alejandro Valle" 
    || displayName == "Prueba Valle "
    || displayName == "Nathik Azad"
    || displayName == "Lia valle"
    || driverId == "6l5S9qNSrMSIkwZRcchUaP8bJsk2"
    || driverId == "FtvC1uz9i9QtXu5V142Ju1HZ9Ur1"
    || driverId == "OwL4SMmebKfQRUMrflR9aVsK4jx2") {
      console.log(users[driverId].info.displayName," ",driverId)
    }
    // if(users[driverId].info.taxiNumber) {
    //   continue
    // }
    // if(drivers[driverId].notificationInfo) {
    //   continue
    // }
    // if(drivers[driverId].state.isLooking)
    //   continue
    // await firebase.database().ref(`/taxiDrivers/${driverId}/state/isLooking`).set(true)
    // console.log(users[driverId].info.displayName)//," ",driverId)
    total += 1
  }
  console.log(total)
  process.exit()
}

main()

