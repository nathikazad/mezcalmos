const firebaseAdmin = require("firebase-admin");
const notification = require("../../functions/helpers/notification");
const productionFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");
const testFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-test.firebaseio.com",
}, "test")

// var fs = require('fs');
// var config = JSON.parse(fs.readFileSync('.runtimeconfig.json', 'utf8'));
// const webpush = require('web-push')
// const accountSid = config.twilio.accountid;
// const authToken = config.twilio.authtoken;
// const client = require('twilio')(accountSid, authToken);
// const sender = require("../../functions/helpers/sender");
// const functions = require('firebase-functions');
// webpush.setVapidDetails(
//     'http://www.mezcalmos.com',
//     config.vapidkeys.public,
//     config.vapidkeys.private
//   )

let firebase = productionFirebase;
// let driverId;// = "FtvC1uz9i9QtXu5V142Ju1HZ9Ur1";//8QBM8TRgh0YUAyD0xNmOcdB52kB3";

async function main() {
  if(!process.argv[2]){
    console.log("Driver Id Required")
    process.exit()
  }
  let driverId = process.argv[2]
  driver = (await firebase.database().ref(`/taxiDrivers/${driverId}`).once('value')).val();
  if(!driver){
    console.log("Driver Id Required")
    process.exit()
  }

  let message = {
    title: "Prueba",
    body: "Eso es una prueba, gracias."
  }
  const payload = {
    notification: message
  };

  await firebase.messaging().sendToDevice(driver.notificationInfo.deviceNotificationToken, payload)
  // try {
  //   await webpush.sendNotification(driver.notificationInfo, JSON.stringify({
  //     notificationType: "newOrder",
  //     message: "Hay una nueva orden de taxi, vea si puede aceptarla."
  //   }))
  // } catch(e) {
  //     console.log(e)
  //     console.log("web push error ",driverId)
  // }

  process.exit()
}

main()