import { OrderType } from "../shared/models/Generic/Order";
import { OperatorType, ServerResponseStatus } from "../shared/models/Generic/Generic";
// import { checkDeliveryAdmin } from "../shared/helper/authorizer";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { deliveryNewOrderMessage } from "./bgNotificationMessages";
// import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { orderUrl } from "../utilities/senders/appRoutes";
import { getDeliveryDriver } from "../shared/graphql/delivery/getDeliveryDriver";
import { DelivererStatus, DeliveryDriver, DeliveryDriverType, DeliveryOrder, DeliveryOrderStatus, NewDeliveryOrderNotification } from "../shared/models/Services/Delivery/DeliveryOrder";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { assignDeliveryDriver } from "../shared/graphql/delivery/assignDeliverer";
import { setDeliveryChatInfo } from "../shared/graphql/chat/setChatInfo";
import { HttpsError } from "firebase-functions/v1/auth";
import { deleteDeliveryChatMessages } from "../shared/graphql/chat/deleteChatMessages";

export interface AssignDriverDetails {
  deliveryOrderId: number,
  deliveryDriverId: number,
  orderType: OrderType,
 // orderId: number,
  deliveryDriverType: DeliveryDriverType,
  changeDriver?: boolean,
  operatorType: OperatorType,
  deliveryCompanyId: number
}

export async function assignDriver(userId: number, assignDriverDetails: AssignDriverDetails) {

  //TODO
  // response = await checkDeliveryAdmin(userId)
  // if (response != undefined) {
  //   return response;
  // }
  let deliveryOrderPromise = getDeliveryOrder(assignDriverDetails.deliveryOrderId);
  let deliveryDriverPromise = getDeliveryDriver(assignDriverDetails.deliveryDriverId, assignDriverDetails.deliveryDriverType);
  let promiseResponse = await Promise.all([deliveryOrderPromise, deliveryDriverPromise]);
  let deliveryOrder: DeliveryOrder = promiseResponse[0];
  let deliveryDriver: DeliveryDriver = promiseResponse[1];
  if(deliveryOrder.status != DeliveryOrderStatus.OrderReceived && 
    deliveryOrder.status != DeliveryOrderStatus.PackageReady) {
    throw new HttpsError(
      "internal",
      "delivery order is already assigned, complete or cancelled"
    );
  }
  if(deliveryOrder.deliveryDriverId != null) {
    throw new HttpsError(
      "internal",
      "delivery driver already assigned"
    );
  }
  if(deliveryDriver.deliveryDriverType == DeliveryDriverType.DeliveryDriver) {
    if(deliveryDriver.status != DelivererStatus.Authorized) {
      throw new HttpsError(
        "internal",
        "delivery driver not authorized"
      );
    }
    if(deliveryDriver.online != true) {
      throw new HttpsError(
        "internal",
        "delivery driver not online"
      );
    }
  }
  

  //TODO
  if (assignDriverDetails.changeDriver) {
    // let returnVal = removeOldDriver(deliveryDriverType, order, orderId);
    // if (returnVal != null) return returnVal;
    deleteDeliveryChatMessages(deliveryOrder);
  }
  
  await assignDeliveryDriver(assignDriverDetails);

  setDeliveryChatInfo(deliveryOrder, deliveryDriver);
    
  if(deliveryDriver.notificationInfo) {

    let notification: Notification = {
      foreground: <NewDeliveryOrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: assignDriverDetails.orderType,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: assignDriverDetails.deliveryOrderId,
        deliveryDriverType: assignDriverDetails.deliveryDriverType
      },
      background: deliveryNewOrderMessage,
      linkUrl: orderUrl(assignDriverDetails.orderType, assignDriverDetails.deliveryOrderId)
    }
    let participantType: ParticipantType = deliveryDriver.deliveryDriverType == DeliveryDriverType.DeliveryDriver
      ? ParticipantType.DeliveryDriver
      : ParticipantType.RestaurantOperator;

    pushNotification(
      deliveryDriver.user?.firebaseId!, 
      notification, 
      deliveryDriver.notificationInfo, 
      participantType
    );
  }
  return {
    status: ServerResponseStatus.Success,
  }
};

// function removeOldDriver(deliveryDriverType: DeliveryDriverType, order: TwoWayDeliverableOrder, orderId: string) {
  // let notification: Notification = {
  //   foreground: <CancelDeliveryOrderNotification>{
  //     time: (new Date()).toISOString(),
  //     notificationType: NotificationType.OrderStatusChange,
  //     orderType: order.orderType,
  //     notificationAction: NotificationAction.ShowPopUp,
  //     orderId: orderId,
  //     deliveryDriverType: deliveryDriverType,
  //     status: order.orderType == OrderType.Laundry ? LaundryOrderStatus.CancelledByAdmin : RestaurantOrderStatus.CancelledByAdmin,
  //   },
  //   background: deliveryCancelOrderMessage,
  //   linkUrl: orderUrl(ParticipantType.DeliveryDriver, order.orderType, orderId)
  // }
//   switch (deliveryDriverType) {
//     case DeliveryDriverType.DropOff:
//       if (order.dropoffDriver == null)
//         return {
//           status: ServerResponseStatus.Error,
//           errorMessage: "dropoffDriver is not set"
//         }
//       deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).remove();
//       addCancelledOrderToPast(order.dropoffDriver.id, order, orderId);
//       pushNotification(order.dropoffDriver.id, notification, ParticipantType.DeliveryDriver);
//       delete order.dropoffDriver;
//       deleteChat(order.secondaryChats.serviceProviderDropOffDriver!);
//       order.secondaryChats.serviceProviderDropOffDriver = null;
//       deleteChat(order.secondaryChats.customerDropOffDriver!);
//       order.secondaryChats.customerDropOffDriver = null;
//       return null;
//     case DeliveryDriverType.Pickup:
//       if (order.pickupDriver == null)
//         return {
//           status: ServerResponseStatus.Error,
//           errorMessage: "pickupDriver is not  set"
//         }
//       deliveryDriverNodes.inProcessOrders(order.pickupDriver.id, orderId).remove();
//       addCancelledOrderToPast(order.pickupDriver.id, order, orderId);
//       pushNotification(order.pickupDriver.id, notification, ParticipantType.DeliveryDriver);
//       delete order.pickupDriver;
//       deleteChat(order.secondaryChats.serviceProviderPickupDriver!);
//       order.secondaryChats.serviceProviderPickupDriver = null;
//       deleteChat(order.secondaryChats.customerPickupDriver!);
//       order.secondaryChats.customerPickupDriver = null;
//       return null;
//   }
// }

// function addCancelledOrderToPast(driverId: string, order: TwoWayDeliverableOrder, orderId: string) {
//   if (order.orderType == OrderType.Restaurant) {
//     let rOrder: RestaurantOrder = <RestaurantOrder>{ ...order }
//     rOrder.status = RestaurantOrderStatus.CancelledByAdmin;
//     deliveryDriverNodes.pastOrders(driverId, orderId).update(rOrder)
//   } else if (order.orderType == OrderType.Laundry) {
//     let lOrder: LaundryOrder = <LaundryOrder>{ ...order }
//     lOrder.status = LaundryOrderStatus.CancelledByAdmin;
//     deliveryDriverNodes.pastOrders(driverId, orderId).update(lOrder)
//   }

// }