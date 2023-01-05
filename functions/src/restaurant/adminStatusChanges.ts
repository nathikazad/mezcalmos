import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
// import { PaymentType } from "../shared/models/Generic/Order";
import { orderInProcess, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { passChecksForRestaurant } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { restaurantOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";
// import { refundPayment } from "../utilities/stripe/payment";
import { getRestaurantOrder } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { updateRestaurantOrderStatus as updateRestaurantOrderStatus } from "../shared/graphql/restaurant/order/updateOrder";
import { OrderType } from "../shared/models/Generic/Order";
import { getCustomer } from "../shared/graphql/restaurant/customer/getCustomer";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Services/Delivery/DeliveryOrder";
import { CustomerInfo } from "../shared/models/Generic/User";
import { HttpsError } from "firebase-functions/v1/auth";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";

let statusArrayInSeq: Array<RestaurantOrderStatus> =
  [RestaurantOrderStatus.OrderReceived,
  RestaurantOrderStatus.PreparingOrder,
  RestaurantOrderStatus.ReadyForPickup,
  RestaurantOrderStatus.OnTheWay,
  RestaurantOrderStatus.Delivered
  ]
export async function prepareOrder(userId: number, data: any) {
  let response: ServerResponse = await changeStatus(data, RestaurantOrderStatus.PreparingOrder, userId)
  return response;
}

export async function cancelOrder(userId: number, data: any) {
  let response: ServerResponse = await changeStatus(data, RestaurantOrderStatus.CancelledByAdmin, userId)
  return response;
}

export async function readyForPickupOrder(userId: number, data: any) {
  let response: ServerResponse = await changeStatus(data, RestaurantOrderStatus.ReadyForPickup, userId)
  return response
}

function expectedPreviousStatus(status: RestaurantOrderStatus): RestaurantOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(statusDetails: any, newStatus: RestaurantOrderStatus, userId: number): Promise<ServerResponse> {

  await passChecksForRestaurant(statusDetails, userId);

  let order = await getRestaurantOrder(statusDetails.orderId);
  if(!(order.deliveryId)) {
    throw new HttpsError(
      "internal",
      "No delivery id"
    );
  }
  let customerPromise = getCustomer(order.customerId);
  let deliveryPromise = getDeliveryOrder(order.deliveryId);
  let response = await Promise.all([customerPromise, deliveryPromise]);
  let customer: CustomerInfo = response[0];
  let deliveryOrder: DeliveryOrder = response[1];

  // let order: RestaurantOrder = validationPass.order;

  // if (order == null) {
  //   return {
  //     status: ServerResponseStatus.Error,
  //     errorMessage: `Order does not exist`,
  //     errorCode: "orderDontExist"
  //   }
  // }

  if (newStatus == RestaurantOrderStatus.CancelledByAdmin) {
    if (!orderInProcess(order.status)) {
      throw new HttpsError(
        "internal",
        "Order cannot be cancelled because it is not in process"
      );
    }
  } else if (expectedPreviousStatus(newStatus) != order.status) {
    throw new HttpsError(
      "internal", 
      `Status is not ${expectedPreviousStatus(newStatus)} but ${order.status}`,
    );
  }

  order.status = newStatus;

  if (newStatus == RestaurantOrderStatus.CancelledByAdmin) {
    // if (order.payment_type == PaymentType.Card) {
    //   order = (await capturePayment(order, 0)) as RestaurantOrder
      // TODO: cancel or capture shipping payment depending on status
    // }
    order.refundAmount = order.totalCost;
    deliveryOrder.status = DeliveryOrderStatus.CancelledByServiceProvider;
    updateDeliveryOrderStatus(deliveryOrder);
  } 
  updateRestaurantOrderStatus(order);
  if(order.status == RestaurantOrderStatus.ReadyForPickup && deliveryOrder.status != DeliveryOrderStatus.AtPickup) {
    deliveryOrder.status = DeliveryOrderStatus.PackageReady;
    updateDeliveryOrderStatus(deliveryOrder);
  } 
  

  
  let notification: Notification = {
    foreground: <RestaurantOrderStatusChangeNotification>{
      status: newStatus,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Restaurant,
      notificationAction: newStatus != RestaurantOrderStatus.CancelledByAdmin
        ? NotificationAction.ShowSnackBarAlways : NotificationAction.ShowPopUp,
      orderId: order.orderId
    },
    background: restaurantOrderStatusChangeMessages[newStatus],
    linkUrl: orderUrl(OrderType.Restaurant, statusDetails.orderId)
  }

  pushNotification(
    customer.firebaseId, 
    notification, 
    customer.notificationInfo,
    ParticipantType.Customer, 
    customer.language
  ).then(() => {
    if (deliveryOrder.deliveryDriver && deliveryOrder.deliveryDriver.user?.firebaseId) {
      notification.linkUrl = orderUrl(OrderType.Restaurant, order.orderId!);
      pushNotification(deliveryOrder.deliveryDriver.user?.firebaseId, 
        notification, 
        deliveryOrder.deliveryDriver.notificationInfo,
        ParticipantType.DeliveryDriver,
        deliveryOrder.deliveryDriver.user?.language,
      );
    }
  });

  return { status: ServerResponseStatus.Success }
}
// export async function setEstimatedFoodReadyTime(userId: number, data: any): Promise<ServerResponse> {

//   if (data.estimatedFoodReadyTime == null || data.orderId == null) {
//     return {
//       status: ServerResponseStatus.Error,
//       errorMessage: `Expected estimatedFoodReadyTime`,
//       errorCode: "invalidParam"
//     }
//   }

//   let validationPass: ValidationPass = await passChecksForRestaurant(data, userId);
//   if (!validationPass.ok) {
//     return validationPass.error!;
//   }
//   setEstFoodReadyTime(data.orderId, data.estimatedFoodReadyTime);

  // let order: RestaurantOrder = validationPass.order;
  // order.estimatedFoodReadyTime = data.estimatedFoodReadyTime;

  // customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
  // await restaurantNodes.inProcessOrders(order.restaurant.id, orderId).update(order);
  // await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).update(order);
  // if (order.dropoffDriver)
  //   deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).update(order);

//   return { status: ServerResponseStatus.Success }
// };

export async function refundCustomerCustomAmount(userId: number, data: any) {

  if (data.refundAmount == null || data.orderId == null) {
    throw new HttpsError(
      "internal", 
      `Expected refundAmount`,
    );
  }
  await passChecksForRestaurant(data, userId);
  return //refund(data.orderId, validationPass.order, data.refundAmount);
};

export async function markOrderItemUnavailable(userId: number, data: any) {

  if (data.itemId == null || data.orderId == null) {
    throw new HttpsError(
      "internal",
      `Expected itemId and orderId`,
    );
  }
  await passChecksForRestaurant(data, userId);

  // let order: RestaurantOrder = validationPass.order;
  let order: RestaurantOrder = await getRestaurantOrder(data.orderId);
  let item = order.items.find((i) => i.orderItemId == data.itemId);
  
  if (item == undefined) {
    throw new HttpsError(
      "internal",
      `invalid item id`,
    );
  }
  item.unavailable = true;

  // order.items[data.itemId].unavailable = true;
  return //refund(data.orderId, order, item.costPerOne * item.quantity);

};

//TODO
// async function refund(orderId: string, order: RestaurantOrder, newRefundAmount: number): Promise<ServerResponse> {
//   if (order.costToCustomer <= 0) return {
//     status: ServerResponseStatus.Error,
//     errorMessage: `No money left to refund`,
//   }
//   let newCostToCustomer = order.totalCost - order.refundAmount - newRefundAmount;
//   if (newCostToCustomer < 0) {
//     newCostToCustomer = 0;
//     newRefundAmount = order.totalCost - order.refundAmount;
//   }

//   order.refundAmount = order.refundAmount + newRefundAmount;
//   order.costToCustomer = newCostToCustomer;
//   if (orderInProcess(order.status)) {
//     customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
//     await restaurantNodes.inProcessOrders(order.restaurant.id, orderId).update(order);
//     await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).update(order);
//     if (order.dropoffDriver)
//       deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).update(order);

//   } else {
//     if (order.paymentType == PaymentType.Card)
//       order = (await refundPayment(order, newRefundAmount)) as RestaurantOrder
//     customerNodes.pastOrders(order.customer.id!, orderId).update(order);
//     await restaurantNodes.pastOrders(order.restaurant.id, orderId).update(order);
//     await rootDbNodes.pastOrders(OrderType.Restaurant, orderId).update(order);
//     if (order.dropoffDriver)
//       deliveryDriverNodes.pastOrders(order.dropoffDriver.id, orderId).update(order);
//   }

//   return { status: ServerResponseStatus.Success }
// }