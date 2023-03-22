import { orderInProcess, LaundryOrder, LaundryOrderStatus, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { getLaundryOrder } from "../shared/graphql/laundry/order/getLaundryOrder";
import { getLaundryOperators } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { MezAdmin } from "../shared/models/Generic/User";
import { Operator } from "../shared/models/Services/Service";
import { PaymentDetails, capturePayment } from "../utilities/stripe/payment";
import { updateLaundryOrderStatus } from "../shared/graphql/laundry/order/updateOrder";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { DeliveryOperator, DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { LaundryOrderStatusChangeMessages } from "./bgNotificationMessages";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { MezError } from "../shared/models/Generic/Generic";
 
// Customer Canceling
interface CancelOrderDetails {
  orderId: number
}
export interface CancelLaundryResponse {
  success: boolean,
  error?: CancelLaundryError
  unhandledError?: string,
}
enum CancelLaundryError {
  OrderNotFound = "orderNotFound",
  LaundryStoreNotfound = "laundryStoreNotfound",
  IncorrectOrderId = "incorrectOrderId",
  OrderNotInProcess = "orderNotInProcess",
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  OrderStripeInfoNotDefined = "orderStripeInfoNotDefined",
  ServiceProviderStripeAccountDoesNotExist = "serviceProviderStripeAccountDoesNotExist",
  UpdateOrderStripeError = "updateOrderStripeError",
  DeliveryCompanyOperatorsNotFound = "deliveryCompanyOperatorsNotFound",
}

export async function cancelLaundryFromCustomer(userId: number, cancelOrderDetails: CancelOrderDetails): Promise<CancelLaundryResponse> {
  try {
    let order: LaundryOrder = await getLaundryOrder(cancelOrderDetails.orderId);
    let promiseResponse = await Promise.all([getMezAdmins(), getLaundryOperators(order.storeId)]);

    let mezAdmins: MezAdmin[] = promiseResponse[0];
    let laundryOperators: Operator[] = promiseResponse[1];

    if (order.customerId != userId) {
      throw new MezError(CancelLaundryError.IncorrectOrderId);
    }
    if (!orderInProcess(order.status)) {
      throw new MezError(CancelLaundryError.OrderNotInProcess);
    }

    let paymentDetails: PaymentDetails = {
      orderId: cancelOrderDetails.orderId,
      serviceProviderDetailsId: order.spDetailsId,
      orderStripePaymentInfo: order.stripeInfo
    }
    switch (order.status) {
      case LaundryOrderStatus.OrderReceived:
        if (order.paymentType == PaymentType.Card) {
          capturePayment(paymentDetails, 0)
        }
        order.refundAmount = order.totalCost;
        break;
      case LaundryOrderStatus.OtwPickupFromCustomer:
      case LaundryOrderStatus.PickedUpFromCustomer:
      case LaundryOrderStatus.AtLaundry:
      case LaundryOrderStatus.ReadyForDelivery:
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.PickedUpFromLaundry:
        if (order.paymentType == PaymentType.Card) {
          capturePayment(paymentDetails, order.totalCost)
        }
        break;
      default:
        break;
    }
    // let prevStatus: LaundryOrderStatus = order.status;

    order.status = LaundryOrderStatus.CancelledByCustomer;
    updateLaundryOrderStatus(order);

    let notification: Notification = notify(cancelOrderDetails, mezAdmins, laundryOperators);

    updateDeliveryStatus(order, notification);

    return {
      success: true
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(CancelLaundryError).includes(e.message as any)) {
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

  async function updateDeliveryStatus(order: LaundryOrder, notification: Notification) {
    if (order.deliveryType == DeliveryType.Delivery && order.fromCustomerDeliveryId) {

      let fromCustomerDeliveryOrder: DeliveryOrder = await getDeliveryOrder(order.fromCustomerDeliveryId);
      let deliveryOperators: DeliveryOperator[] = await getDeliveryOperators(fromCustomerDeliveryOrder.serviceProviderId);

      // switch (prevStatus) {
      //   case LaundryOrderStatus.OrderReceived:
      fromCustomerDeliveryOrder.status = DeliveryOrderStatus.CancelledByCustomer;
      updateDeliveryOrderStatus(fromCustomerDeliveryOrder);
      //   break;
      // default:
      //   break;
      // }
      //notify driver
      deliveryOperators.forEach((d) => {
        pushNotification(d.user?.firebaseId!,
          notification,
          d.notificationInfo,
          ParticipantType.DeliveryOperator,
          d.user?.language
        );
      })
      if(fromCustomerDeliveryOrder.deliveryDriver) 
        pushNotification(fromCustomerDeliveryOrder.deliveryDriver.user?.firebaseId!,
          notification,
          fromCustomerDeliveryOrder.deliveryDriver.notificationInfo,
          ParticipantType.DeliveryDriver,
          fromCustomerDeliveryOrder.deliveryDriver.user?.language
        );

      if(order.toCustomerDeliveryId) {
        let toCustomerDeliveryOrder: DeliveryOrder = await getDeliveryOrder(order.toCustomerDeliveryId);

        toCustomerDeliveryOrder.status = DeliveryOrderStatus.CancelledByCustomer;
        updateDeliveryOrderStatus(toCustomerDeliveryOrder);

        if(toCustomerDeliveryOrder.deliveryDriver)
          pushNotification(toCustomerDeliveryOrder.deliveryDriver.user?.firebaseId!,
            notification,
            toCustomerDeliveryOrder.deliveryDriver.notificationInfo,
            ParticipantType.DeliveryDriver,
            toCustomerDeliveryOrder.deliveryDriver.user?.language
          );
      }
    }
  }
};

function notify(cancelOrderDetails: CancelOrderDetails, mezAdmins: MezAdmin[], laundryOperators: Operator[]) {
  let notification: Notification = {
    foreground: <LaundryOrderStatusChangeNotification>{
      status: LaundryOrderStatus.CancelledByCustomer,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Laundry,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: cancelOrderDetails.orderId
    },
    background: LaundryOrderStatusChangeMessages[LaundryOrderStatus.CancelledByCustomer],
    linkUrl: orderUrl(OrderType.Laundry, cancelOrderDetails.orderId)
  };
  mezAdmins.forEach((m) => {
    pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
  });
  laundryOperators.forEach((r) => {
    pushNotification(r.user?.firebaseId!, notification, r.notificationInfo, ParticipantType.LaundryOperator);
  });
  return notification;
}
