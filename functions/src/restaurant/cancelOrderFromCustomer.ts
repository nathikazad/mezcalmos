import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import { orderInProcess, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import { OrderType } from "../shared/models/Generic/Order";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import { finishOrder } from "./helper";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { restaurantOrderStatusChangeMessages } from "./bgNotificationMessages";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
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
    let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
    restaurantNodes.restaurantOperators(order.serviceProviderId!).once('value').then((snapshot) => {
      let restaurantOperators: Record<string, boolean> = snapshot.val();
      notifyOthersCancelledOrder(deliveryAdmins, orderId, order, restaurantOperators);
    });
  });


  return { status: ServerResponseStatus.Success, orderId: data.orderId }
});


async function notifyOthersCancelledOrder(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string,
  order: RestaurantOrder,
  restaurantOperators: Record<string, boolean>) {

  let notification: Notification = {
    foreground: <RestaurantOrderStatusChangeNotification>{
      status: RestaurantOrderStatus.CancelledByCustomer,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Restaurant,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: orderId
    },
    background: restaurantOrderStatusChangeMessages[RestaurantOrderStatus.CancelledByCustomer],
    linkUrl: orderUrl(ParticipantType.DeliveryAdmin, OrderType.Restaurant, orderId)
  }

  for (let adminId in deliveryAdmins) {
    pushNotification(adminId!, notification, ParticipantType.DeliveryAdmin);
  }

  for (let operatorId in restaurantOperators) {
    pushNotification(operatorId, notification, ParticipantType.RestaurantOperator);
  }

  if (order.dropoffDriver) {
    notification.linkUrl = orderUrl(ParticipantType.DeliveryDriver, OrderType.Restaurant, orderId)
    pushNotification(order.dropoffDriver.id, notification, ParticipantType.DeliveryDriver);
  }


}