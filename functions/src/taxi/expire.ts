import * as functions from "firebase-functions";
import * as rootNodes from "../shared/databaseNodes/root";
import * as customerNodes from "../shared/databaseNodes/customer";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { TaxiOrder, TaxiOrderStatus, TaxiOrderStatusChangeNotification } from "../shared/models/Services/Taxi/TaxiOrder";
import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";

export async function expireOrder(orderId: string) {
  let order = (await rootNodes.openOrders(OrderType.Taxi, orderId).once('value')).val()
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
    rootNodes.pastOrders(OrderType.Taxi, orderId).set(order);
    customerNodes.inProcessOrders(order.customer.id!, orderId).remove();
    customerNodes.pastOrders(order.customer.id!, orderId).set(order);



    let notification: Notification = {
      foreground: <TaxiOrderStatusChangeNotification>{
        status: TaxiOrderStatus.Expired,
        time: (new Date()).toISOString(),
        notificationType: NotificationType.OrderStatusChange,
        orderType: OrderType.Taxi,
        orderId: orderId,
        notificationAction: NotificationAction.ShowPopUp,
      },
      background: taxiOrderStatusChangeMessages[TaxiOrderStatus.Expired],
      linkUrl: orderUrl(ParticipantType.Customer, OrderType.Taxi, orderId)
    }

    pushNotification(order.customer.id!, notification, ParticipantType.Customer, true);

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
