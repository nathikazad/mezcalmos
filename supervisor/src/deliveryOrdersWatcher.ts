import { getNotifiedDrivers } from "../../functions/src/shared/graphql/delivery/getDelivery";
import { ParticipantType } from "../../functions/src/shared/models/Generic/Chat";
import { Language } from "../../functions/src/shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../../functions/src/shared/models/Notification";
import { DeliveryDriver, NewDeliveryOrderNotification } from "../../functions/src/shared/models/Generic/Delivery";
import { pushNotification } from "../../functions/src/utilities/senders/notifyUser";

import { getAllDrivers } from "../../functions/src/shared/graphql/delivery/driver/getDeliveryDriver"
const checkOrdersInterval: number = 10 //seconds 60

export function startWatchingDeliveryOrders() {
    setInterval(checkDeliveryOrders, checkOrdersInterval * 1000);
}

async function checkDeliveryOrders() {
  console.log("checking inProcess delivery orders")
  let deliveryDrivers: DeliveryDriver[] = await getAllDrivers();

  // convert deliveryDrivers to a record of deliveryDriverId: DeliveryDriver
  let deliveryDriversRecord: Record<number, DeliveryDriver> = {};
  deliveryDrivers.forEach((d) => {
    deliveryDriversRecord[d.id] = d;
  })

  let deliveryOrdersNotifiedDrivers = await getNotifiedDrivers();

  deliveryOrdersNotifiedDrivers.forEach(async(o: any) => {
    
    let notification: Notification = buildNotification()

    // let operators: Operator[] = await getDeliveryOperators(o.serviceProviderId!);
    // let snap = await firebase.database().ref(`/orderNotifications/delivery/${o.deliveryId}`).once("value");
    // let readOperators = snap.val();
    // console.log(readOperators)
    // operators.forEach((r) => {
    //     if(!(readOperators && readOperators[r.userId!]) && r.user && r.online) {
    //         pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.DeliveryOperator, r.user.language, false);
    //     }
    // });

    // let mezAdmins: MezAdmin[] = await getMezAdmins();
    // mezAdmins.forEach((m) => {
    //   if(!(readOperators && readOperators[m.id])) {
    //     pushNotification(m.firebaseId, notification, m.notificationInfo, ParticipantType.MezAdmin, m.language, false);
    //   }
    // })

    for(let driverId in o.notifiedDrivers) {
      if(o.notifiedDrivers[driverId] == true) 
        continue;

      let driver = deliveryDriversRecord[parseInt(driverId)];
      if(driver && driver.user) {
        pushNotification(driver.user.firebaseId, notification, driver.notificationInfo, ParticipantType.DeliveryDriver, driver.user.language, false);
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
            body: `Hay un nuevo orden`
          },
          [Language.EN]: {
            title: "New Order",
            body: `There is a new order`
          }
        },
        linkUrl: `/`
      };
    }
  })
}


// async function checkDeliveryOrders() {
//   console.log("checking inProcess delivery orders")
//   let deliveryOrders: DeliveryOrder[] = await getDeliveryCompanyOrders();

//   deliveryOrders.forEach(async(o) => {
//     if((new Date()).getTime() - (new Date(o.orderTime!)).getTime() < 60 * 1000) {

//         let operators: Operator[] = await getDeliveryOperators(o.serviceProviderId!);
//         let mezAdmins: MezAdmin[] = await getMezAdmins();

//         let notification: Notification = buildNotification()
//         let snap = await firebase.database().ref(`/orderNotifications/delivery/${o.deliveryId}`).once("value");
//         let readOperators = snap.val();
//         console.log(readOperators)
//         operators.forEach((r) => {
//             if(!(readOperators && readOperators[r.userId!]) && r.user && r.online) {
//                 pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.DeliveryOperator, r.user.language, false);
//             }
//         });
//         mezAdmins.forEach((m) => {
//           if(!(readOperators && readOperators[m.id])) {
//             pushNotification(m.firebaseId, notification, m.notificationInfo, ParticipantType.MezAdmin, m.language, false);
//           }
//         })
//     }
//     if(o.deliveryDriverId 
//       && (o.status == DeliveryOrderStatus.OrderReceived)
//     ) {
//       let snap = await firebase.database().ref(`/orderNotifications/delivery/${o.deliveryId}`).once("value");
//       let readDrivers = snap.val();
//       if(!(readDrivers && readDrivers[o.deliveryDriver!.userId]) && o.deliveryDriver!.user) {
//         pushNotification(
//           o.deliveryDriver!.user.firebaseId, 
//           buildNotification(), 
//           o.deliveryDriver!.notificationInfo, 
//           ParticipantType.DeliveryDriver,
//           o.deliveryDriver!.user.language,
//           false
//         );
//       }
//     }

//     function buildNotification(): Notification {
//       return {
//         foreground: <NewDeliveryOrderNotification>{
//           time: (new Date()).toISOString(),
//           notificationType: NotificationType.NewOrder,
//           orderType: o.orderType,
//           orderId: o.deliveryId,
//           notificationAction: NotificationAction.ShowSnackBarAlways,
//         },
//         background: {
//           [Language.ES]: {
//             title: "Nueva Pedido",
//             body: `Hay un nuevo orden`
//           },
//           [Language.EN]: {
//             title: "New Order",
//             body: `There is a new order`
//           }
//         },
//         linkUrl: `/`
//       };
//     }
//   })
// }
