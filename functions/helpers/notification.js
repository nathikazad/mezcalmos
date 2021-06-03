const functions = require('firebase-functions');
const sender = require("./sender")
module.exports = {
  push,
  notifyDriversNewRequest
}

const webpush = require('web-push')
const vapidKeys = functions.config().vapidkeys
webpush.setVapidDetails(
  'http://www.mezcalmos.com',
  vapidKeys.public,
  vapidKeys.private
)

async function push(firebase, userId, message, particpantType = "customer") {
  firebase.database().ref(`/notifications/${particpantType}/${userId}`).push(message)
  let subscription
  if(particpantType == "customer") {
    subscription = (await firebase.database().ref(`/users/${userId}/notificationInfo`).once('value')).val();
  } else if(particpantType == "taxi") {
    subscription = (await firebase.database().ref(`/taxiDrivers/${userId}/notificationInfo`).once('value')).val();
  }
  if(subscription){
    webpush.sendNotification(subscription, JSON.stringify(message))
    .catch((e) => {
      console.log("web push error ", particpantType, userId)
    })
  }
}

async function notifyDriversNewRequest(firebase) {
  drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  for (let driverId in drivers){
    let driver = drivers[driverId]
    if(driver.state&& driver.state.isLooking && !driver.state.currentOrder) {
      if(driver.notificationInfo){
        
          webpush.sendNotification(driver.notificationInfo, JSON.stringify({
            notificationType: "newOrder",
            message: "Hay una nueva orden de taxi, vea si puede aceptarla."
          })).catch((e) => {
            console.log("web push error ",driverId)
        })
      }
      if(!driver.location || !driver.location.lastUpdateTime) {
        return
      }
      
      let lastUpdateTime = new Date(driver.location.lastUpdateTime)
      let staleTime = new Date(Date.now() - 2 * 60 * 60 * 1000);
      if (lastUpdateTime > staleTime) {
        firebase.database().ref(`/users/${driverId}/info`).once('value', function(snapshot){
          let userInfo = snapshot.val()
          if(userInfo.phoneNumber && userInfo.phoneNumberType){
  
            let payload = {
              message: `There is a new ride request, see if you can accept it at wwww.meztaxi.com. To disable notifications turn off taxi mode.`,
              phoneNumber: userInfo.phoneNumber
            }
            if (userInfo.language == "es") {
              payload.message = `Hay una nueva orden de taxi, vea si puede aceptarla en wwwmeztaxi.com. Para parar las notificaciones, desactive el modo taxi`
            }
            if (userInfo.phoneNumberType == "whatsApp") {
              sender.sendWhatsApp(payload)
            } else if (userInfo.phoneNumberType == "SMS") {
              sender.sendSMS(payload)
            }
          }
        })
      }

      
      
    }
  }
}