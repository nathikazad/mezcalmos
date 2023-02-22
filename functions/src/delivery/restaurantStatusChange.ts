import { OrderType, PaymentType } from "../shared/models/Generic/Order";
import { RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { orderUrl } from "../utilities/senders/appRoutes";
import { ParticipantType } from "../shared/models/Generic/Chat";
import {  DeliveryOrder, DeliveryOrderStatus,  } from "../shared/models/Generic/Delivery";
import { HttpsError } from "firebase-functions/v1/auth";
import { getRestaurantOrderFromDelivery } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { CustomerInfo } from "../shared/models/Generic/User";
import { updateRestaurantOrderStatus } from "../shared/graphql/restaurant/order/updateOrder";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { capturePayment, PaymentDetails } from "../utilities/stripe/payment";
import { restaurantOrderStatusChangeMessages } from "../restaurant/bgNotificationMessages";
import { ChangeDeliveryStatusDetails } from "./statusChange";
import { Operator } from "../shared/models/Services/Service";


export async function changeRestaurantOrderStatus(
  changeDeliveryStatusDetails: ChangeDeliveryStatusDetails,
  customer: CustomerInfo,
  deliveryOrder: DeliveryOrder
) {

  let restaurantOrder: RestaurantOrder = await getRestaurantOrderFromDelivery(changeDeliveryStatusDetails.deliveryOrderId);
  let restaurantOperators: Operator[] = await getRestaurantOperators(restaurantOrder.restaurantId);


  if (restaurantOrder.deliveryId != changeDeliveryStatusDetails.deliveryOrderId) {
    throw new HttpsError(
      "internal",
      "restaurant order and delivery order do not match"
    );
  }


  if (deliveryOrder.status == DeliveryOrderStatus.OnTheWayToDropoff) {
    restaurantOrder.status = RestaurantOrderStatus.OnTheWay;
    updateRestaurantOrderStatus(restaurantOrder);
  }
  if (deliveryOrder.status == DeliveryOrderStatus.Delivered) {
    restaurantOrder.status = RestaurantOrderStatus.Delivered;
    updateRestaurantOrderStatus(restaurantOrder);
  }
  let notification: Notification = {
    foreground: <RestaurantOrderStatusChangeNotification>{
      status: restaurantOrder.status,
      deliveryOrderStatus: deliveryOrder.status,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Restaurant,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      orderId: restaurantOrder.orderId
    },
    // todo @SanchitUke fix the background message based on Restaurant Order Status
    background: restaurantOrderStatusChangeMessages[restaurantOrder.status],
    linkUrl: orderUrl(OrderType.Restaurant, restaurantOrder.orderId!)
  }

  if (deliveryOrder.status == DeliveryOrderStatus.OnTheWayToDropoff
    || deliveryOrder.status == DeliveryOrderStatus.Delivered)
    pushNotification(
      customer.firebaseId,
      notification,
      customer.notificationInfo,
      ParticipantType.Customer,
      customer.language
    )

  if (deliveryOrder.status == DeliveryOrderStatus.AtPickup
    || deliveryOrder.status == DeliveryOrderStatus.Delivered) {
    restaurantOperators.forEach((r) => {
      if (r.user) {
        pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.RestaurantOperator, r.user.language);
      }
    })
  }

  if (changeDeliveryStatusDetails.newStatus == DeliveryOrderStatus.Delivered) {
    if (restaurantOrder.paymentType == PaymentType.Card) {
      let paymentDetails: PaymentDetails = {
        orderId: restaurantOrder.orderId!,
        serviceProviderDetailsId: restaurantOrder.spDetailsId,
        orderStripePaymentInfo: restaurantOrder.stripeInfo!
      }
      capturePayment(paymentDetails, restaurantOrder.totalCost)
    }
  }
}