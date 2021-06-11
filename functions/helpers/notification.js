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
    if(driver.state && driver.state.isLooking && !driver.state.currentOrder) {
      if(driver.notificationInfo){     
          webpush.sendNotification(driver.notificationInfo, JSON.stringify({
            notificationType: "newOrder",
            message: "Hay una nueva orden de taxi, vea si puede aceptarla."
          })).catch((e) => {
            console.log("web push error ",driverId)
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
      message: "Hay una nueva orden de taxi, vea si puede aceptarla."
    })).catch((e) => {
      console.log("web push error ",uid)
    })
  }
}
