import { isSignedIn } from "../shared/helper/authorizer";
import * as functions from "firebase-functions";
import * as rootNodes from "../shared/databaseNodes/root";
import * as taxiNodes from "../shared/databaseNodes/taxi";
import * as customerNodes from "../shared/databaseNodes/customer";
import { currentOrderIdNode } from "../shared/databaseNodes/taxi";
import { ServerResponseStatus } from "../shared/models/Generic";
import { OrderType } from "../shared/models/Order";
import { push } from "../shared/notification/notifyUser";
import { Notification, NotificationType } from "../shared/models/Notification";
import { TaxiOrder, TaxiOrderStatus, TaxiOrderStatusChangeNotification } from "./models/TaxiOrder";
import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";

export = functions.https.onCall(async (data, context) => {
  let response = isSignedIn(context.auth)
  if (response != undefined)
    return response;
  let taxiId: string = context.auth!.uid;
  let orderId = (await currentOrderIdNode(taxiId).once('value')).val();
  // console.log('the order id', orderId);
  if (orderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Driver has not accepted any ride"
    }
  }

  let transactionResponse = await rootNodes.inProcessOrders(OrderType.Taxi, orderId).transaction(function (order) {
    if (order != null) {
      if (order.lock == true) {
        return
      } else {
        order.lock = true
        return order
      }
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

    if (order == null) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Order id does not match any order"
      }
    }
    if (order.status != TaxiOrderStatus.OnTheWay) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: 'Ride status in not onTheWay but ' + order.status
      }
    }


    order.status = TaxiOrderStatus.InTransit;
    order.rideStartTime = (new Date()).toISOString();

    rootNodes.inProcessOrders(OrderType.Taxi, orderId).update(order);
    customerNodes.inProcessOrders(order.customer.id!).update(order);
    taxiNodes.inProcessOrders(taxiId, orderId).update(order);

    let notification: Notification = {
      foreground: <TaxiOrderStatusChangeNotification>{
        status: TaxiOrderStatus.InTransit,
        time: (new Date()).toISOString(),
        notificationType: NotificationType.OrderStatusChange,
        orderType: OrderType.Taxi,
        orderId: orderId
      },
      background: taxiOrderStatusChangeMessages[TaxiOrderStatus.OnTheWay]
    }

    push(order.customer.id!, notification);

    return {
      status: ServerResponseStatus.Success,
      message: "started"
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
});
