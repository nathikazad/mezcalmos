import { orderInProcess, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { getRestaurantOrder } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { updateRestaurantOrderStatus } from "../shared/graphql/restaurant/order/updateOrder"
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { restaurantOrderStatusChangeMessages } from "./bgNotificationMessages";
import { orderUrl } from "../utilities/senders/appRoutes";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { MezAdmin } from "../shared/models/Generic/User";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { capturePayment, PaymentDetails } from "../utilities/stripe/payment";
import { Operator } from "../shared/models/Services/Service";
import { MezError } from "../shared/models/Generic/Generic";

// Customer Canceling
interface CancelOrderDetails {
  orderId: number
}
export interface CancelRestaurantOrderResponse {
  success: boolean,
  error?: CancelOrderError
  unhandledError?: string,
}
enum CancelOrderError {
  OrderNotFound = "orderNotFound",
  RestaurantNotfound = "restaurantNotfound",
  IncorrectOrderId = "incorrectOrderId",
  OrderNotInProcess = "orderNotInProcess",
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  OrderStripeInfoNotDefined = "orderStripeInfoNotDefined",
  ServiceProviderStripeAccountDoesNotExist = "serviceProviderStripeAccountDoesNotExist",
  UpdateOrderStripeError = "updateOrderStripeError",
}
export async function cancelOrderFromCustomer(userId: number, data: CancelOrderDetails): Promise<CancelRestaurantOrderResponse> {
  try {
    let mezAdminPromise = getMezAdmins();
    console.log("[+] getMezAdmins " , mezAdminPromise);

    let order: RestaurantOrder = await getRestaurantOrder(data.orderId);
    console.log("[+] getRestaurantOrder " , order);

    let restaurantOperatorsPromise = getRestaurantOperators(order.restaurantId);
    console.log("[+] getRestaurantOperators " , restaurantOperatorsPromise);

    let promiseResponse = await Promise.all([mezAdminPromise, restaurantOperatorsPromise]);
    let mezAdmins: MezAdmin[] = promiseResponse[0];
    let restaurantOperators: Operator[] = promiseResponse[1];

    if (order.customerId != userId) {
      throw new MezError(CancelOrderError.IncorrectOrderId);
    }
    if (!orderInProcess(order.status)) {
      throw new MezError(CancelOrderError.OrderNotInProcess);
    }
    let paymentDetails: PaymentDetails = {
      orderId: order.orderId!,
      serviceProviderDetailsId: order.spDetailsId,
      orderStripePaymentInfo: order.stripeInfo
    }
    switch (order.status) {
      case RestaurantOrderStatus.OrderReceived:
        if (order.paymentType == PaymentType.Card) {
          capturePayment(paymentDetails, 0)
        }
        console.log("cancelling while order received")
        console.log(order.totalCost)
        order.refundAmount = order.totalCost;
        console.log(order.refundAmount)
        break;
      case RestaurantOrderStatus.PreparingOrder:
      case RestaurantOrderStatus.ReadyForPickup:
        if (order.paymentType == PaymentType.Card) {
          capturePayment(paymentDetails, order.itemsCost)
        }
        order.refundAmount = (order.refundAmount ?? 0) + order.deliveryCost;
        break;
      case RestaurantOrderStatus.OnTheWay:
        if (order.paymentType == PaymentType.Card) {
          capturePayment(paymentDetails, order.totalCost)
        }
        break;
      default:
        break;
    }

    order.status = RestaurantOrderStatus.CancelledByCustomer;

    updateRestaurantOrderStatus(order)
    
    
    let notification: Notification = {
      foreground: <RestaurantOrderStatusChangeNotification>{
        status: RestaurantOrderStatus.CancelledByCustomer,
        time: (new Date()).toISOString(),
        notificationType: NotificationType.OrderStatusChange,
        orderType: OrderType.Restaurant,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: data.orderId
      },
      background: restaurantOrderStatusChangeMessages[RestaurantOrderStatus.CancelledByCustomer],
      linkUrl: orderUrl(OrderType.Restaurant, data.orderId)
    }
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
    restaurantOperators.forEach((r) => {
      pushNotification(r.user?.firebaseId!, notification, r.notificationInfo, ParticipantType.RestaurantOperator);
    });

    if(order.deliveryType == DeliveryType.Delivery && order.deliveryId) {

      let deliveryOrder: DeliveryOrder = await getDeliveryOrder(order.deliveryId);

      deliveryOrder.status = DeliveryOrderStatus.CancelledByCustomer;
      updateDeliveryOrderStatus(deliveryOrder);
      if(deliveryOrder.deliveryDriver != undefined) {
        notification.linkUrl = orderUrl(OrderType.Restaurant, order.orderId!);
        pushNotification(deliveryOrder.deliveryDriver.user?.firebaseId!, 
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
      if (Object.values(CancelOrderError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
};