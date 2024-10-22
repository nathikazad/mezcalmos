import { orderInProcess, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { passChecksForRestaurant } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { restaurantOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";
import { getRestaurantOrder } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { updateRestaurantOrderStatus } from "../shared/graphql/restaurant/order/updateOrder";
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { CustomerInfo } from "../shared/models/Generic/User";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { capturePayment, PaymentDetails } from "../utilities/stripe/payment";
import { MezError } from "../shared/models/Generic/Generic";

let statusArrayInSeq: Array<RestaurantOrderStatus> =
  [RestaurantOrderStatus.OrderReceived,
  RestaurantOrderStatus.Preparing,
  RestaurantOrderStatus.Ready,
  RestaurantOrderStatus.OnTheWay,
  RestaurantOrderStatus.Delivered
  ]

interface ChangeStatusDetails {
  orderId:number
}
export interface ChangeRestaurantStatusResponse {
  success: boolean,
  error?: ChangeRestaurantStatusError
  unhandledError?: string,
}
export enum ChangeRestaurantStatusError {
  UnhandledError = "unhandledError",
  OrderNotFound = "orderNotFound",
  UnauthorizedAccess = "unauthorizedAccess",
  IncorrectOrderId = "incorrectOrderId",
  CustomerNotFound = "customerNotFound",
  OrderNotInProcess = "orderNotInProcess",
  InvalidStatus = "invalidStatus",
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  OrderStripeInfoNotDefined = "orderStripeInfoNotDefined",
  ServiceProviderStripeAccountDoesNotExist = "serviceProviderStripeAccountDoesNotExist",
  UpdateOrderStripeError = "updateOrderStripeError",
}
export async function prepareOrder(userId: number, data: ChangeStatusDetails): Promise<ChangeRestaurantStatusResponse> {
  return await changeStatus(data.orderId, RestaurantOrderStatus.Preparing, userId)
}

export async function cancelOrder(userId: number, data: ChangeStatusDetails): Promise<ChangeRestaurantStatusResponse> {
  return await changeStatus(data.orderId, RestaurantOrderStatus.CancelledByAdmin, userId)
}

export async function readyForPickupOrder(userId: number, data: ChangeStatusDetails): Promise<ChangeRestaurantStatusResponse> {
  return await changeStatus(data.orderId, RestaurantOrderStatus.Ready, userId)
}

export async function orderPickedUpByCustomer(userId: number, data: ChangeStatusDetails): Promise<ChangeRestaurantStatusResponse> {
  return await changeStatus(data.orderId, RestaurantOrderStatus.Delivered, userId)
}

function expectedPreviousStatus(status: RestaurantOrderStatus): RestaurantOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(orderId: number, newStatus: RestaurantOrderStatus, userId: number): Promise<ChangeRestaurantStatusResponse> {
  try {
    await passChecksForRestaurant(orderId, userId);

    let order: RestaurantOrder = await getRestaurantOrder(orderId);
    let customer: CustomerInfo = await getCustomer(order.customerId);

    if (newStatus == RestaurantOrderStatus.Delivered || newStatus == RestaurantOrderStatus.CancelledByAdmin) {
      if (!orderInProcess(order.status)) {
        throw new MezError(ChangeRestaurantStatusError.OrderNotInProcess);
      }
    } else if (expectedPreviousStatus(newStatus) != order.status) {
      throw new MezError(ChangeRestaurantStatusError.InvalidStatus);
    }
    
    if (newStatus == RestaurantOrderStatus.CancelledByAdmin) {
      if (order.paymentType == PaymentType.Card) {
        let paymentDetails: PaymentDetails = {
          orderId: orderId,
          serviceProviderDetailsId: order.spDetailsId,
          orderStripePaymentInfo: order.stripeInfo!
        }
        capturePayment(paymentDetails, 0)
      }
      order.refundAmount = order.totalCost;
    }

    order.status = newStatus;
    updateRestaurantOrderStatus(order);
      
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
      linkUrl: orderUrl(OrderType.Restaurant, orderId)
    }

    pushNotification(
      customer.firebaseId, 
      notification, 
      customer.notificationInfo,
      ParticipantType.Customer, 
      customer.language
    )

    if(order.deliveryType == DeliveryType.Delivery) {

      let deliveryOrder: DeliveryOrder = await getDeliveryOrder(order.deliveryId!);
      if (newStatus == RestaurantOrderStatus.CancelledByAdmin) {
        deliveryOrder.status = DeliveryOrderStatus.CancelledByServiceProvider;
        updateDeliveryOrderStatus(deliveryOrder);
      }
      if(order.status == RestaurantOrderStatus.Ready) {
        deliveryOrder.packageReady = true;
        updateDeliveryOrderStatus(deliveryOrder);
      } 
      if (deliveryOrder.deliveryDriver && deliveryOrder.deliveryDriver.user?.firebaseId) {
        notification.linkUrl = `/orders/${order.deliveryId}`;
        pushNotification(deliveryOrder.deliveryDriver.user.firebaseId, 
          notification, 
          deliveryOrder.deliveryDriver.notificationInfo,
          ParticipantType.DeliveryDriver,
          deliveryOrder.deliveryDriver.user?.language,
        );
      }
    }
    return {
      success: true
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(ChangeRestaurantStatusError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: ChangeRestaurantStatusError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
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