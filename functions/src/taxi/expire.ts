import * as functions from "firebase-functions";
import * as rootNodes from "../shared/databaseNodes/root";
import * as customerNodes from "../shared/databaseNodes/customer";
import { ServerResponseStatus } from "../shared/models/Generic";
import { OrderType } from "../shared/models/Order";
import { push } from "../shared/notification/notifyUser";
import { Notification, NotificationType } from "../shared/models/Notification";
import { TaxiOrder, TaxiOrderStatus, TaxiOrderStatusChangeNotification } from "./models/TaxiOrder";
import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";

export async function expireOrder(orderId: string) {
  let order = (await rootNodes.inProcessOrders(OrderType.Taxi, orderId).once('value')).val()
  if (order == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Order id does not match any order"
    }
  }

  let transactionResponse = await rootNodes.openOrders(OrderType.Taxi, orderId).transaction(function (order) {
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
    if (order.status != TaxiOrderStatus.LookingForTaxi) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: 'cannot expire because order status is not lookingForTaxi'
      }
    }

    order.status = TaxiOrderStatus.Expired;
    order.finishRideTime = (new Date()).toISOString();

    rootNodes.openOrders(OrderType.Taxi, orderId).remove();
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);


    let notification: Notification = {
      foreground: <TaxiOrderStatusChangeNotification>{
        status: TaxiOrderStatus.Expired,
        time: (new Date()).toISOString(),
        notificationType: NotificationType.OrderStatusChange,
        orderType: OrderType.Taxi,
        orderId: orderId
      },
      background: taxiOrderStatusChangeMessages[TaxiOrderStatus.Expired]
    }

    push(order.customer.id!, notification);


    return {
      status: ServerResponseStatus.Success,
      message: 'expired'
    }

  } catch (e) {
    functions.logger.error(`Order request error ${orderId}`);
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order accept error"
    }
  } finally {
    rootNodes.openOrders(OrderType.Taxi, orderId).child("lock").remove();
  }
}
