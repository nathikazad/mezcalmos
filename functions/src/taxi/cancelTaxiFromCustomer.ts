import * as functions from "firebase-functions";
import * as rootNodes from "../shared/databaseNodes/root";
import * as taxiNodes from "../shared/databaseNodes/taxi";
// import { pushNotification } from "../utilities/senders/notifyUser";
import { OrderType } from "../shared/models/Generic/Order";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import { orderInProcess, TaxiOrder, TaxiOrderStatus } from "../shared/models/Services/Taxi/TaxiOrder";
// import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
// import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";
// import { ParticipantType } from "../shared/models/Generic/Chat";
// import { orderUrl } from "../utilities/senders/appRoutes";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import { DeliveryAdmin } from "../shared/models/Generic/Delivery";

export async function cancelTaxiFromCustomer(userId: string, data: any) {

  // let response = isSignedIn(userId);
  // if (response != undefined) {
  //   return response;
  // }

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

    // if (order.customer.firebaseId != userId) {
    //   return {
    //     status: ServerResponseStatus.Error,
    //     errorMessage: `Order does not belong to customer`,
    //     errorCode: "notCustomerOrder"
    //   }
    // }

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
    rootNodes.openOrders(OrderType.Taxi, orderId).remove();
    rootNodes.inProcessOrders(OrderType.Taxi, orderId).remove();
    rootNodes.pastOrders(OrderType.Taxi, orderId).set(order);
    // await customerNodes.pastOrders(order.customer.firebaseId!, orderId).set(order);
    // await customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).remove();
    
    if (order.driver !=  null)
    {
      taxiNodes.inProcessOrders(order.driver.firebaseId, orderId).remove();
      taxiNodes.pastOrders(order.driver.firebaseId, orderId).set(order);
      taxiNodes.currentOrderIdNode(order.driver.firebaseId).remove()
      // let notification: Notification = {
      //   foreground: <TaxiOrderStatusChangeNotification>{
      //     status: TaxiOrderStatus.CancelledByCustomer,
      //     time: (new Date()).toISOString(),
      //     notificationType: NotificationType.OrderStatusChange,
      //     orderType: OrderType.Taxi,
      //     orderId: parseInt(orderId),
      //     notificationAction: NotificationAction.ShowPopUp
      //   },
      //   background: taxiOrderStatusChangeMessages[TaxiOrderStatus.CancelledByCustomer],
      //   linkUrl: orderUrl(OrderType.Taxi, parseInt(orderId))
      // }
      
      // pushNotification(order.driver.firebaseId, notification, ParticipantType.Taxi);
    }

    deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
      let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
      notifyDeliveryAdminsNewOrder(deliveryAdmins, orderId)
    })

    return {
      status: ServerResponseStatus.Success,
      message: "started"
    };
  } catch (e) {
    console.log(e);
    functions.logger.error(`Order cancel error ${orderId}`);
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order cancel error"
    }
  } finally {
    rootNodes.inProcessOrders(OrderType.Taxi, orderId).child("lock").remove();
    rootNodes.openOrders(OrderType.Taxi, orderId).child("lock").remove();
  }
};

async function notifyDeliveryAdminsNewOrder(deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string) {

  // let notification: Notification = {
  //   foreground: <TaxiOrderStatusChangeNotification>{
  //     time: (new Date()).toISOString(),
  //     status: TaxiOrderStatus.CancelledByCustomer,
  //     notificationType: NotificationType.OrderStatusChange,
  //     orderType: OrderType.Taxi,
  //     orderId: orderId,
  //     notificationAction: NotificationAction.ShowSnackBarAlways,
  //   },
  //   background: {
  //     [Language.ES]: {
  //       title: "Pedido de Taxi Cancellado",
  //       body: `El cliente cancelo el pedido de taxi`
  //     },
  //     [Language.EN]: {
  //       title: "Taxi Order Cancelled",
  //       body: `The customer cancelled the order`
  //     }
  //   },
  //   linkUrl: orderUrl(ParticipantType.DeliveryAdmin, OrderType.Taxi, orderId)
  // }

  // for (let adminId in deliveryAdmins) {
  //   pushNotification(adminId!, notification, ParticipantType.DeliveryAdmin);
  // }
}