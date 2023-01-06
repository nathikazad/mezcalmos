import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { orderInProcess, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { passChecksForRestaurant } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { restaurantOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";
import { getRestaurantOrder } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { updateOrderStatus } from "../shared/graphql/restaurant/order/updateOrder";
import { OrderType, PaymentType } from "../shared/models/Generic/Order";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { CustomerInfo } from "../shared/models/Generic/User";
import { HttpsError } from "firebase-functions/v1/auth";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { capturePayment, PaymentDetails } from "../utilities/stripe/payment";

let statusArrayInSeq: Array<RestaurantOrderStatus> =
  [RestaurantOrderStatus.OrderReceived,
  RestaurantOrderStatus.PreparingOrder,
  RestaurantOrderStatus.ReadyForPickup,
  RestaurantOrderStatus.OnTheWay,
  RestaurantOrderStatus.Delivered
  ]
export async function prepareOrder(userId: number, data: any) {
  let response: ServerResponse = await changeStatus(data.orderId, RestaurantOrderStatus.PreparingOrder, userId)
  return response;
}

export async function cancelOrder(userId: number, data: any) {
  let response: ServerResponse = await changeStatus(data.orderId, RestaurantOrderStatus.CancelledByAdmin, userId)
  return response;
}

export async function readyForPickupOrder(userId: number, data: any) {
  let response: ServerResponse = await changeStatus(data.orderId, RestaurantOrderStatus.ReadyForPickup, userId)
  return response
}

function expectedPreviousStatus(status: RestaurantOrderStatus): RestaurantOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(orderId: number, newStatus: RestaurantOrderStatus, userId: number): Promise<ServerResponse> {
  try {
    await passChecksForRestaurant(orderId, userId);

    let order = await getRestaurantOrder(orderId);
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
      if (order.paymentType == PaymentType.Card) {
        let paymentDetails: PaymentDetails = {
          orderId: orderId,
          orderType: OrderType.Restaurant,
          serviceProviderId: order.restaurantId,
          orderStripePaymentInfo: order.stripeInfo!
        }
        capturePayment(paymentDetails, 0)
        // TODO: cancel or capture shipping payment depending on status
      }
      order.refundAmount = order.totalCost;
    } 
    updateOrderStatus(order);
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
      linkUrl: orderUrl(OrderType.Restaurant, orderId)
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
  } catch(error) {
    console.log("error =>", error);
    throw new HttpsError(
      "unknown",
      "Request was not authenticated.",
      error
    );
  }
}

// export async function refundCustomerCustomAmount(userId: number, data: any) {

//   if (data.refundAmount == null || data.orderId == null) {
//     throw new HttpsError(
//       "internal", 
//       `Expected refundAmount`,
//     );
//   }
//   await passChecksForRestaurant(data, userId);
  // return //refund(data.orderId, validationPass.order, data.refundAmount);
// };

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