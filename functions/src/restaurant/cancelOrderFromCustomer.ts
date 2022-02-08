import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import { orderInProcess, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Generic/Order";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import { finishOrder } from "./helper";
import { notifyDeliveryAdmins } from "../shared/notification/notifyDeliveryAdmin";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import { NotificationAction, NotificationType } from "../shared/models/Generic/Notification";
import * as fcm from "../utilities/senders/fcm"
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";

// Customer Canceling
export = functions.https.onCall(async (data, context) => {
  let response = await isSignedIn(context.auth)
  if (response != undefined) {
    return response;
  }

  if (data.orderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected order id`,
      errorCode: "orderIdNotGiven"
    }
  }

  let orderId: string = data.orderId;

  let order: RestaurantOrder = (await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).once('value')).val();
  if (order == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }

  if (order.customer.id != context.auth!.uid) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not belong to customer`,
      errorCode: "notCustomerOrder"
    }
  }

  if (!orderInProcess(order.status)) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order cannot be cancelled because it is not in process`,
      errorCode: "orderNotInProcess"
    }
  }
  order.status = RestaurantOrderStatus.CancelledByCustomer;
  await finishOrder(order, orderId);

  deliveryAdminNodes.deliveryAdmins().once('value', (snapshot) => {
    notifyDeliveryAdminsCancelledOrder(snapshot.val(), orderId);
  });

  return { status: ServerResponseStatus.Success, orderId: data.orderId }
});


async function notifyDeliveryAdminsCancelledOrder(deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string) {
  let foregroundNotificaiton: RestaurantOrderStatusChangeNotification = {
    status: RestaurantOrderStatus.CancelledByCustomer,
    time: (new Date()).toISOString(),
    notificationType: NotificationType.OrderStatusChange,
    orderType: OrderType.Restaurant,
    notificationAction: NotificationAction.ShowPopUp,
    orderId: orderId,
  }

  let fcmNotification: fcm.fcmPayload = {
    token: [],
    payload: {
      notification: {
        title: "Pedido Cancellado",
        body: `Hay un pedido que es cancelado`,
        tag: NotificationType.OrderStatusChange
      }
    },
    options: {
      priority: fcm.NotificationPriority.High
    }
  };
  notifyDeliveryAdmins(deliveryAdmins, foregroundNotificaiton, fcmNotification);
}