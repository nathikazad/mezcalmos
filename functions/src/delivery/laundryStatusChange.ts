import { OrderType, PaymentType } from "../shared/models/Generic/Order";
import { LaundryOrderStatus, LaundryOrder, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { DeliveryDirection, DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { CustomerInfo } from "../shared/models/Generic/User";
import { NotificationType, NotificationAction, Notification } from "../shared/models/Notification";
import { Operator, ServiceProvider } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { PaymentDetails, capturePayment } from "../utilities/stripe/payment";
import { getLaundryOrderFromDelivery } from "../shared/graphql/laundry/order/getLaundryOrder";
import { updateLaundryOrderStatus } from "../shared/graphql/laundry/order/updateOrder";
import { LaundryOrderStatusChangeMessages } from "../laundry/bgNotificationMessages";
import { getLaundryOperators } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { getLaundryStore } from "../shared/graphql/laundry/getLaundry";
import { createLaundryToCustomerDeliveryOrder } from "../shared/graphql/delivery/createDelivery";
import { setLaundryToCustomerDeliveryOrderChatInfo } from "../shared/graphql/chat/setChatInfo";
import { notifyDeliveryCompany } from "../shared/helper";


export async function changeLaundryOrderStatus(
  customer: CustomerInfo,
  deliveryOrder: DeliveryOrder
) {

  let laundryOrder: LaundryOrder = await getLaundryOrderFromDelivery(deliveryOrder);
  let laundryOperators: Operator[] = await getLaundryOperators(laundryOrder.storeId);

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
          let laundryStore: ServiceProvider = await getLaundryStore(laundryOrder.storeId);

          let toCustomerDeliveryOrder: DeliveryOrder = await createLaundryToCustomerDeliveryOrder(laundryOrder, laundryStore, deliveryOrder);
          setLaundryToCustomerDeliveryOrderChatInfo(laundryOrder, laundryStore, toCustomerDeliveryOrder, customer);

          if(laundryStore.deliveryDetails.selfDelivery == false)
            notifyDeliveryCompany(toCustomerDeliveryOrder);
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
        orderId: laundryOrder.orderId,
        serviceProviderDetailsId: laundryOrder.spDetailsId,
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
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Laundry,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      orderId: laundryOrder.orderId
    },
    // todo @SanchitUke fix the background message based on Restaurant Order Status
    background: LaundryOrderStatusChangeMessages[laundryOrder.status],
    linkUrl: orderUrl(OrderType.Laundry, laundryOrder.orderId)
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
