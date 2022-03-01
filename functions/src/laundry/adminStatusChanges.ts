import * as functions from "firebase-functions";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { orderInProcess, LaundryOrderStatus, LaundryOrder, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { finishOrder } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Generic/Notification";
import { pushNotification } from "../shared/notification/notifyUser";
import { LaundryOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Generic/Chat";

let statusArrayInSeq: Array<LaundryOrderStatus> =
  [LaundryOrderStatus.OrderReceieved,
  LaundryOrderStatus.OtwPickup,
  LaundryOrderStatus.PickedUp,
  LaundryOrderStatus.AtLaundry,
  LaundryOrderStatus.ReadyForDelivery,
  LaundryOrderStatus.OtwDelivery,
  LaundryOrderStatus.Delivered
  ]

export const cancelOrder =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.CancelledByAdmin, context.auth)
    return response;
  });

export const readyForDeliveryOrder = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.ReadyForDelivery, context.auth)
  return response
});

function expectedPreviousStatus(status: LaundryOrderStatus): LaundryOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(data: any, newStatus: LaundryOrderStatus, auth?: AuthData): Promise<ServerResponse> {

  let response = await isSignedIn(auth)
  if (response != undefined) {
    return response;
  }

  response = await checkDeliveryAdmin(auth!.uid)
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

  if (newStatus == LaundryOrderStatus.CancelledByAdmin) {
    if (!orderInProcess(order.status))
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Order cannot be cancelled because it is not in process`,
        errorCode: "orderNotInProcess"
      }
  } else if (expectedPreviousStatus(newStatus) != order.status) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Status is not ${expectedPreviousStatus(newStatus)} but ${order.status}`,
      errorCode: "invalidOrderStatus"
    }
  }

  if (newStatus == LaundryOrderStatus.ReadyForDelivery && order.dropoffDriver == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order cannot be ready for delivery when drop off driver is null`,
    }
  }

  order.status = newStatus

  let notification: Notification = {
    foreground: <LaundryOrderStatusChangeNotification>{
      status: newStatus,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Laundry,
      notificationAction: newStatus != LaundryOrderStatus.CancelledByAdmin
        ? NotificationAction.ShowSnackBarAlways : NotificationAction.ShowPopUp,
      orderId: orderId
    },
    background: LaundryOrderStatusChangeMessages[newStatus]
  }

  pushNotification(order.customer.id!, notification);

  if (order.dropoffDriver)
    pushNotification(order.dropoffDriver.id!, notification, ParticipantType.DeliveryDriver);
  else if (order.pickupDriver)
    pushNotification(order.pickupDriver.id!, notification, ParticipantType.DeliveryDriver);

  if (newStatus == LaundryOrderStatus.CancelledByAdmin)
    await finishOrder(order, orderId);
  else if (newStatus == LaundryOrderStatus.ReadyForDelivery) {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
    deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).update(order);
  }
  return { status: ServerResponseStatus.Success }
}