const functions = require('firebase-functions');
const sender = require("./sender")
const keys = require("./keys")
module.exports = {
  push,
  notifyDriversNewRequest,
  sendTest
}

const webpush = require('web-push')

const vapidKeys = keys.keys().vapidkeys
if (vapidKeys) {
  webpush.setVapidDetails(
    'http://www.mezcalmos.com',
    vapidKeys.public,
    vapidKeys.private
  )
}

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
      functions.logger.error(`web push error, ${particpantType} ${userId}`, e);
    })
  }
}

async function notifyDriversNewRequest(firebase, address) {
  let drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  for (let driverId in drivers){
    let driver = drivers[driverId]
    if(driver.state && driver.state.isLooking && !driver.state.currentOrder) {
      if(driver.notificationInfo) {   
        webpush.sendNotification(driver.notificationInfo, JSON.stringify({
          notificationType: "newOrder",
          message: `Hay una nueva orden de taxi de ${address}, vea si puede aceptarla.`
        })).catch((e) => {
          functions.logger.error(`notify drivers web push error, ${driverId}`, e);
        })
      }
    }
  }

  let users = (await firebase.database().ref(`/users`).once('value')).val();
  for (let driverId in drivers){
    let driver = drivers[driverId]
    let user = users[driverId]
    
    if(driver.state && driver.state.isLooking && !driver.state.currentOrder) {
      if(user.info.iphone && user.info.phoneNumber){     
        sender.sendSMS({
          message: `Hay una nueva orden de ${address}`,
          phoneNumber: user.info.phoneNumber
        }).catch(function(e){
          functions.logger.error(`send sms error ${user.info.disp}`, e)
        })
      }
    }
  }
}


async function sendTest(firebase, data) {
  if(!data.userId){
    return {
      status: "Error",
      errorMessage: "Need User Id"
    }
  }
  let uid = data.userId
  let driver = (await firebase.database().ref(`/taxiDrivers/${uid}`).once('value')).val();
  if(driver.notificationInfo){     
    webpush.sendNotification(driver.notificationInfo, JSON.stringify({
      notificationType: "newOrder",
      message: "Eso es una prueba, gracias."
    })).catch((e) => {
      functions.logger.error("test notification push error ",uid)
    })
  }
}
