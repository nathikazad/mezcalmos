import * as functions from "firebase-functions";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { LaundryOrderStatus, LaundryOrder, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { isSignedIn } from "../shared/helper/authorizer";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Generic/Notification";
import { pushNotification } from "../shared/notification/notifyUser";
import { LaundryOrderStatusChangeMessages } from "../laundry/bgNotificationMessages";
import { finishOrder } from "../laundry/helper";

let statusArrayInSeq: Array<LaundryOrderStatus> =
  [LaundryOrderStatus.OrderReceieved,
  LaundryOrderStatus.OtwPickup,
  LaundryOrderStatus.PickedUp,
  LaundryOrderStatus.AtLaundry,
  LaundryOrderStatus.ReadyForDelivery,
  LaundryOrderStatus.OtwDelivery,
  LaundryOrderStatus.Delivered
  ]

export const startPickup =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.OtwPickup, context.auth)
    return response;
  });


export const finishPickup = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.PickedUp, context.auth)
  return response
});

export const atFacility = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.AtLaundry, context.auth)
  return response
});

export const startDropoff = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.OtwDelivery, context.auth)
  return response
});

export const finishDropoff = functions.https.onCall(async (data, context) => {
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


  if (data.orderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected order id`,
      errorCode: "orderIdNotGiven"
    }
  }

  let orderId: string = data.orderId;
  let deliveryDriverId: string = auth!.uid;
  let order: LaundryOrder = (await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).once('value')).val();
  if (order == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }

  if (expectedPreviousStatus(newStatus) != order.status) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Status is not ${expectedPreviousStatus(newStatus)} but ${order.status}`,
      errorCode: "invalidOrderStatus"
    }
  }


  if (newStatus == LaundryOrderStatus.OtwPickup || newStatus == LaundryOrderStatus.PickedUp
    || newStatus == LaundryOrderStatus.AtLaundry) {
    if (order.pickupDriver.id != deliveryDriverId) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Order does not belong to this delivery driver`,
      }
    }
  }

  if (newStatus == LaundryOrderStatus.OtwDelivery || newStatus == LaundryOrderStatus.Delivered) {
    if (order.dropoffDriver.id != deliveryDriverId) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Order does not belong to this delivery driver`,
      }
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

  order.status = newStatus

  let notification: Notification = {
    foreground: <LaundryOrderStatusChangeNotification>{
      status: newStatus,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Laundry,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: orderId
    },
    background: LaundryOrderStatusChangeMessages[newStatus]
  }

  pushNotification(order.customer.id!, notification);

  if (newStatus == LaundryOrderStatus.Delivered) {
    await finishOrder(order, orderId);
  } else {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
    if (newStatus == LaundryOrderStatus.AtLaundry) {
      await deliveryDriverNodes.inProcessOrders(deliveryDriverId, orderId).remove();
      await deliveryDriverNodes.pastOrders(deliveryDriverId, orderId).update(order)
    } else {
      await deliveryDriverNodes.inProcessOrders(deliveryDriverId, orderId).update(order);
    }
  }
  return { status: ServerResponseStatus.Success }
}