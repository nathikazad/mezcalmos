const firebaseAdmin = require("firebase-admin");
const notification = require("../../functions/helpers/notification");
const productionFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");
const testFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-test.firebaseio.com",
}, "test")

var fs = require('fs');
var config = JSON.parse(fs.readFileSync('.runtimeconfig.json', 'utf8'));
const webpush = require('web-push')
const accountSid = config.twilio.accountid;
const authToken = config.twilio.authtoken;
const client = require('twilio')(accountSid, authToken);
const sender = require("../../functions/helpers/sender");
const functions = require('firebase-functions');
console.log(functions.config())
webpush.setVapidDetails(
    'http://www.mezcalmos.com',
    config.vapidkeys.public,
    config.vapidkeys.private
  )

let firebase = productionFirebase;
let driverId;// = "FtvC1uz9i9QtXu5V142Ju1HZ9Ur1";//8QBM8TRgh0YUAyD0xNmOcdB52kB3";

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
  webpush.sendNotification(driver.notificationInfo, JSON.stringify({
      notificationType: "newOrder",
      message: "Hay una nueva orden de taxi, vea si puede aceptarla."
    })).catch((e) => {
      console.log(e)
      console.log("web push error ",driverId)
  })

  let snapshot = await firebase.database().ref(`/users/${driverId}/info`).once('value')
  let userInfo = snapshot.val()
  if(userInfo.phoneNumber && userInfo.phoneNumberType){
    let payload = {
      message: `Hay una nueva orden de taxi, vea si puede aceptarla en wwwmeztaxi.com. Para parar las notificaciones, desactive el modo taxi`,
      phoneNumber: userInfo.phoneNumber
    }

    try {
      await client.messages
        .create({body: payload.message, from: '+16304488781', to: payload.phoneNumber})
    } catch (error) {
      console.log(error)
      return {
        status: "Error",
        errorMessage: `Message Send Error`
      }
    }
  }
  process.exit()
}

main()