import * as functions from "firebase-functions";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ServerResponse, ServerResponseStatus, ValidationPass } from "../shared/models/Generic/Generic";
import { OrderType, PaymentType } from "../shared/models/Generic/Order";
import { orderInProcess, RestaurantOrderStatusChangeNotification, RestaurantOrder, RestaurantOrderStatus } from "../shared/models/Services/Restaurant/RestaurantOrder";
import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { finishOrder, passChecksForRestaurant } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { restaurantOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";
import { capturePayment, refundPayment } from "../utilities/stripe/payment";

let statusArrayInSeq: Array<RestaurantOrderStatus> =
  [RestaurantOrderStatus.OrderReceieved,
  RestaurantOrderStatus.PreparingOrder,
  RestaurantOrderStatus.ReadyForPickup,
  RestaurantOrderStatus.OnTheWay,
  RestaurantOrderStatus.Delivered
  ]

export const prepareOrder =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, RestaurantOrderStatus.PreparingOrder, context.auth)
    return response;
  });

export const cancelOrder =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, RestaurantOrderStatus.CancelledByAdmin, context.auth)
    return response;
  });

export const readyForPickupOrder = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, RestaurantOrderStatus.ReadyForPickup, context.auth)
  return response
});

function expectedPreviousStatus(status: RestaurantOrderStatus): RestaurantOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(data: any, newStatus: RestaurantOrderStatus, auth?: AuthData): Promise<ServerResponse> {

  let validationPass: ValidationPass = await passChecksForRestaurant(data, auth);
  if (!validationPass.ok) {
    return validationPass.error!;
  }

  let order: RestaurantOrder = validationPass.order;
  let orderId = data.orderId;

  if (order == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }

  if (newStatus == RestaurantOrderStatus.CancelledByAdmin) {
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

  if (newStatus == RestaurantOrderStatus.CancelledByAdmin) {
    if (order.paymentType == PaymentType.Card) {
      order = (await capturePayment(order, 0)) as RestaurantOrder
      // TODO: cancel or capture shipping payment depending on status
    }
    order.refundAmount = order.totalCost;
    order.costToCustomer = order.totalCost - order.refundAmount;
    await finishOrder(order, orderId);
  } else {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    restaurantNodes.inProcessOrders(order.serviceProviderId!, orderId).update(order);
    await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).update(order);
    if (order.dropoffDriver)
      deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).update(order);
  }

  let notification: Notification = {
    foreground: <RestaurantOrderStatusChangeNotification>{
      status: newStatus,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Restaurant,
      notificationAction: newStatus != RestaurantOrderStatus.CancelledByAdmin
        ? NotificationAction.ShowSnackBarAlways : NotificationAction.ShowPopUp,
      orderId: orderId
    },
    background: restaurantOrderStatusChangeMessages[newStatus],
    linkUrl: orderUrl(ParticipantType.Customer, OrderType.Restaurant, orderId)
  }

  pushNotification(order.customer.id!, notification).then(() => {
    if (order.dropoffDriver) {
      notification.linkUrl = orderUrl(ParticipantType.DeliveryDriver, OrderType.Restaurant, orderId);
      pushNotification(order.dropoffDriver.id!, notification, ParticipantType.DeliveryDriver);
    }
  });

  return { status: ServerResponseStatus.Success }
}

export const setEstimatedFoodReadyTime = functions.https.onCall(async (data, context) => {
  if (data.estimatedFoodReadyTime == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected estimatedFoodReadyTime`,
      errorCode: "orderIdNotGiven"
    }
  }

  let validationPass: ValidationPass = await passChecksForRestaurant(data, context.auth);
  if (!validationPass.ok) {
    return validationPass.error;
  }

  let order: RestaurantOrder = validationPass.order;


  let orderId = data.orderId;
  order.estimatedFoodReadyTime = data.estimatedFoodReadyTime;

  customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
  await restaurantNodes.inProcessOrders(order.restaurant.id, orderId).update(order);
  await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).update(order);
  if (order.dropoffDriver)
    deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).update(order);

  return { status: ServerResponseStatus.Success }
});

export const refundCustomerCustomAmount =
  functions.https.onCall(async (data, context) => {
    if (data.refundAmount == null || data.orderId == null) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected refundAmount`,
        errorCode: "invalidParam"
      }
    }
    let validationPass: ValidationPass = await passChecksForRestaurant(data, context.auth, true);
    if (!validationPass.ok) {
      return validationPass.error!;
    }
    return refund(data.orderId, validationPass.order, data.refundAmount);
  });

export const markOrderItemUnavailable =
  functions.https.onCall(async (data, context) => {
    if (data.itemId == null || data.orderId == null) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected itemId and orderId`,
        errorCode: "invalidParam"
      }
    }
    let validationPass: ValidationPass = await passChecksForRestaurant(data, context.auth, true);
    if (!validationPass.ok) {
      return validationPass.error!;
    }
    let order: RestaurantOrder = validationPass.order;

    if (order.items[data.itemId] == null) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `invalid item id`,
        errorCode: "invalidParam"
      }
    }
    order.items[data.itemId].unavailable = true;
    return refund(data.orderId, validationPass.order, order.items[data.itemId].totalCost);

  });

async function refund(orderId: string, order: RestaurantOrder, newRefundAmount: number): Promise<ServerResponse> {
  if (order.costToCustomer <= 0) return {
    status: ServerResponseStatus.Error,
    errorMessage: `No money left to refund`,
  }
  let newCostToCustomer = order.totalCost - order.refundAmount - newRefundAmount;
  if (newCostToCustomer < 0) {
    newCostToCustomer = 0;
    newRefundAmount = order.totalCost - order.refundAmount;
  }

  order.refundAmount = order.refundAmount + newRefundAmount;
  order.costToCustomer = newCostToCustomer;
  if (orderInProcess(order.status)) {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    await restaurantNodes.inProcessOrders(order.restaurant.id, orderId).update(order);
    await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).update(order);
    if (order.dropoffDriver)
      deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).update(order);

  } else {
    if (order.paymentType == PaymentType.Card)
      order = (await refundPayment(order, newRefundAmount)) as RestaurantOrder
    customerNodes.pastOrders(order.customer.id!, orderId).update(order);
    await restaurantNodes.pastOrders(order.restaurant.id, orderId).update(order);
    await rootDbNodes.pastOrders(OrderType.Restaurant, orderId).update(order);
    if (order.dropoffDriver)
      deliveryDriverNodes.pastOrders(order.dropoffDriver.id, orderId).update(order);
  }

  return { status: ServerResponseStatus.Success }
}