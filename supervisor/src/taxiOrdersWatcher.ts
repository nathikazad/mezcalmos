import * as taxiNodes from "../../functions/src/shared/databaseNodes/taxi";
import * as customerNodes from "../../functions/src/shared/databaseNodes/customer";
import { expireOrder } from "../../functions/src/taxi/expire";
import { NotificationPriority, push } from "../../functions/src/utilities/senders/fcm";
import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { OrderType } from "../../functions/src/shared/models/Generic/Order";
import { TaxiOrder } from "../../functions/src/shared/models/Services/Taxi/TaxiOrder";
import { Taxi } from "../../functions/src/shared/models/Drivers/Taxi";
import { taxiIncomingOrderUrl } from "../../functions/src/utilities/senders/appRoutes";


const checkOpenOrdersInterval: number = 10 //seconds
let orderExpirationLimit: number = 300 // seconds

let openOrders: Record<string, TaxiOrder> = {}
let constructReturnUrl: Function;
export function startWatchingTaxiOrders(_constructReturnUrl: Function) {
  constructReturnUrl = _constructReturnUrl;
  rootNodes.openOrders(OrderType.Taxi).on('value', function (snap: any) {
    openOrders = snap.val()
  });
  setInterval(checkOpenOrders, checkOpenOrdersInterval * 1000);
}


async function checkOpenOrders() {
  console.log("checking open orders")
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
        console.log(`expiring order ${orderId}`)
        expireOrder(orderId);
        delete openOrders[orderId]
      } else {
        // for drivers not already notified, add them to order notifications list
        driversToNotify = updateOrderNotificationsList(orderId, drivers, driversToNotify)
        // for drivers who just got marked read or received from device, save the respective times
        checkForStatusChange(orderId)
      }
    } else {
      expireOrder(orderId)
    }
  }

  notifyDrivers(driversToNotify)

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

  // update notification status as an atomic operatiom, so that cannot be removed just before notification status write.
  updateNotificationStatusesInDb();
}

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

function updateOrderNotificationsList(
  orderId: string,
  drivers: Record<string, Taxi>,
  driversToNotify: Record<string, NotifyDriver> = {}):
  Record<string, NotifyDriver> {
  for (let driverId in drivers) {
    if (driversToNotify[driverId])
      continue
    let driver = drivers[driverId]
    if (!driver.notificationInfo)
      continue
    let notificationStatus = openOrders[orderId].notificationStatus;
    if (!notificationStatus || !notificationStatus[driverId]
      || (!notificationStatus[driverId].read
        && (!notificationStatus[driverId].sentCount
          || notificationStatus[driverId].sentCount < 6))) {
      driversToNotify[driverId] = driversToNotify[driverId] || {}
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
  console.log("inside notify drivers")
  console.log(Object.keys(driversToNotify))
  for (let driverId in driversToNotify) {
    let driverToNotify = driversToNotify[driverId];

    // driverNotificationTokens.push(driver.notificationInfo.deviceNotificationToken)

    if (openOrders[driverToNotify.orderId].notificationStatus == undefined)
      openOrders[driverToNotify.orderId].notificationStatus = {}

    if (openOrders[driverToNotify.orderId].notificationStatus![driverId] == undefined) {
      openOrders[driverToNotify.orderId].notificationStatus![driverId] = {
        sent: true,
        sentTime: (new Date()).toISOString(),
        sentCount: 1
      }
    }
    else {
      if (openOrders[driverToNotify.orderId].notificationStatus![driverId].sentCount == null) {
        openOrders[driverToNotify.orderId].notificationStatus![driverId].sentCount = 0
      }
      openOrders[driverToNotify.orderId].notificationStatus![driverId].sentCount++;
    }

    push({
      token: driverToNotify.info.notificationInfo.deviceNotificationToken,
      payload: {
        notification: {
          title: "Nuevo Pedido",
          body: `Hay una nueva orden de taxi, vea si puede aceptarla.`,
          tag: "newOrder"
        },
        data: {
          notificationType: "newOrder",
          linkUrl: taxiIncomingOrderUrl(driverToNotify.orderId),
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

function updateNotificationStatusesInDb() {
  for (let orderId in openOrders) {
    let openOrder = openOrders[orderId];
    rootNodes.openOrders(OrderType.Taxi, orderId).transaction(function (order) {
      if (order != null) {
        // console.log("root")
        order.notificationStatus = openOrder.notificationStatus!
        // console.log(order)
        return order;
      }
      return order
    });
    customerNodes.inProcessOrders(openOrder.customer.id, orderId).transaction(function (order) {
      if (order != null) {
        // console.log("customer")
        order.notificationStatus = openOrder.notificationStatus!
        // console.log(order)
        return order;
      }
      return order
    })
  }
}