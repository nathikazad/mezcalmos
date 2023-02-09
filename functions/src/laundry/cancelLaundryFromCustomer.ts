import { orderInProcess, LaundryOrder, LaundryOrderStatus, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { getLaundryOrder } from "../shared/graphql/laundry/order/getLaundryOrder";
import { getLaundryOperators } from "../shared/graphql/laundry/operators/getLaundryOperator";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { MezAdmin } from "../shared/models/Generic/User";
import { Operator } from "../shared/models/Services/Service";
import { HttpsError } from "firebase-functions/v1/auth";
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
 
// Customer Canceling
interface CancelOrderDetails {
  orderId: number
}

export async function cancelLaundryFromCustomer(userId: number, cancelOrderDetails: CancelOrderDetails) {

  let order: LaundryOrder = await getLaundryOrder(cancelOrderDetails.orderId);
  let promiseResponse = await Promise.all([getMezAdmins(), getLaundryOperators(order.storeId)]);

  let mezAdmins: MezAdmin[] = promiseResponse[0];
  let laundryOperators: Operator[] = promiseResponse[1];

  if (order.customerId != userId) {
    throw new HttpsError(
      "internal",
      `Order does not belong to customer`,
    );
  }
  if (!orderInProcess(order.status)) {
    throw new HttpsError(
      "internal",
      `Order cannot be cancelled because it is not in process`,
    );
  }

  let paymentDetails: PaymentDetails = {
    orderId: cancelOrderDetails.orderId,
    orderType: OrderType.Laundry,
    serviceProviderId: order.storeId,
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

  let notification = notify(cancelOrderDetails, mezAdmins, laundryOperators);

  updateDeliveryStatus();

  async function updateDeliveryStatus() {
    if (order.deliveryType == DeliveryType.Delivery && order.fromCustomerDeliveryId && order.toCustomerDeliveryId) {

      let fromCustomerDeliveryOrder: DeliveryOrder = await getDeliveryOrder(order.fromCustomerDeliveryId);
      let toCustomerDeliveryOrder: DeliveryOrder = await getDeliveryOrder(order.toCustomerDeliveryId);
      let deliveryOperators: DeliveryOperator[] = await getDeliveryOperators(fromCustomerDeliveryOrder.serviceProviderId);

      // switch (prevStatus) {
      //   case LaundryOrderStatus.OrderReceived:
      fromCustomerDeliveryOrder.status = DeliveryOrderStatus.CancelledByCustomer;
      toCustomerDeliveryOrder.status = DeliveryOrderStatus.CancelledByCustomer;
      updateDeliveryOrderStatus(fromCustomerDeliveryOrder);
      updateDeliveryOrderStatus(toCustomerDeliveryOrder);
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

      if(toCustomerDeliveryOrder.deliveryDriver)
        pushNotification(toCustomerDeliveryOrder.deliveryDriver.user?.firebaseId!,
          notification,
          toCustomerDeliveryOrder.deliveryDriver.notificationInfo,
          ParticipantType.DeliveryDriver,
          toCustomerDeliveryOrder.deliveryDriver.user?.language
        );
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
