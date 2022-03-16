import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import { orderInProcess, LaundryOrder, LaundryOrderStatus, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Generic/Order";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import { finishOrder } from "./helper";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { LaundryOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { orderUrl } from "../utilities/senders/appRoutes";

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

  let order: LaundryOrder = (await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).once('value')).val();
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
  order.status = LaundryOrderStatus.CancelledByCustomer;
  await finishOrder(order, orderId);

  deliveryAdminNodes.deliveryAdmins().once('value', (snapshot) => {
    notifyOthersCancelledOrder(snapshot.val(), orderId, order);
  });

  return { status: ServerResponseStatus.Success, orderId: data.orderId }
});


async function notifyOthersCancelledOrder(deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string, order: LaundryOrder) {

  let notification: Notification = {
    foreground: <LaundryOrderStatusChangeNotification>{
      status: LaundryOrderStatus.CancelledByCustomer,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Restaurant,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: orderId
    },
    background: LaundryOrderStatusChangeMessages[LaundryOrderStatus.CancelledByCustomer],
    linkUrl: orderUrl(ParticipantType.DeliveryAdmin, OrderType.Laundry, orderId)
  }

  for (let adminId in deliveryAdmins) {
    pushNotification(adminId!, notification, ParticipantType.DeliveryAdmin);
  }

  if (order.dropoffDriver)
    pushNotification(order.dropoffDriver.id, notification, ParticipantType.DeliveryDriver);
  else if (order.pickupDriver)
    pushNotification(order.pickupDriver.id, notification, ParticipantType.DeliveryDriver);
}