import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import * as rootNodes from "../shared/databaseNodes/root";
import * as taxiNodes from "../shared/databaseNodes/taxi";
import * as customerNodes from "../shared/databaseNodes/customer";
import { push } from "../shared/notification/notifyUser";
import { OrderType } from "../shared/models/Order";
import { ServerResponseStatus } from "../shared/models/Generic";
import { orderInProcess, TaxiOrder, TaxiOrderStatus, TaxiOrderStatusChangeNotification } from "../shared/models/taxi/TaxiOrder";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Chat";


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
  //  if there is no order in /inProcess then we  check /open
  if (transactionResponse.snapshot.val() == null) {
    transactionResponse =   await rootNodes.openOrders(OrderType.Taxi, orderId).transaction(function (order) {
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
  }



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
    order.status = TaxiOrderStatus.CancelledByCustomer;
    order.finishRideTime = (new Date()).toISOString();


    rootNodes.inProcessOrders(OrderType.Taxi, orderId).remove();
    // @Nathik i added this because TaxiApp is listening on /orders/open ,
    // and when Customer cancels ride it stays in /orders/open/taxi
    rootNodes.openOrders(OrderType.Taxi, orderId).remove();
    rootNodes.inProcessOrders(OrderType.Taxi, orderId).remove();
    rootNodes.pastOrders(OrderType.Taxi, orderId).set(order);
    customerNodes.inProcessOrders(order.customer.id!, orderId).remove();
    customerNodes.pastOrders(order.customer.id!, orderId).set(order);
    if (order.driver !=  null)
    {
      taxiNodes.inProcessOrders(order.driver.id, orderId).remove();
      taxiNodes.pastOrders(order.driver.id, orderId).set(order);
      let notification: Notification = {
        foreground: <TaxiOrderStatusChangeNotification>{
          status: TaxiOrderStatus.CancelledByCustomer,
          time: (new Date()).toISOString(),
          notificationType: NotificationType.OrderStatusChange,
          orderType: OrderType.Taxi,
          orderId: orderId,
          notificationAction: NotificationAction.ShowPopUp
        },
        background: taxiOrderStatusChangeMessages[TaxiOrderStatus.CancelledByCustomer]
      }
      
      push(order.driver.id, notification, ParticipantType.Taxi);
  
    }

   
    return {
      status: ServerResponseStatus.Success,
      message: "started"
    };
  } catch (e) {
    console.log(e);
    functions.logger.error(`Order start error ${orderId}`);
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order start error"
    }
  } finally {
    rootNodes.inProcessOrders(OrderType.Taxi, orderId).child("lock").remove();
    rootNodes.openOrders(OrderType.Taxi, orderId).child("lock").remove();
  }
});