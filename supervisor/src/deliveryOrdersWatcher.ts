

// import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
// import { DeliverableOrder, OrderType } from "../../functions/src/shared/models/Generic/Order";
// import { RestaurantOrder, RestaurantOrderStatus } from "../../functions/src/shared/models/Services/Restaurant/RestaurantOrder"
// import { LaundryOrder, LaundryOrderStatus } from "../../functions/src/shared/models/Services/Laundry/LaundryOrder"
// import * as deliveryAdminNodes from "../../functions/src/shared/databaseNodes/deliveryAdmin";
// import * as laundryNodes from "../../functions/src/shared/databaseNodes/services/laundry";
// import * as restaurantNodes from "../../functions/src/shared/databaseNodes/services/restaurant";
// import { DeliveryAdmin } from "../../functions/src/shared/models/DeliveryAdmin";
// import { fcmPayload, NotificationPriority, push } from "../../functions/src/utilities/senders/fcm";
// import { NotificationInfo } from "../../functions/src/shared/models/Generic/Generic";
// import * as firebase from "firebase-admin";

import { getDeliveryCompanyOrders } from "../../functions/src/shared/graphql/delivery/getDelivery";
import { getDeliveryOperators } from "../../functions/src/shared/graphql/delivery/operator/getDeliveryOperator";
import { ParticipantType } from "../../functions/src/shared/models/Generic/Chat";
import { Language } from "../../functions/src/shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../../functions/src/shared/models/Notification";
import { DeliveryOperator, DeliveryOrder, DeliveryOrderStatus, NewDeliveryOrderNotification } from "../../functions/src/shared/models/Generic/Delivery";
import { pushNotification } from "../../functions/src/utilities/senders/notifyUser";
import * as firebase from "firebase-admin";
import { MezAdmin } from "../../functions/src/shared/models/Generic/User";
import { getMezAdmins } from "../../functions/src/shared/graphql/user/mezAdmin/getMezAdmins";

const checkOrdersInterval: number = 10 //seconds 60

export function startWatchingDeliveryOrders() {
    setInterval(checkDeliveryOrders, checkOrdersInterval * 1000);
}

async function checkDeliveryOrders() {
  console.log("checking inProcess delivery orders")
  let deliveryOrders: DeliveryOrder[] = await getDeliveryCompanyOrders();

  deliveryOrders.forEach(async(o) => {
    if((new Date()).getTime() - (new Date(o.orderTime!)).getTime() < 60 * 1000) {

        let operators: DeliveryOperator[] = await getDeliveryOperators(o.serviceProviderId!);
        let mezAdmins: MezAdmin[] = await getMezAdmins();

        let notification: Notification = buildNotification()
        let snap = await firebase.database().ref(`/orders/delivery/${o.deliveryId}`).once("value");
        let readOperators = snap.val();
        console.log(readOperators)
        operators.forEach((r) => {
            if(!(readOperators && readOperators[r.userId!]) && r.user) {
                pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.DeliveryOperator);
            }
        });
        mezAdmins.forEach((m) => {
          if(!(readOperators && readOperators[m.id])) {
            pushNotification(m.firebaseId, notification, m.notificationInfo, ParticipantType.MezAdmin);
          }
        })
    }
    if(o.deliveryDriverId 
      && ((o.status == DeliveryOrderStatus.OrderReceived)||(o.status == DeliveryOrderStatus.PackageReady))
    ) {
      let snap = await firebase.database().ref(`/orders/delivery/${o.deliveryId}`).once("value");
      let readDrivers = snap.val();
      if(!(readDrivers && readDrivers[o.deliveryDriver!.userId]) && o.deliveryDriver!.user) {
        pushNotification(o.deliveryDriver!.user.firebaseId, buildNotification(), o.deliveryDriver!.notificationInfo, ParticipantType.DeliveryDriver);
      }
    }

    function buildNotification(): Notification {
      return {
        foreground: <NewDeliveryOrderNotification>{
          time: (new Date()).toISOString(),
          notificationType: NotificationType.NewOrder,
          orderType: o.orderType,
          orderId: o.deliveryId,
          notificationAction: NotificationAction.ShowSnackBarAlways,
        },
        background: {
          [Language.ES]: {
            title: "Nueva Pedido",
            body: `Hay una nueva orden de alimento`
          },
          [Language.EN]: {
            title: "New Order",
            body: `There is a new restaurant order`
          }
        },
        linkUrl: `/`
      };
    }
  })
}


// const checkDeliverableOrdersInterval: number = 10 //seconds 60
// let stopNotifyingLimit: number = 3000 // seconds 600

// let deliverableOrders: Record<OrderType | any, Record<string, DeliverableOrder>> = {}
// let deliveryAdmins: Record<string, DeliveryAdmin> = {}
// let operators: any = {};
// export function startWatchingDeliveryOrders() {
//   rootNodes.inProcessOrders().on('value', function (snap: any) {
//     deliverableOrders = snap.val()
//   });
//   deliveryAdminNodes.deliveryAdmins().on('value', function (snap: any) {
//     deliveryAdmins = snap.val()
//   });
//   firebase.database().ref(`operators`).on('value', function (snap: any) {
//     operators = snap.val()
//   });
//   setInterval(checkdeliverableOrders, checkDeliverableOrdersInterval * 1000);
// }


// async function checkdeliverableOrders() {
//   console.log("checking inProcess delivery orders")
//   if (deliverableOrders == null)
//     return

//   for (let orderType in deliverableOrders) {
//     for (let orderId in deliverableOrders[orderType]) {
//       let deliverableOrder: DeliverableOrder = deliverableOrders[orderType][orderId]
//       let orderTime = new Date(deliverableOrder.orderTime)
//       let orderExpirationTime = new Date(orderTime.getTime() + stopNotifyingLimit * 1000);
//       if (new Date() > orderExpirationTime) {
//         continue
//       }

//       let linkUrl: string = "";
//       let operators: Record<string, boolean> = {};
//       switch (orderType) {
//         case OrderType.Laundry:
//           console.log("laundry order")
//           if ((deliverableOrder as LaundryOrder).status != LaundryOrderStatus.OrderReceived)
//             continue
//           console.log("status received")
//           operators = (await laundryNodes.laundryOperators(deliverableOrder.serviceProviderId!).once('value')).val()
//           break;
//         case OrderType.Restaurant:
//           console.log("restaurant order")
//           // console.log(deliverableOrder)
//           if ((deliverableOrder as RestaurantOrder).status != RestaurantOrderStatus.OrderReceived)
//             continue
//           console.log("status received")
//           operators = (await restaurantNodes.restaurantOperators(deliverableOrder.serviceProviderId!).once('value')).val()
//           break;
//         default:
//           continue;
//       }

//       console.log(`orders/inProcess/${orderType}/${orderId}`)
//       console.log((deliverableOrder as any).notified)
//       if ((deliverableOrder as any).notified?.admin == null) {
//         console.log("notifying admin")
//         for (let adminId in deliveryAdmins) {
//           let deliveryAdmin: DeliveryAdmin = deliveryAdmins[adminId]
//           let notification: fcmPayload = clone(payloadTemplate);
//           if (deliveryAdmin.notificationInfo) {
//           notification.token = deliveryAdmin.notificationInfo.deviceNotificationToken
//           notification.payload.data = { linkUrl: linkUrl };
//           push(notification)
//           }
//         }
//       }

//       if ((deliverableOrder as any).notified?.operator == null) {
//         console.log("notifying operator")
//         for (let operatorId in operators) {
//           let notificationInfo: NotificationInfo = getNotificationInfo(orderType, operatorId)
//           let notification: fcmPayload = clone(payloadTemplate);
//           notification.token = notificationInfo.deviceNotificationToken
//           notification.payload.data = { linkUrl: linkUrl };
//           push(notification)
//         }
//       }
//     }
//   }
// }



// function getNotificationInfo(orderType: OrderType, userId: string): NotificationInfo {
//   return operators[orderType]["info"][userId]["notificationInfo"]
// }

// const payloadTemplate: fcmPayload = {
//   token: "",
//   payload: {
//     notification: {
//       title: "Nuevo Pedido",
//       body: `Hay una nueva orden`,
//       tag: "newOrder"
//     },
//     data: {
//       notificationType: "newOrder",
//       linkUrl: "orderUrl"
//     },
//   },
//   options: {
//     collapseKey: "newOrder",
//     priority: NotificationPriority.High
//   }
// }

// function clone(obj: any) {
//   return JSON.parse(JSON.stringify(obj)) as typeof obj;
// }