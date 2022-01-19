import * as functions from "firebase-functions";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic";
import { OrderType } from "../shared/models/Order";
import { orderInProcess, LaundryOrderStatus, LaundryOrder, LaundryOrderStatusChangeNotification } from "./models/LaundryOrder";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { finishOrder } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { push } from "../shared/notification/notifyUser";
import { LaundryOrderStatusChangeMessages } from "./bgNotificationMessages";

let statusArrayInSeq: Array<LaundryOrderStatus> =
  [LaundryOrderStatus.OrderReceieved,
  LaundryOrderStatus.OtwPickup,
  LaundryOrderStatus.PickedUp,
  LaundryOrderStatus.AtLaundry,
  LaundryOrderStatus.ReadyForDelivery,
  LaundryOrderStatus.OtwDelivery,
  LaundryOrderStatus.Delivered
  ]

export const otwPickupOrder =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.OtwPickup, context.auth)
    return response;
  });

export const cancelOrder =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.CancelledByAdmin, context.auth)
    return response;
  });

export const pickedUpOrder = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.PickedUp, context.auth)
  return response
});

export const atLaundryOrder = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.AtLaundry, context.auth)
  return response
});

export const readyForDeliveryOrder = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.ReadyForDelivery, context.auth)
  return response
});

export const otwDeliveryOrder = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.OtwDelivery, context.auth)
  return response
});

export const deliveredOrder = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.Delivered, context.auth)
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

  if (newStatus == LaundryOrderStatus.AtLaundry) {
    if (!data.weight) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `When at laundry, need to give weight`,
        errorCode: "weightNotGiven"
      }
    }
    order.weight = data.weight
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

  push(order.customer.id!, notification);

  if (newStatus == LaundryOrderStatus.Delivered
    || newStatus == LaundryOrderStatus.CancelledByAdmin)
    await finishOrder(order, orderId);
  else {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
  }
  return { status: ServerResponseStatus.Success }
}