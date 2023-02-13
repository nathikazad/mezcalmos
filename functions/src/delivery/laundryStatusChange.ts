import { OrderType, PaymentType } from "../shared/models/Generic/Order";
import { LaundryOrderStatus, LaundryOrder, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import { HttpsError } from "firebase-functions/v1/auth";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { DeliveryDirection, DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { CustomerInfo } from "../shared/models/Generic/User";
import { NotificationType, NotificationAction, Notification } from "../shared/models/Notification";
import { Operator } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { PaymentDetails, capturePayment } from "../utilities/stripe/payment";
import { ChangeDeliveryStatusDetails } from "./statusChange";
import { getLaundryOrderFromDelivery } from "../shared/graphql/laundry/order/getLaundryOrder";
import { updateLaundryOrderStatus } from "../shared/graphql/laundry/order/updateOrder";
import { LaundryOrderStatusChangeMessages } from "../laundry/bgNotificationMessages";
import { getLaundryOperators } from "../shared/graphql/laundry/operators/getLaundryOperator";


export async function changeLaundryOrderStatus(
  changeDeliveryStatusDetails: ChangeDeliveryStatusDetails,
  customer: CustomerInfo,
  deliveryOrder: DeliveryOrder
) {

  let laundryOrder: LaundryOrder = await getLaundryOrderFromDelivery(deliveryOrder);
  let laundryOperators: Operator[] = await getLaundryOperators(laundryOrder.storeId);

  if ((laundryOrder.fromCustomerDeliveryId != changeDeliveryStatusDetails.deliveryId) 
    && (laundryOrder.toCustomerDeliveryId != changeDeliveryStatusDetails.deliveryId)
  ) {
    throw new HttpsError(
      "internal",
      "laundry order and delivery order do not match"
    );
  }
  switch (deliveryOrder.direction) {
    case DeliveryDirection.FromCustomer:
      switch (deliveryOrder.status) {
        case DeliveryOrderStatus.OnTheWayToPickup:
          laundryOrder.status = LaundryOrderStatus.OtwPickupFromCustomer;
          break;
        case DeliveryOrderStatus.OnTheWayToDropoff:
          laundryOrder.status = LaundryOrderStatus.PickedUpFromCustomer;
          break;
        case DeliveryOrderStatus.Delivered:
          laundryOrder.status = LaundryOrderStatus.AtLaundry;
          break;
        default:
          break;
      }
      break;
    case DeliveryDirection.ToCustomer:
      switch (deliveryOrder.status) {
        case DeliveryOrderStatus.OnTheWayToPickup:
          laundryOrder.status = LaundryOrderStatus.OtwPickupFromLaundry;
          break;
        case DeliveryOrderStatus.OnTheWayToDropoff:
          laundryOrder.status = LaundryOrderStatus.PickedUpFromLaundry;
          break;
        case DeliveryOrderStatus.Delivered:
          laundryOrder.status = LaundryOrderStatus.Delivered;
          break;
        default:
          break;
      }
      break;
    default:
      break;
  }
  updateLaundryOrderStatus(laundryOrder);

  notify(laundryOrder, deliveryOrder, laundryOperators, customer);

  if (laundryOrder.status == LaundryOrderStatus.Delivered) {
    if (laundryOrder.paymentType == PaymentType.Card) {
      let paymentDetails: PaymentDetails = {
        orderId: laundryOrder.orderId!,
        orderType: OrderType.Laundry,
        serviceProviderId: laundryOrder.storeId,
        orderStripePaymentInfo: laundryOrder.stripeInfo!
      }
      capturePayment(paymentDetails, laundryOrder.totalCost)
    }
  }
}

function notify(laundryOrder: LaundryOrder, deliveryOrder: DeliveryOrder, laundryOperators: Operator[], customer: CustomerInfo) {
  
  let notification: Notification = {
    foreground: <LaundryOrderStatusChangeNotification>{
      status: laundryOrder.status,
      deliveryOrderStatus: deliveryOrder.status,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Laundry,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      orderId: laundryOrder.orderId
    },
    // todo @SanchitUke fix the background message based on Restaurant Order Status
    background: LaundryOrderStatusChangeMessages[laundryOrder.status],
    linkUrl: orderUrl(OrderType.Laundry, laundryOrder.orderId!)
  };

  switch (laundryOrder.status) {
    case LaundryOrderStatus.Delivered:
      laundryOperators.forEach((r) => {
        if (r.user) {
          pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.LaundryOperator, r.user.language);
        }
      });
    case LaundryOrderStatus.OtwPickupFromCustomer:
    case LaundryOrderStatus.AtLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      pushNotification(
        customer.firebaseId,
        notification,
        customer.notificationInfo,
        ParticipantType.Customer,
        customer.language
      );
      break;
    case LaundryOrderStatus.PickedUpFromCustomer:
    case LaundryOrderStatus.OtwPickupFromLaundry:
      laundryOperators.forEach((r) => {
        if (r.user) {
          pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.LaundryOperator, r.user.language);
        }
      });
      break;
    default:
      break;
  }
}
