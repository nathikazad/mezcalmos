import { orderInProcess, LaundryOrder, LaundryOrderStatus } from "../shared/models/Services/Laundry/LaundryOrder";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Generic/Order";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import { finishOrder } from "./helper";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
// import { ParticipantType } from "../shared/models/Generic/Chat";
// import { pushNotification } from "../utilities/senders/notifyUser";
// import * as laundryNodes from "../shared/databaseNodes/services/laundry";

// Customer Canceling
export async function cancelFromCustomer(userId: string, data: any) {

  // let response = isSignedIn(userId)
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

  let order: LaundryOrder = (await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).once('value')).val();
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
  order.status = LaundryOrderStatus.CancelledByCustomer;
  await finishOrder(order, orderId);

  deliveryAdminNodes.deliveryAdmins().once('value', (snapshot) => {
    // let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
    // laundryNodes.laundryOperators(order.serviceProviderId!.toString()).once('value').then((snapshot) => {
    //   let laundryOperators: Record<string, boolean> = snapshot.val();
    //   notifyOthersCancelledOrder(deliveryAdmins, parseInt(orderId), order, laundryOperators);
    // });
  });

  return { status: ServerResponseStatus.Success, orderId: data.orderId }
};


// async function notifyOthersCancelledOrder(
//   deliveryAdmins: Record<string, DeliveryAdmin>,
//   orderId: number,
//   order: LaundryOrder,
//   laundryOperators: Record<string, boolean>) {

//   let notification: Notification = {
//     foreground: <LaundryOrderStatusChangeNotification>{
//       status: LaundryOrderStatus.CancelledByCustomer,
//       time: (new Date()).toISOString(),
//       notificationType: NotificationType.OrderStatusChange,
//       orderType: OrderType.Laundry,
//       notificationAction: NotificationAction.ShowPopUp,
//       orderId: orderId
//     },
//     background: LaundryOrderStatusChangeMessages[LaundryOrderStatus.CancelledByCustomer],
//     linkUrl: orderUrl(OrderType.Laundry, orderId)
//   }

  // for (let adminId in deliveryAdmins) {
  //   pushNotification(adminId!, notification, ParticipantType.DeliveryAdmin);
  // }

  // for (let operatorId in laundryOperators) {
  //   pushNotification(operatorId, notification, ParticipantType.LaundryOperator);
  // }


  // notification.linkUrl = orderUrl(OrderType.Laundry, orderId)
  // if (order.dropoffDriver)
  //   pushNotification(order.dropoffDriver.firebaseId, notification, ParticipantType.DeliveryDriver);
  // else if (order.pickupDriver)
  //   pushNotification(order.pickupDriver.firebaseId, notification, ParticipantType.DeliveryDriver);
// }