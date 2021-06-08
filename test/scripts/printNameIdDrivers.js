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
      continue
    }
    // if(users[driverId].info.taxiNumber) {
    //   continue
    // }
    // if(drivers[driverId].notificationInfo)
    //   continue
    console.log(users[driverId].info.displayName)
    total += 1
  }
  console.log(total)
  process.exit()
}

main()

