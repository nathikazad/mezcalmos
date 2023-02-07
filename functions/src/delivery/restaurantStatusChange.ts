import { OrderType, PaymentType } from "../shared/models/Generic/Order";
import { RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { orderUrl } from "../utilities/senders/appRoutes";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { DeliveryDriver, DeliveryOrder, DeliveryOrderStatus,  } from "../shared/models/Generic/Delivery";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { HttpsError } from "firebase-functions/v1/auth";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { getRestaurantOrder } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { CustomerInfo } from "../shared/models/Generic/User";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { updateRestaurantOrderStatus } from "../shared/graphql/restaurant/order/updateOrder";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { capturePayment, PaymentDetails } from "../utilities/stripe/payment";
import { restaurantOrderStatusChangeMessages } from "../restaurant/bgNotificationMessages";
import { Operator } from "../shared/models/Services/Service";

let statusArrayInSeq: Array<DeliveryOrderStatus> =
  [
    DeliveryOrderStatus.OrderReceived,
    DeliveryOrderStatus.PackageReady,
    DeliveryOrderStatus.AtPickup,
    DeliveryOrderStatus.OnTheWayToDropoff,
    DeliveryOrderStatus.AtDropoff,
    DeliveryOrderStatus.Delivered
  ]
export async function deliveryDriverAtPickup(userId: number, data: ChangeDeliveryStatusDetails) {
  await changeStatus(data, DeliveryOrderStatus.AtPickup, userId)
};
export async function startDelivery(userId: number, data: ChangeDeliveryStatusDetails) {
  await changeStatus(data, DeliveryOrderStatus.OnTheWayToDropoff, userId)
};
export async function deliveryDriverAtDropoff(userId: number, data: ChangeDeliveryStatusDetails) {
  await changeStatus(data, DeliveryOrderStatus.AtDropoff, userId)
};
export async function finishDelivery(userId: number, data: ChangeDeliveryStatusDetails) {
  await changeStatus(data, DeliveryOrderStatus.Delivered, userId)
};

function checkExpectedStatus(currentStatus: DeliveryOrderStatus, newStatus: DeliveryOrderStatus) {
  if ((newStatus == DeliveryOrderStatus.AtPickup)
    && (currentStatus != DeliveryOrderStatus.OrderReceived)
    && (currentStatus != DeliveryOrderStatus.PackageReady)
  ) {
    throw new HttpsError(
      "internal",
      "invalid delivery order status"
    );
  } else if (currentStatus != statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == newStatus) - 1]) {
    throw new HttpsError(
      "internal",
      "invalid delivery order status"
    );
  }
}

export interface ChangeDeliveryStatusDetails {
  deliveryId: number,
  deliveryDriverId: number,
  deliveryDriverType: ParticipantType,
  restaurantOrderId: number
}

async function changeStatus(
  changeDeliveryStatusDetails: ChangeDeliveryStatusDetails,
  newStatus: DeliveryOrderStatus,
  userId: number
) {

  let deliveryOrderPromise = getDeliveryOrder(changeDeliveryStatusDetails.deliveryId);
  let deliveryDriverPromise = getDeliveryDriver(changeDeliveryStatusDetails.deliveryDriverId, changeDeliveryStatusDetails.deliveryDriverType);
  let restaurantOrderPromise = getRestaurantOrder(changeDeliveryStatusDetails.restaurantOrderId);
  let promiseResponse = await Promise.all([deliveryOrderPromise, deliveryDriverPromise, restaurantOrderPromise]);
  let deliveryOrder: DeliveryOrder = promiseResponse[0];
  let deliveryDriver: DeliveryDriver = promiseResponse[1];
  let restaurantOrder: RestaurantOrder = promiseResponse[2];
  let restaurantOperators: Operator[] = await getRestaurantOperators(restaurantOrder.restaurantId);

  if (deliveryOrder.status == (DeliveryOrderStatus.Delivered
    || DeliveryOrderStatus.CancelledByCustomer
    || DeliveryOrderStatus.CancelledByDeliverer
    || DeliveryOrderStatus.CancelledByServiceProvider
  )) {
    throw new HttpsError(
      "internal",
      "delivery order is complete or cancelled"
    );
  }
  if (deliveryDriver.userId != userId) {
    throw new HttpsError(
      "internal",
      "invalid delivery driver user id"
    );
  }
  if (restaurantOrder.deliveryId != changeDeliveryStatusDetails.deliveryId) {
    throw new HttpsError(
      "internal",
      "restaurant order and delivery order do not match"
    );
  }
  let customer: CustomerInfo = await getCustomer(restaurantOrder.customerId);

  checkExpectedStatus(deliveryOrder.status, newStatus);

  deliveryOrder.status = newStatus;
  updateDeliveryOrderStatus(deliveryOrder);

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
      orderId: changeDeliveryStatusDetails.restaurantOrderId
    },
    // todo @SanchitUke fix the background message based on Restaurant Order Status
    background: restaurantOrderStatusChangeMessages[restaurantOrder.status],
    linkUrl: orderUrl(OrderType.Restaurant, changeDeliveryStatusDetails.restaurantOrderId)
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

  if (newStatus == DeliveryOrderStatus.Delivered) {
    if (restaurantOrder.paymentType == PaymentType.Card) {
      let paymentDetails: PaymentDetails = {
        orderId: changeDeliveryStatusDetails.restaurantOrderId,
        orderType: OrderType.Restaurant,
        serviceProviderId: restaurantOrder.restaurantId,
        orderStripePaymentInfo: restaurantOrder.stripeInfo!
      }
      capturePayment(paymentDetails, restaurantOrder.totalCost)
    }
  }
}