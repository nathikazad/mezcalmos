import * as functions from "firebase-functions";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ServerResponse, ServerResponseStatus, ValidationPass } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { orderInProcess, RestaurantOrderStatusChangeNotification, RestaurantOrder, RestaurantOrderStatus } from "../shared/models/Services/Restaurant/RestaurantOrder";
import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { finishOrder } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { restaurantOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";

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

  let response = await isSignedIn(auth)
  if (response != undefined) {
    return response;
  }

  response = await checkDeliveryAdmin(auth!.uid)
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
  let order: RestaurantOrder = (await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).once('value')).val();
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

  if (newStatus == RestaurantOrderStatus.ReadyForPickup && order.dropoffDriver == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order cannot be ready for pick up when drop off driver is null`,
    }
  }

  order.status = newStatus

  if (newStatus == RestaurantOrderStatus.Delivered
    || newStatus == RestaurantOrderStatus.CancelledByAdmin)
    await finishOrder(order, orderId);
  else {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    restaurantNodes.inProcessOrders(order.customer.id!, orderId).update(order);
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

  let validationPass = await passChecksForRestaurant(data, context.auth);
  if (!validationPass.ok) {
    return validationPass.error;
  }

  let order: RestaurantOrder = validationPass.order;


  let orderId = data.orderId;
  order.estimatedFoodReadyTime = data.estimatedFoodReadyTime;

  customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
  await restaurantNodes.inProcessOrders(order.restaurant.id, orderId).update(order);
  rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).update(order);
  if (order.dropoffDriver)
    deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).update(order);

  return { status: ServerResponseStatus.Success }
});

async function checkRestaurantOperator(laundryId: string, operatorId: string): Promise<ServerResponse | undefined> {
  let operator = (await restaurantNodes.restaurantOperators(laundryId, operatorId).once('value')).val();
  let isOperator = operator != null && operator == true
  if (!isOperator) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Only authorized laundry operators can run this operation"
    }
  }
  return undefined;
}

async function passChecksForRestaurant(data: any, auth?: AuthData): Promise<ValidationPass> {
  let response = await isSignedIn(auth)
  if (response != undefined) {
    return {
      ok: false,
      error: response
    }
  }
  if (data.orderId == null) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected order id`,
        errorCode: "orderIdNotGiven"
      }
    }
  }

  let orderId: string = data.orderId;
  let order: RestaurantOrder = (await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).once('value')).val();
  if (order == null) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Order does not exist`,
        errorCode: "orderDontExist"
      }
    }
  }

  if (data.fromRestaurantOperator) {
    response = await checkRestaurantOperator(order.restaurant.id, auth!.uid)
    if (response != undefined) {
      return {
        ok: false,
        error: response
      };
    }
  } else {
  response = await checkDeliveryAdmin(auth!.uid)
  if (response != undefined) {
    return {
      ok: false,
      error: response
    };
  }
  }

  return {
    ok: true,
    order: order
  }
}