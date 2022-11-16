import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { LaundryOrderStatus, LaundryOrder, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { isSignedIn } from "../shared/helper/authorizer";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { LaundryOrderStatusChangeMessages } from "../laundry/bgNotificationMessages";
import { finishOrder } from "../laundry/helper";
import { orderUrl } from "../utilities/senders/appRoutes";
import { ParticipantType } from "../shared/models/Generic/Chat";
import * as laundryNodes from "../shared/databaseNodes/services/laundry";
let statusArrayInSeq: Array<LaundryOrderStatus> =
  [LaundryOrderStatus.OrderReceieved,
    LaundryOrderStatus.OtwPickupFromCustomer,
    LaundryOrderStatus.PickedUpFromCustomer,
  LaundryOrderStatus.AtLaundry,
  LaundryOrderStatus.ReadyForDelivery,
    LaundryOrderStatus.OtwPickupFromLaundry,
    LaundryOrderStatus.PickedUpFromLaundry,
  LaundryOrderStatus.Delivered
  ]

export async function startPickupFromCustomer(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.OtwPickupFromCustomer, userId)
  return response;
};

export async function pickedUpFromCustomer(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.PickedUpFromCustomer, userId)
  return response;
};
export async function atFacility(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.AtLaundry, userId)
  return response
};
export async function startPickupFromLaundry(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.OtwPickupFromLaundry, userId)
  return response
};
export async function pickedUpFromLaundry(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.PickedUpFromLaundry, userId)
  return response
};
export async function finishDropoff(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.Delivered, userId)
  return response
};

function expectedPreviousStatus(status: LaundryOrderStatus): LaundryOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(data: any, newStatus: LaundryOrderStatus, userId: string): Promise<ServerResponse> {

  let response = isSignedIn(userId)
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
  let deliveryDriverId: string = userId;
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


  if (newStatus == LaundryOrderStatus.OtwPickupFromCustomer || newStatus == LaundryOrderStatus.PickedUpFromCustomer
    || newStatus == LaundryOrderStatus.AtLaundry) {
    if (order.pickupDriver?.id != deliveryDriverId) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Order does not belong to this delivery driver`,
      }
    }
  }

  if (newStatus == LaundryOrderStatus.OtwPickupFromLaundry || newStatus == LaundryOrderStatus.PickedUpFromLaundry
    || newStatus == LaundryOrderStatus.Delivered) {
    if (order.dropoffDriver?.id != deliveryDriverId) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Order does not belong to this delivery driver`,
      }
    }
  }

  order.status = newStatus

  let notification: Notification = {
    foreground: <LaundryOrderStatusChangeNotification>{
      status: newStatus,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Laundry,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      orderId: orderId
    },
    background: LaundryOrderStatusChangeMessages[newStatus],
    linkUrl: orderUrl(ParticipantType.Customer, OrderType.Laundry, orderId)
  }

  if (order.status != LaundryOrderStatus.OtwPickupFromLaundry)
    pushNotification(order.customer.id!, notification);

  if (newStatus == LaundryOrderStatus.Delivered) {
    await finishOrder(order, orderId);
  } else {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
    laundryNodes.inProcessOrders(order.laundry.id, orderId).update(order);
    if (newStatus == LaundryOrderStatus.AtLaundry) {
      await deliveryDriverNodes.pastOrders(deliveryDriverId, orderId).update(order)
      await deliveryDriverNodes.inProcessOrders(deliveryDriverId, orderId).remove();
    } else {
      await deliveryDriverNodes.inProcessOrders(deliveryDriverId, orderId).update(order);
    }
  }
  return { status: ServerResponseStatus.Success }
}