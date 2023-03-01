
import { getDeliveryCompanyOrders } from "../../functions/src/shared/graphql/delivery/getDelivery";
import { getDeliveryOperators } from "../../functions/src/shared/graphql/delivery/operator/getDeliveryOperator";
import { ParticipantType } from "../../functions/src/shared/models/Generic/Chat";
import { Language } from "../../functions/src/shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../../functions/src/shared/models/Notification";
import { DeliveryOperator, DeliveryOrder, DeliveryOrderStatus, NewDeliveryOrderNotification } from "../../functions/src/shared/models/Generic/Delivery";
import { pushNotification } from "../../functions/src/utilities/senders/notifyUser";
import * as firebase from "firebase-admin";
import { MezAdmin } from "../../functions/src/shared/models/Generic/User";
import { getMezAdmins } from "../../functions/src/shared/graphql/user/mezAdmin/getMezAdmin";

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
                pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.DeliveryOperator, r.user.language, false);
            }
        });
        mezAdmins.forEach((m) => {
          if(!(readOperators && readOperators[m.id])) {
            pushNotification(m.firebaseId, notification, m.notificationInfo, ParticipantType.MezAdmin, m.language, false);
          }
        })
    }
    if(o.deliveryDriverId 
      && (o.status == DeliveryOrderStatus.OrderReceived)
    ) {
      let snap = await firebase.database().ref(`/orders/delivery/${o.deliveryId}`).once("value");
      let readDrivers = snap.val();
      if(!(readDrivers && readDrivers[o.deliveryDriver!.userId]) && o.deliveryDriver!.user) {
        pushNotification(
          o.deliveryDriver!.user.firebaseId, 
          buildNotification(), 
          o.deliveryDriver!.notificationInfo, 
          ParticipantType.DeliveryDriver,
          o.deliveryDriver!.user.language,
          false
        );
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
