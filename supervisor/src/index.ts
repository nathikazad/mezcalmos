import * as firebaseAdmin from "firebase-admin";
import { getKeys } from "../../functions/src/shared/keys";
import * as taxiNodes from "../../functions/src/shared/databaseNodes/taxi";
import * as customerNodes from "../../functions/src/shared/databaseNodes/customer";
import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { OrderType } from "../../functions/src/shared/models/Order";
import { Chat, Message } from "../../functions/src/shared/models/Chat";
import { Taxi } from "../../functions/src/shared/models/taxi/Taxi";
import { TaxiOrder } from "../../functions/src/shared/models/taxi/TaxiOrder";
import { expireOrder } from "../../functions/src/taxi/expire";
import { NotificationPriority, push } from "../../functions/src/utilities/senders/fcm";
import * as notifyUser from "../../functions/src/shared/notification/notifyUser";
import { NewMessageNotification, Notification, NotificationAction, NotificationType } from "../../functions/src/shared/models/Notification";

let keys = getKeys();
// const keys = requireHelper("keys").keys()
// const hasuraClass = requireHelper("hasura")
// const expireOrder = requireHelper("taxi/expire");
// const sender = requireHelper("sender")

const checkOpenOrdersInterval: number = 10 //seconds
let orderExpirationLimit: number = 300 // seconds

if (process.argv.length != 3) {
  console.log("Required environment variable")
  process.exit()
}

const env = process.argv[2]

if (env != "emulate" && env != "staging" && env != "production") {
  console.log("Invalid environment has to be emulate, staging or production")
  process.exit()
}
let firebaseParams: any = { databaseURL: keys.databaseURL };
if (keys.serviceAccount)
  firebaseParams.credential = firebaseAdmin.credential.cert(require(keys.serviceAccount))
const firebase = firebaseAdmin.initializeApp(firebaseParams)
// const hasura = new hasuraClass.Hasura(keys[env].hasura)
// const fcm = new sender.FCM(keys[env].fcm)


let openOrders: Record<string, TaxiOrder> = {}
rootNodes.openOrders(OrderType.Taxi).on('value', function (snap) {
  openOrders = snap.val()
});

// let notificationStatus = {}
// firebase.database().ref(`/notificationStatus/taxi`).on('value', function (snap) {
//   notificationStatus = {}
//   if (snap.val())
//     notificationStatus = snap.val()
// });

firebase.database().ref(`/metadata/orderExpirationTime`).on('value', function (snap) {
  if (snap.val()) {
    orderExpirationLimit = parseInt(snap.val())
  }
});

async function checkOpenOrders() {
  if (openOrders == null)
    return

  let drivers: Record<string, Taxi> = (await taxiNodes.info().once('value')).val();
  drivers = filterDrivers(drivers)
  let driversToNotify: Record<string, NotifyDriver> = {}
  for (let orderId in openOrders) {
    if (openOrders[orderId].orderTime) {
      let orderTime = new Date(openOrders[orderId].orderTime)
      let orderExpirationTime = new Date(orderTime.getTime() + orderExpirationLimit * 1000);
      if (new Date() > orderExpirationTime) {
        expireOrder(orderId);
        delete openOrders[orderId]
      } else {
        // for drivers not already notified, add them to order notifications list
        driversToNotify = updateOrderNotificationsList(orderId, drivers, driversToNotify)
        // for drivers who just got marked read or received, save the respective times
        checkForStatusChange(orderId)
      }
    } else {
      expireOrder(orderId)
    }
  }
  if (Object.keys(driversToNotify).length > 0) {
    // for drivers who just got marked sent, mark them to be written in hasura
    notifyDrivers(driversToNotify)
  }

  // let hasuraUpdateList = []
  // for (let orderId in openOrders) {
  //   for (let driverId in notificationStatus[orderId]) {
  //     hasuraUpdateList.push({
  //       orderId: orderId,
  //       driverId: driverId,
  //       receivedTime: notificationStatus[orderId][driverId].receievedTime,
  //       readTime: notificationStatus[orderId][driverId].readTime,
  //       sentTime: notificationStatus[orderId][driverId].sentTime
  //     })
  //   }
  // }
  // console.log(hasuraUpdateList);
  // if (hasuraUpdateList.length > 0) {
  //   hasura.updateNotifications(hasuraUpdateList);
  // }
  for (let orderId in openOrders) {
    let openOrder = openOrders[orderId];
    rootNodes.openOrders(OrderType.Taxi, orderId).transaction(function (order) {
      if (order != null) {
        order.notificationStatus = openOrder.notificationStatus!
        return order;
      }
      return order
    });
    customerNodes.inProcessOrders(OrderType.Taxi, orderId).transaction(function (order) {
      if (order != null) {
        order.notificationStatus = openOrder.notificationStatus!
        return order;
      }
      return order
    })
  }
}

setInterval(checkOpenOrders, checkOpenOrdersInterval * 1000);
checkOpenOrders()

function filterDrivers(drivers: Record<string, Taxi>): Record<string, Taxi> {
  let newDrivers: Record<string, Taxi> = {}
  for (let driverId in drivers) {
    let driver = drivers[driverId]
    if (driver.state && driver.state.isLooking && !driver.state.currentOrderId) {
      newDrivers[driverId] = driver
    }
  }
  return newDrivers
}

function updateOrderNotificationsList(orderId: string,
  drivers: Record<string, Taxi>,
  driversToNotify: Record<string, NotifyDriver>):
  Record<string, NotifyDriver> {
  for (let driverId in drivers) {
    if (driversToNotify[driverId])
      continue
    let driver = drivers[driverId]
    let notificationStatus = openOrders[orderId].notificationStatus;
    if (!notificationStatus || !notificationStatus[driverId]
      || (!notificationStatus[driverId].read
        && (!notificationStatus[driverId].sentCount
          || notificationStatus[driverId].sentCount < 6))) {
      driversToNotify[driverId].info = driver
      driversToNotify[driverId].orderId = orderId
    }
  }
  return driversToNotify
}

function checkForStatusChange(orderId: string) {
  let notificationStatus = openOrders[orderId].notificationStatus;
  if (notificationStatus) {
    for (let driverId in notificationStatus) {
      let driver = notificationStatus[driverId]
      if (driver.received && !notificationStatus[driverId].receievedTime) {
        notificationStatus[driverId].receievedTime = (new Date()).toISOString()
      }
      if (driver.read && !notificationStatus[driverId].readTime) {
        notificationStatus[driverId].readTime = (new Date()).toISOString()
        // if read for one order, assum read for all other open orders
        for (let openOrderId in openOrders) {
          openOrders[openOrderId].notificationStatus![driverId].read = true
        }
      }
    }
  }
  openOrders[orderId].notificationStatus = notificationStatus;
}

interface NotifyDriver {
  orderId: string,
  info: Taxi
}

function notifyDrivers(driversToNotify: Record<string, NotifyDriver>) {
  for (let driverId in driversToNotify) {
    let driverToNotify = driversToNotify[driverId];

    // driverNotificationTokens.push(driver.notificationInfo.deviceNotificationToken)

    if (openOrders[driverToNotify.orderId].notificationStatus == undefined)
      openOrders[driverToNotify.orderId].notificationStatus = {}

    if (openOrders[driverToNotify.orderId].notificationStatus![driverId] == undefined)
      openOrders[driverToNotify.orderId].notificationStatus![driverId] = {
        sent: true,
        sentTime: (new Date()).toISOString(),
        sentCount: 1
      }
    else {
      openOrders[driverToNotify.orderId].notificationStatus![driverId].sentCount =
        openOrders[driverToNotify.orderId].notificationStatus![driverId].sentCount + 1;
    }

    push({
      token: driverToNotify.info.notificationInfo.deviceNotificationToken,
      payload: {
        notification: {
          title: "Nueva Pedido",
          body: `Hay una nueva orden de taxi, vea si puede aceptarla.`,
          tag: "newOrder"
        },
        data: {
          notificationType: "newOrder",
          markReceivedUrl: constructReturnUrl(driverToNotify.orderId)
        },
      },
      options: {
        collapseKey: "newOrder",
        priority: NotificationPriority.High
      }
    });

  }
}

function getIPAddress() {
  var interfaces = require('os').networkInterfaces();
  for (var devName in interfaces) {
    var iface = interfaces[devName];

    for (var i = 0; i < iface.length; i++) {
      var alias = iface[i];
      if (alias.family === 'IPv4' && alias.address !== '127.0.0.1' && !alias.internal)
        return alias.address;
    }
  }
  return '0.0.0.0';
}

function constructReturnUrl(orderId: string) {
  let url;
  let dbName;
  if (env == "emulate") {
    url = "http://" + getIPAddress() + ":9000"
    dbName = "mezcalmos-31f1c-default-rtdb"
  } else {
    url = keys.databaseURL
    dbName = keys.databaseURL!.split('.')[0].split('/')[2]
  }
  return `${url}/notificationStatus/taxi/${orderId}/<driverId>/received.json?ns=${dbName}`
}

firebase.database().ref(`/notificationQueue`).on('child_added', function (snap) {
  notifyOtherParticipants(snap.key!, snap.val());
  // firebase.database().ref(`notificationQueue/${snap.key}`).remove();
});

async function notifyOtherParticipants(messageId: string, message: Message) {
  let chat: Chat = (await firebase.database().ref(`chat/${message.orderId}`).once("value")).val();
  if (chat.messages[messageId].alreadyNotified != true) {
    let senderInfo = chat.participants[message.userId]
    senderInfo.id = message.userId
    delete chat.participants[message.userId]
    for (let participantId in chat.participants) {
      let participant = chat.participants[participantId]
      let notification: Notification = {
        foreground: <NewMessageNotification>{
          sender: participant,
          message: message.message,
          time: message.timestamp,
          notificationType: NotificationType.NewMessage,
          notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
        },
        background: {
          en: {
            title: `New message from ${senderInfo.name}`,
            body: message.message
          },
          es: {
            title: `Nueva mensaje de ${senderInfo.name}`,
            body: message.message
          }
        }
      }
      notifyUser.push(participantId, notification, participant.particpantType);
      firebase.database().ref(`chat/${message.orderId}/messages/${messageId}/alreadyNotified`).set(true)
    }
  }
}