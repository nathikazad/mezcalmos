import { NewRestaurantOrderNotification, RestaurantOrder } from "../../functions/src/shared/models/Services/Restaurant/RestaurantOrder";
import { getReceivedRestaurantOrders } from "../../functions/src/shared/graphql/restaurant/order/getRestaurantOrder";
import { ParticipantType } from "../../functions/src/shared/models/Generic/Chat";
import { Language } from "../../functions/src/shared/models/Generic/Generic";
import { OrderType } from "../../functions/src/shared/models/Generic/Order";
import { MezAdmin } from "../../functions/src/shared/models/Generic/User";
import { NotificationType, NotificationAction, Notification } from "../../functions/src/shared/models/Notification";
import { orderUrl } from "../../functions/src/utilities/senders/appRoutes";
import { pushNotification } from "../../functions/src/utilities/senders/notifyUser";
import { getMezAdmins } from "../../functions/src/shared/graphql/user/mezAdmin/getMezAdmin";
import * as firebase from "firebase-admin";


const checkOrdersInterval: number = 10 //seconds 60

export function startWatchingRestaurantOrders() {
  setInterval(checkRestaurantOrders, checkOrdersInterval * 1000);
}

async function checkRestaurantOrders() {
  console.log("checking inProcess restaurant orders")
  let orderPromise = getReceivedRestaurantOrders();
  let mezAdminPromise = getMezAdmins();
  let response = await Promise.all([orderPromise, mezAdminPromise]);
  let restaurantOrders: RestaurantOrder[] = response[0];
  let mezAdmins: MezAdmin[] = response[1];
  restaurantOrders.forEach(async(o) => {
    if((new Date()).getTime() - (new Date(o.orderTime!)).getTime() < 60 * 1000) {
      // console.log("orderId: ", o.orderId)
      let notification: Notification = {
        foreground: <NewRestaurantOrderNotification>{
          time: (new Date()).toISOString(),
          notificationType: NotificationType.NewOrder,
          orderType: OrderType.Restaurant,
          orderId: o.orderId,
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
        linkUrl: orderUrl(OrderType.Restaurant, o.orderId!)
      }
      let snap = await firebase.database().ref(`/orders/inProcess/restaurant/${o.orderId}/notified`).once("value");
      let readOperators = snap.val();
      // console.log("readOperators: ", readOperators)
      o.restaurant!.operators!.forEach((r) => {
        if(!(readOperators && readOperators[r.userId!]) &&  r.user && r.online) {
          // console.log("operators: ", r.userId);
          // console.log("notificationInfo: ", r.notificationInfo);
          pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.RestaurantOperator, r.user.language, false);
        }
      });
      mezAdmins.forEach((m) => {
        if(!(readOperators && readOperators[m.id])) {
          // console.log("mezAdmin: ", m.id);
          // console.log("notificationInfo: ", m.notificationInfo);
          pushNotification(m.firebaseId, notification, m.notificationInfo, ParticipantType.MezAdmin, m.language, false);
        }
      })
    }
  })
}

// function notifyAdmins(mezAdmins: MezAdmin[], orderId: number) {

//     let notification: Notification = {
//       foreground: <NewRestaurantOrderNotification>{
//         time: (new Date()).toISOString(),
//         notificationType: NotificationType.NewOrder,
//         orderType: OrderType.Restaurant,
//         orderId: orderId,
//         notificationAction: NotificationAction.ShowSnackBarAlways,
//       },
//       background: {
//         [Language.ES]: {
//           title: "Nueva Pedido",
//           body: `Hay una nueva orden de alimento`
//         },
//         [Language.EN]: {
//           title: "New Order",
//           body: `There is a new restaurant order`
//         }
//       },
//       linkUrl: orderUrl(OrderType.Restaurant, orderId)
//     }
//     mezAdmins.forEach((m) => {
//         pushNotification(m.user?.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
//     });
// }

