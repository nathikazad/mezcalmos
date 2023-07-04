import { getReceivedLaundryOrders } from "../../functions/src/shared/graphql/laundry/order/getLaundryOrder";
import { ParticipantType } from "../../functions/src/shared/models/Generic/Chat";
import { Language } from "../../functions/src/shared/models/Generic/Generic";
import { OrderType } from "../../functions/src/shared/models/Generic/Order";
import { MezAdmin } from "../../functions/src/shared/models/Generic/User";
import { NotificationType, NotificationAction, Notification } from "../../functions/src/shared/models/Notification";
import { orderUrl } from "../../functions/src/utilities/senders/appRoutes";
import { pushNotification } from "../../functions/src/utilities/senders/notifyUser";
import { getMezAdmins } from "../../functions/src/shared/graphql/user/mezAdmin/getMezAdmin";
import * as firebase from "firebase-admin";
import { LaundryOrder, NewLaundryOrderNotification } from "../../functions/src/shared/models/Services/Laundry/LaundryOrder";


const checkOrdersInterval: number = 10 //seconds 60

export function startWatchingLaundryOrders() {
  setInterval(checkLaundryOrders, checkOrdersInterval * 1000);
}

async function checkLaundryOrders() {
  console.log("checking inProcess laundry orders")
  let orderPromise = getReceivedLaundryOrders();
  let mezAdminPromise = getMezAdmins();
  let response = await Promise.all([orderPromise, mezAdminPromise]);
  let laundryOrders: LaundryOrder[] = response[0];
  let mezAdmins: MezAdmin[] = response[1];
  laundryOrders.forEach(async(o) => {
    if((new Date()).getTime() - (new Date(o.orderTime!)).getTime() < 60 * 1000) {
        let notification: Notification = {
            foreground: <NewLaundryOrderNotification>{
                time: (new Date()).toISOString(),
                notificationType: NotificationType.NewOrder,
                orderType: OrderType.Laundry,
                orderId: o.orderId,
                notificationAction: NotificationAction.ShowSnackBarAlways,
                laundryStore: (o.laundryStore) ? {
                    name: o.laundryStore.name,
                    image: o.laundryStore.image,
                    id: o.laundryStore.id
                }: undefined
            },
            background: {
                [Language.ES]: {
                    title: "Nueva Pedido",
                    body: `Hay un nuevo pedido de lavandería.`
                },
                [Language.EN]: {
                    title: "New Order",
                    body: `There is a new laundry order`
                }
            },
            linkUrl: orderUrl(OrderType.Laundry, o.orderId)
        }
      let snap = await firebase.database().ref(`/orderNotifications/laundry/${o.orderId}`).once("value");
      let readOperators = snap.val();
      // console.log(readOperators)
      o.laundryStore!.operators!.forEach((r) => {
        if(!(readOperators && readOperators[r.userId!]) &&  r.user && r.online) {
          pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.LaundryOperator, r.user.language, false);
        }
      });
      mezAdmins.forEach((m) => {
        if(!(readOperators && readOperators[m.id])) {
          pushNotification(m.firebaseId, notification, m.notificationInfo, ParticipantType.MezAdmin, m.language, false);
        }
      })
    }
  })
}

