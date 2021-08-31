const firebaseAdmin = require("firebase-admin");

const keys = requireHelper("keys").keys()
const hasuraClass = require("../functions/helpers/hasura")
const expireOrder = requireHelper("taxi/expire");
const sender = requireHelper("sender")

function requireHelper(filename) {
  return require(`../functions/helpers/${filename}`)
}

const checkOpenOrdersInterval = 10 //seconds
let orderExpirationLimit = 200 // seconds

if (process.argv.length != 3) {
  console.log("Required environment variable")
  process.exit()
}

const env = process.argv[2]

if (env != "emulate" && env != "staging" && env != "production") {
  console.log("Invalid environment has to be emulate, staging or production")
  process.exit()
}
console.log(keys)
let firebaseParams = { databaseURL: keys[env].databaseURL };
if (keys[env].serviceAccount)
  firebaseParams.credential = firebaseAdmin.credential.cert(require(keys[env].serviceAccount))
const firebase = firebaseAdmin.initializeApp(firebaseParams)
const hasura = new hasuraClass.Hasura(keys[env].hasura)
const fcm = new sender.FCM(keys[env].fcm)


let openOrders = {}
firebase.database().ref(`/openOrders/taxi`).on('value', function (snap) {
  openOrders = snap.val()
});

let notificationStatus = {}
firebase.database().ref(`/notificationStatus/taxi`).on('value', function (snap) {
  notificationStatus = {}
  if (snap.val())
    notificationStatus = snap.val()
  for (orderId in notificationStatus) {
    if (!openOrders[orderId])
      firebase.database().ref(`/notificationStatus/taxi/${orderId}`).remove()
  }
});

firebase.database().ref(`/metadata/orderExpirationTime`).on('value', function (snap) {
  if (snap.val()) {
    orderExpirationLimit = parseInt(snap.val())
  }
});

function filterDrivers(drivers) {
  let newDrivers = {}
  for (let driverId in drivers) {
    let driver = drivers[driverId]
    if (driver.state && driver.state.isLooking && !driver.state.currentOrder
      && driver.notificationInfo && driver.notificationInfo.deviceNotificationToken) {
      newDrivers[driverId] = driver
    }
  }
  return newDrivers
}


function updateOrderNotificationsList(orderId, drivers, orderNotificationsList, driversAlreadyInList) {
  for (let driverId in drivers) {
    if (driversAlreadyInList[driverId])
      continue
    let driver = drivers[driverId]

    let orderNotificationStatuses = notificationStatus[orderId]
    if (!orderNotificationStatuses || !orderNotificationStatuses[driverId] || !orderNotificationStatuses[driverId].read) {
      driversAlreadyInList[driverId] = true
      if (!orderNotificationsList[orderId])
        orderNotificationsList[orderId] = {}
      orderNotificationsList[orderId][driverId] = driver
    }
  }
  return orderNotificationsList, driversAlreadyInList
}

function notifyDrivers(orderNotificationsList, hasuraUpdateList) {
  for (let orderId in orderNotificationsList) {
    if (!notificationStatus[orderId])
      notificationStatus[orderId] = {}
    let driverNotificationTokens = []
    for (let driverId in orderNotificationsList[orderId]) {
      let driver = orderNotificationsList[orderId][driverId];
      driverNotificationTokens.push(driver.notificationInfo.deviceNotificationToken)

      if (!notificationStatus[orderId][driverId])
        notificationStatus[orderId][driverId] = {}
      if (!notificationStatus[orderId])
        notificationStatus[orderId] = {}

      if (!notificationStatus[orderId][driverId])
        notificationStatus[orderId][driverId] = {}

      if (!notificationStatus[orderId][driverId].sent) {
        notificationStatus[orderId][driverId].sent = true
        notificationStatus[orderId][driverId].sentTime = (new Date()).toUTCString()
        notificationStatus[orderId][driverId].sentCount = 1
        hasuraUpdateList.push(`${orderId} ${driverId} sent ${notificationStatus[orderId][driverId].sentTime}`)
      } else {
        notificationStatus[orderId][driverId].sentCount =
          parseInt(notificationStatus[orderId][driverId].sentCount) + 1
      }
    }
    let data = {
      title: "Nueva Pedido",
      body: `Hay una nueva orden de taxi, vea si puede aceptarla.`,
      orderId: orderId,
      notificationType: "newOrder",
      markReceivedUrl: constructReturnUrl(orderId)
    };
    fcm.push({
      registration_ids: driverNotificationTokens,
      data: data
    });

  }
  return hasuraUpdateList
}

function checkForStatusChange(orderId, hasuraUpdateList) {
  if (notificationStatus && notificationStatus[orderId]) {
    for (driverId in notificationStatus[orderId]) {
      let driver = notificationStatus[orderId][driverId]
      if (driver.received && !driver.updatedHasuraAboutReceived) {
        notificationStatus[orderId][driverId].receievedTime = (new Date()).toUTCString()
        notificationStatus[orderId][driverId].updatedHasuraAboutReceived = true
        hasuraUpdateList.push(`${orderId} ${driverId} received ${notificationStatus[orderId][driverId].receievedTime}`)
      }
      if (driver.read && !driver.updatedHasuraAboutRead) {
        notificationStatus[orderId][driverId].readTime = (new Date()).toUTCString()
        notificationStatus[orderId][driverId].updatedHasuraAboutRead = true
        hasuraUpdateList.push(`${orderId} ${driverId} read ${notificationStatus[orderId][driverId].readTime}`)


        for (let openOrderId in openOrders) {
          notificationStatus[openOrderId][driverId].read = true
        }
      }
    }
  }
  return hasuraUpdateList
}

async function checkOpenOrders() {
  if (openOrders == null)
    return

  let drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  drivers = filterDrivers(drivers)
  let orderNotificationsList = {}
  let driversAlreadyInList = {}
  let hasuraUpdateList = []
  for (let orderId in openOrders) {
    if (openOrders[orderId].orderTime) {
      let orderTime = new Date(openOrders[orderId].orderTime)
      let orderExpirationTime = new Date(orderTime.getTime() + orderExpirationLimit * 1000);
      if (Date.now() > orderExpirationTime) {
        expireOrder(firebase, orderId, openOrders[orderId].customer.id, hasura);
        delete openOrders[orderId]
      } else {
        // for drivers not already notified, add them to order notifications list
        orderNotificationsList, driversAlreadyInList = updateOrderNotificationsList(orderId, drivers, orderNotificationsList, driversAlreadyInList)
        // for drivers who just got marked read or received, mark them to be written in hasura
        hasuraUpdateList = checkForStatusChange(orderId, hasuraUpdateList)
      }
    } else {
      expireOrder(firebase, orderId, openOrders[orderId].customer.id, hasura)
    }
  }
  if (Object.keys(orderNotificationsList).length > 0) {
    // for drivers who just got marked sent, mark them to be written in hasura
    hasuraUpdateList = notifyDrivers(orderNotificationsList, hasuraUpdateList)
  }

  if (Object.keys(hasuraUpdateList).length > 0)
    console.log(hasuraUpdateList)


  firebase.database().ref(`/notificationStatus/taxi/`).update(notificationStatus)
}

setInterval(checkOpenOrders, checkOpenOrdersInterval * 1000);
checkOpenOrders()


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

function constructReturnUrl(orderId) {
  let url;
  let dbName;
  if (env == "emulate") {
    url = "http://" + getIPAddress() + ":9000"
    dbName = "mezcalmos-31f1c-default-rtdb"
  } else {
    url = keys[env].databaseURL
    dbName = keys[env].databaseURL.split('.')[0].split('/')[2]
  }
  return `${url}/notificationStatus/taxi/${orderId}/<driverId>/received.json?ns=${dbName}`
}