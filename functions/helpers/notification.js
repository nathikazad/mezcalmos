const functions = require('firebase-functions');
const sender = require("./sender")
const keys = require("./keys").keys()

module.exports = {
  push,
  notifyDriversNewRequest,
  sendTest,
  cancelNotificationsForOrderId
}

const notificationMessages = require('./notificationMessages.json')

async function push(firebase, userId, message, particpantType = "customer") {
  firebase.database().ref(`/notifications/${particpantType}/${userId}`).push(message)
  let subscription
  if (particpantType == "customer") {
    subscription = (await firebase.database().ref(`/customers/info/${userId}/notificationInfo`).once('value')).val();
  } else if (particpantType == "taxi") {
    subscription = (await firebase.database().ref(`/taxiDrivers/${userId}/notificationInfo`).once('value')).val();
  } else if (particpantType == "deliveryAdmin") {
    subscription = (await firebase.database().ref(`/deliveryAdmins/info/${userId}/notificationInfo`).once('value')).val();
  }
  if (subscription && subscription.deviceNotificationToken) {
    if (message.notificationType == "orderStatusChange") {
      let notificationMessage = await buildDeviceNotificationMessage(firebase, userId, message)
      sender.sendToDevice(subscription.deviceNotificationToken, notificationMessage, firebase)
    } else if (message.notificationType == "newMessage") {
      let notificationMessage = await buildDeviceNotificationMessage(firebase, userId, message)
      console.log(notificationMessage)
      let newMessage = {
        title: `${notificationMessage.title}${message.sender.name}`,
        body: message.message
      }
      console.log(newMessage)
      sender.sendToDevice(subscription.deviceNotificationToken, newMessage, firebase)
    }
  }
}

async function buildDeviceNotificationMessage(firebase, userId, message) {
  let userLang = (await firebase.database().ref(`/users/${userId}/info/language`).once('value')).val();
  if (!userLang)
    userLang = "es";
  if (message.notificationType == "orderStatusChange") {
    return notificationMessages[message.notificationType][message.status][userLang]
  } else {
    return notificationMessages[message.notificationType][userLang]
  }
}

async function notifyDriversNewRequest(firebase) {
  let drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  for (let driverId in drivers) {
    let driver = drivers[driverId]
    if (driver.state && driver.state.isLooking && !driver.state.currentOrder) {
      if (driver.notificationInfo) {
        if (driver.notificationInfo.deviceNotificationToken) {
          let payload = {
            notification: {
              title: "Nueva Pedido",
              body: `Hay una nueva orden de taxi, vea si puede aceptarla.`,
              tag: "newOrder"
            }
          };
          let options = {
            collapse_key: "newOrder",
            priority: "high"
          }
          await firebase.messaging().sendToDevice(driver.notificationInfo.deviceNotificationToken, payload, options)
        } else {
          let message = {
            notificationType: "newOrder",
            message: `Hay una nueva orden de taxi, vea si puede aceptarla.`
          }
          sender.sendToBrowser(driver.notificationInfo, message);
        }
      }
    }
  }
}


async function sendTest(firebase, data) {
  if (!data.userId) {
    return {
      status: "Error",
      errorMessage: "Need User Id"
    }
  }
  let uid = data.userId
  let driver = (await firebase.database().ref(`/taxiDrivers/${uid}`).once('value')).val();
  if (driver.notificationInfo) {
    if (driver.notificationInfo.deviceNotificationToken) {
      let message = {
        title: "Prueba",
        body: "Eso es una prueba, gracias."
      }
      sender.sendToDevice(driver.notificationInfo.deviceNotificationToken, message, firebase);
    } else {
      let message = {
        notificationType: "Prueba",
        message: "Eso es una prueba, gracias."
      }
      sender.sendToBrowser(driver.notificationInfo, message);
    }

  }
}

async function cancelNotificationsForOrderId(firebase, orderId, fcm) {
  // if (!fcm) {
  //   fcm = new sender.FCM(keys.fcm.key)
  // }
  // let driversToNotify = (await firebase.database().ref(`/notificationStatus/taxi/${orderId}`).once('value')).val()
  // let drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();

  // let notificationList = []
  // for (let driverId in driversToNotify) {
  //   if (drivers[driverId] && drivers[driverId].notificationInfo && drivers[driverId].notificationInfo.deviceNotificationToken) {
  //     notificationList.push(drivers[driverId].notificationInfo.deviceNotificationToken)
  //   }
  // }
  // let data = {
  //   orderId: orderId,
  //   notificationType: "newOrderExpired",
  // };



  // fcm.push({
  //   registration_ids: notificationList,
  //   notification: {
  //     title: "Nueva Pedido",
  //     body: `El viaje ya se ha realizado, te avisaremos cuando llegue el próximo.`,
  //     tag: "newOrder"
  //   },
  //   collapse_key: "newOrder",
  //   priority: "high"
  // });
}
