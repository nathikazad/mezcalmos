import { ServerResponse, ServerResponseStatus, ValidationPass } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { orderInProcess, LaundryOrderStatus, LaundryOrder, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { expectedPreviousStatus, finishOrder, passChecksForLaundry } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { LaundryOrderStatusChangeMessages } from "./bgNotificationMessages";
import { orderUrl } from "../utilities/senders/appRoutes";

export async function cancelOrder(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.CancelledByAdmin, userId)
  return response;
};

export async function readyForDeliveryOrder(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.ReadyForDelivery, userId)
  return response
};


async function changeStatus(data: any, newStatus: LaundryOrderStatus, userId: string): Promise<ServerResponse> {

  let validationPass: ValidationPass = await passChecksForLaundry(data, userId);
  if (!validationPass.ok) {
    return validationPass.error!;
  }

  let order: LaundryOrder = validationPass.order;
  let orderId = data.orderId;

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
  if (newStatus == LaundryOrderStatus.CancelledByAdmin)
    await finishOrder(order, orderId);
  else if (newStatus == LaundryOrderStatus.ReadyForDelivery) {
    // customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).update(order);
    // laundryNodes.inProcessOrders(order.laundry.firebaseId, orderId).update(order);
    await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
    // deliveryDriverNodes.inProcessOrders(order.dropoffDriver!.firebaseId, orderId).update(order);
  }

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
    background: LaundryOrderStatusChangeMessages[newStatus],
    linkUrl: orderUrl(OrderType.Laundry, orderId)
  }

  // await pushNotification(order.customer.firebaseId!, notification);

  notification.linkUrl = orderUrl(OrderType.Laundry, orderId)
  // if (order.dropoffDriver)
  //   pushNotification(order.dropoffDriver.firebaseId!, notification, ParticipantType.DeliveryDriver);
  // else if (order.pickupDriver)
  //   pushNotification(order.pickupDriver.firebaseId!, notification, ParticipantType.DeliveryDriver);



  return { status: ServerResponseStatus.Success }
}

export async function setWeight(userId: string, data: any) {

  if (data.costsByType == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected costsByType`,
      errorCode: "orderIdNotGiven"
    }
  }

  let validationPass = await passChecksForLaundry(data, userId);
  if (!validationPass.ok) {
    return validationPass.error;
  }

  let order: LaundryOrder = validationPass.order;

  if (order.status != LaundryOrderStatus.AtLaundry) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Order weight can only be changed when status is at laundry`,
        errorCode: "orderNotAtLaundry"
      }
    }
  }

  let orderId = data.orderId;
  // order.costsByType = data.costsByType;
  // order.cost = order.shippingCost + order.costsByType?.weighedCost

  // customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).update(order);
  // await laundryNodes.inProcessOrders(order.laundry.firebaseId, orderId).update(order);
  rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
  // if (order.dropoffDriver)
  //   deliveryDriverNodes.inProcessOrders(order.dropoffDriver.firebaseId, orderId).update(order);

  return { status: ServerResponseStatus.Success }
};

export async function setEstimatedLaundryReadyTime(userId: string, data: any) {

  if (data.estimatedLaundryReadyTime == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected estimatedLaundryReadyTime`,
      errorCode: "orderIdNotGiven"
    }
  }

  let validationPass = await passChecksForLaundry(data, userId);
  if (!validationPass.ok) {
    return validationPass.error;
  }

  let order: LaundryOrder = validationPass.order;

  let orderId = data.orderId;
  // order.estimatedLaundryReadyTime = data.estimatedLaundryReadyTime;

  // customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).update(order);
  // await laundryNodes.inProcessOrders(order.laundry.firebaseId, orderId).update(order);
  rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
  // if (order.dropoffDriver)
  //   deliveryDriverNodes.inProcessOrders(order.dropoffDriver.firebaseId, orderId).update(order);

  return { status: ServerResponseStatus.Success }
};

