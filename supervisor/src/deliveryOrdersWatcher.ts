

import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { DeliverableOrder, OrderType } from "../../functions/src/shared/models/Generic/Order";
import { RestaurantOrder, RestaurantOrderStatus } from "../../functions/src/shared/models/Services/Restaurant/RestaurantOrder"
import { LaundryOrder, LaundryOrderStatus } from "../../functions/src/shared/models/Services/Laundry/LaundryOrder"
import * as deliveryAdminNodes from "../../functions/src/shared/databaseNodes/deliveryAdmin";
import * as laundryNodes from "../../functions/src/shared/databaseNodes/services/laundry";
import { DeliveryAdmin } from "../../functions/src/shared/models/DeliveryAdmin";
import { fcmPayload, NotificationPriority, push } from "../../functions/src/utilities/senders/fcm";
import { NotificationInfo } from "../../functions/src/shared/models/Generic/Generic";
import * as firebase from "firebase-admin";

const checkDeliverableOrdersInterval: number = 10 //seconds 60
let stopNotifyingLimit: number = 3000 // seconds 600

let deliverableOrders: Record<OrderType | any, Record<string, DeliverableOrder>> = {}
let deliveryAdmins: Record<string, DeliveryAdmin> = {}
let operators: any = {};
export function startWatchingDeliveryOrders() {
  rootNodes.inProcessOrders().on('value', function (snap: any) {
    deliverableOrders = snap.val()
  });
  deliveryAdminNodes.deliveryAdmins().on('value', function (snap: any) {
    deliveryAdmins = snap.val()
  });
  firebase.database().ref(`operators`).on('value', function (snap: any) {
    operators = snap.val()
  });
  setInterval(checkdeliverableOrders, checkDeliverableOrdersInterval * 1000);
}


async function checkdeliverableOrders() {
  console.log("checking inProcess delivery orders")
  if (deliverableOrders == null)
    return

  for (let orderType in deliverableOrders) {
    for (let orderId in deliverableOrders[orderType]) {
      let deliverableOrder: DeliverableOrder = deliverableOrders[orderType][orderId]
      let orderTime = new Date(deliverableOrder.orderTime)
      let orderExpirationTime = new Date(orderTime.getTime() + stopNotifyingLimit * 1000);
      if (new Date() > orderExpirationTime) {
        continue
      }

      let linkUrl: string = "";
      let operators: Record<string, boolean> = {};
      switch (orderType) {
        case OrderType.Laundry:
          console.log("laundry order")
          if ((deliverableOrder as LaundryOrder).status != LaundryOrderStatus.OrderReceieved)
            continue
          console.log("status received")
          operators = (await laundryNodes.laundryOperators(deliverableOrder.serviceProviderId!).once('value')).val()
          break;
        case OrderType.Restaurant:
          console.log("restaurant order")
          // console.log(deliverableOrder)
          if ((deliverableOrder as RestaurantOrder).status != RestaurantOrderStatus.OrderReceieved)
            continue
          console.log("status received")
          break;
        default:
          continue;
      }

      console.log(`orders/inProcess/${orderType}/${orderId}`)
      console.log((deliverableOrder as any).notified)
      if ((deliverableOrder as any).notified?.admin == null) {
        console.log("notifying admin")
        for (let adminId in deliveryAdmins) {
          let deliveryAdmin: DeliveryAdmin = deliveryAdmins[adminId]
          let notification: fcmPayload = clone(payloadTemplate);
          notification.token = deliveryAdmin.notificationInfo.deviceNotificationToken
          notification.payload.data.linkUrl = linkUrl;
          push(notification)
        }
      }

      if ((deliverableOrder as any).notified?.operator == null) {
        console.log("notifying operator")
        for (let operatorId in operators) {
          let notificationInfo: NotificationInfo = getNotificationInfo(orderType, operatorId)
          let notification: fcmPayload = clone(payloadTemplate);
          notification.token = notificationInfo.deviceNotificationToken
          notification.payload.data.linkUrl = linkUrl;
          push(notification)
        }
      }
    }
  }
}



function getNotificationInfo(orderType: OrderType, userId: string): NotificationInfo {
  return operators[orderType]["info"][userId]["notificationInfo"]
}

const payloadTemplate: fcmPayload = {
  token: "",
  payload: {
    notification: {
      title: "Nuevo Pedido",
      body: `Hay una nueva orden`,
      tag: "newOrder"
    },
    data: {
      notificationType: "newOrder",
      linkUrl: "orderUrl"
    },
  },
  options: {
    collapseKey: "newOrder",
    priority: NotificationPriority.High
  }
}

function clone(obj: any) {
  return JSON.parse(JSON.stringify(obj)) as typeof obj;
}