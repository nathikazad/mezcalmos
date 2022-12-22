import { NewRestaurantOrderNotification, RestaurantOrder } from "../../functions/src/shared/models/Services/Restaurant/RestaurantOrder";
import { getReceivedRestaurantOrders } from "../../functions/src/shared/graphql/restaurant/order/getRestaurantOrder";
import { RestaurantOperator } from "../../functions/src/shared/models/Services/Restaurant/Restaurant";
import { ParticipantType } from "../../functions/src/shared/models/Generic/Chat";
import { Language } from "../../functions/src/shared/models/Generic/Generic";
import { OrderType } from "../../functions/src/shared/models/Generic/Order";
import { MezAdmin } from "../../functions/src/shared/models/Generic/User";
import { NotificationType, NotificationAction, Notification } from "../../functions/src/shared/models/Notification";
import { orderUrl } from "../../functions/src/utilities/senders/appRoutes";
import { pushNotification } from "../../functions/src/utilities/senders/notifyUser";
import { getMezAdmins } from "../../functions/src/shared/graphql/user/mezAdmin/getMezAdmins";
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

      notifyAdmins(mezAdmins, o.orderId!);
      notifyOperators(o.orderId!, o.restaurant!.restaurantOperators!);
    }
  })
}

function notifyAdmins(mezAdmins: MezAdmin[], orderId: number) {

    let notification: Notification = {
      foreground: <NewRestaurantOrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: OrderType.Restaurant,
        orderId: orderId,
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
      linkUrl: orderUrl(OrderType.Restaurant, orderId)
    }
    mezAdmins.forEach((m) => {
        pushNotification(m.user?.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
}

async function notifyOperators(orderId: number, operators: RestaurantOperator[]) {
    let notification: Notification = {
      foreground: <NewRestaurantOrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: OrderType.Restaurant,
        orderId,
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
      linkUrl: orderUrl(OrderType.Restaurant, orderId)
    }
    let snap = await firebase.database().ref(`/orders/restaurant/${orderId}`).once("value");
    let readOperators = snap.val();
    // console.log(readOperators)
    operators.forEach((r) => {
      if(!(readOperators && readOperators[r.id!]) &&  r.user) {
        pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.RestaurantOperator);
      }
    });
  }
