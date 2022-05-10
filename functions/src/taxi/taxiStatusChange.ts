import { isSignedIn } from "../shared/helper/authorizer";
import * as functions from "firebase-functions";
import * as rootNodes from "../shared/databaseNodes/root";
import * as taxiNodes from "../shared/databaseNodes/taxi";
import * as customerNodes from "../shared/databaseNodes/customer";
import { currentOrderIdNode } from "../shared/databaseNodes/taxi";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { orderInProcess, TaxiOrder, TaxiOrderStatus, TaxiOrderStatusChangeNotification } from "../shared/models/Services/Taxi/TaxiOrder";
import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";

let statusArrayInSeq: Array<TaxiOrderStatus> =
  [
    TaxiOrderStatus.Scheduled,
    TaxiOrderStatus.OnTheWay,
    TaxiOrderStatus.InTransit,
    TaxiOrderStatus.DroppedOff
  ]

export const startScheduledRide =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, TaxiOrderStatus.OnTheWay, context.auth)
    return response;
  });

export const startRide =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, TaxiOrderStatus.InTransit, context.auth)
    return response;
  });

export const finishRide =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, TaxiOrderStatus.DroppedOff, context.auth)
    return response;
  });

export const cancelTaxiFromDriver = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, TaxiOrderStatus.CancelledByTaxi, context.auth)
  return response
});

function expectedPreviousStatus(status: TaxiOrderStatus): TaxiOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(data: any, newStatus: TaxiOrderStatus, auth?: AuthData): Promise<ServerResponse> {

  let response = isSignedIn(auth)
  if (response != undefined)
    return response;
  let taxiId: string = auth!.uid;
  let orderId = (await currentOrderIdNode(taxiId).once('value')).val();
  if (orderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Driver has not accepted any ride"
    }
  }

  let transactionResponse = await rootNodes.inProcessOrders(OrderType.Taxi, orderId).transaction(function (order) {
    if (order != null) {
      // if (order.lock == true) {
      //   return 
      // } else {
        order.lock = true
        return order
      // }
    }
    return order
  })


  if (!transactionResponse.committed) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: 'attempt to start but locked'
    }
  }

  try {
    let order: TaxiOrder = transactionResponse.snapshot.val()

    if (newStatus == TaxiOrderStatus.CancelledByTaxi) {
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


    order.status = newStatus;
    order.startRideTime = (new Date()).toISOString();

    if (newStatus == TaxiOrderStatus.InTransit) {
      rootNodes.inProcessOrders(OrderType.Taxi, orderId).update(order);
      customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
      taxiNodes.inProcessOrders(taxiId, orderId).update(order);
    } else {
      rootNodes.inProcessOrders(OrderType.Taxi, orderId).remove();
      rootNodes.pastOrders(OrderType.Taxi, orderId).set(order);
      await customerNodes.pastOrders(order.customer.id!, orderId).set(order);
      customerNodes.inProcessOrders(order.customer.id!, orderId).remove();
      taxiNodes.inProcessOrders(taxiId, orderId).remove();
      taxiNodes.pastOrders(taxiId, orderId).set(order);
      currentOrderIdNode(taxiId).remove()
    }
    
    let notification: Notification = {
      foreground: <TaxiOrderStatusChangeNotification>{
        status: newStatus,
        time: (new Date()).toISOString(),
        notificationType: NotificationType.OrderStatusChange,
        orderType: OrderType.Taxi,
        orderId: orderId,
        notificationAction: newStatus != TaxiOrderStatus.CancelledByTaxi
          ? NotificationAction.ShowSnackBarAlways : NotificationAction.ShowPopUp,
      },
      background: taxiOrderStatusChangeMessages[newStatus],
      linkUrl: orderUrl(ParticipantType.Customer, OrderType.Taxi, orderId)
    }

    pushNotification(order.customer.id!, notification);

    return {
      status: ServerResponseStatus.Success,
      message: newStatus.toString()+' Successfully !'
    };
  } catch (e) {
    functions.logger.error(`Order start error ${orderId}`);
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order start error"
    }
  } finally {
    rootNodes.inProcessOrders(OrderType.Taxi, orderId).child("lock").remove();
  }
}
