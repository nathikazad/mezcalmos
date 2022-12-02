import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { RestaurantOrder, RestaurantOrderStatus } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { orderUrl } from "../utilities/senders/appRoutes";
import { ParticipantType } from "../shared/models/Generic/Chat";
// import { capturePayment } from "../utilities/stripe/payment";
import { DeliveryDriver, DeliveryDriverType, DeliveryOrder, DeliveryOrderStatus, DeliveryOrderStatusChangeNotification } from "../shared/models/Services/Delivery/DeliveryOrder";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { getDeliveryDriver } from "../shared/graphql/delivery/getDeliveryDriver";
import { HttpsError } from "firebase-functions/v1/auth";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { getRestaurantOrder } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { deliveryOrderStatusChangeMessages } from "./bgNotificationMessages";
import { CustomerInfo } from "../shared/models/Generic/User";
import { getCustomer } from "../shared/graphql/restaurant/customer/getCustomer";
import { updateOrderStatus } from "../shared/graphql/restaurant/order/updateOrder";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { RestaurantOperator } from "../shared/models/Services/Restaurant/Restaurant";

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
  let response: ServerResponse = await changeStatus(data, DeliveryOrderStatus.AtPickup, userId)
  return response
};
export async function startDelivery(userId: number, data: ChangeDeliveryStatusDetails) {
  let response: ServerResponse = await changeStatus(data, DeliveryOrderStatus.OnTheWayToDropoff, userId)
  return response
};
export async function deliveryDriverAtDropoff(userId: number, data: ChangeDeliveryStatusDetails) {
  let response: ServerResponse = await changeStatus(data, DeliveryOrderStatus.AtDropoff, userId)
  return response
};
export async function finishDelivery(userId: number, data: ChangeDeliveryStatusDetails) {
  let response: ServerResponse = await changeStatus(data, DeliveryOrderStatus.Delivered, userId)
  return response
};


function checkExpectedStatus(currentStatus: DeliveryOrderStatus, newStatus: DeliveryOrderStatus) {
  if((newStatus == DeliveryOrderStatus.AtPickup) 
    && (currentStatus != DeliveryOrderStatus.OrderReceived)
    && (currentStatus != DeliveryOrderStatus.PackageReady)
  ) {
    throw new HttpsError(
      "internal",
      "invalid delivery order status"
    );
  } else if(currentStatus != statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == newStatus) - 1]) {
    throw new HttpsError(
      "internal",
      "invalid delivery order status"
    );
  }
}

export interface ChangeDeliveryStatusDetails {
  deliveryId: number,
  deliveryDriverId: number,
  deliveryDriverType: DeliveryDriverType,
  restaurantOrderId: number
}

async function changeStatus(
  changeDeliveryStatusDetails: ChangeDeliveryStatusDetails, 
  newStatus: DeliveryOrderStatus, 
  userId: number
): Promise<ServerResponse> {

  // let response = await isSignedIn(userId)
  // if (response != undefined) {
  //   return response;
  // }

  // if (changeDeliveryStatusDetails.deliveryId == null) {
  //   return {
  //     status: ServerResponseStatus.Error,
  //     errorMessage: `Expected order id`,
  //     errorCode: "orderIdNotGiven"
  //   }
  // }
  let deliveryOrderPromise = getDeliveryOrder(changeDeliveryStatusDetails.deliveryId);
  let deliveryDriverPromise = getDeliveryDriver(changeDeliveryStatusDetails.deliveryDriverId, changeDeliveryStatusDetails.deliveryDriverType);
  let restaurantOrderPromise = getRestaurantOrder(changeDeliveryStatusDetails.restaurantOrderId);
  let promiseResponse = await Promise.all([deliveryOrderPromise, deliveryDriverPromise, restaurantOrderPromise]);
  let deliveryOrder: DeliveryOrder = promiseResponse[0];
  let deliveryDriver: DeliveryDriver = promiseResponse[1];
  let restaurantOrder: RestaurantOrder = promiseResponse[2];
  let restaurantOperators: RestaurantOperator[] = await getRestaurantOperators(restaurantOrder.restaurantId);

  if(deliveryOrder.status == ( DeliveryOrderStatus.Delivered 
      || DeliveryOrderStatus.CancelledByCustomer
      || DeliveryOrderStatus.CancelledByDeliverer
      || DeliveryOrderStatus.CancelledByServiceProvider
  )) {
    throw new HttpsError(
      "internal",
      "delivery order is complete or cancelled"
    );
  }
  if(deliveryDriver.userId != userId) {
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

  if(deliveryOrder.status == DeliveryOrderStatus.OnTheWayToDropoff) {
    restaurantOrder.status = RestaurantOrderStatus.OnTheWay;
    updateOrderStatus(restaurantOrder);
  }
  if(deliveryOrder.status == DeliveryOrderStatus.Delivered) {
    restaurantOrder.status = RestaurantOrderStatus.Delivered;
    updateOrderStatus(restaurantOrder);
  }
  let notification: Notification = {
    foreground: <DeliveryOrderStatusChangeNotification>{
      status: newStatus,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Restaurant,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      orderId: changeDeliveryStatusDetails.restaurantOrderId
    },
    background: deliveryOrderStatusChangeMessages[newStatus],
    linkUrl: orderUrl(OrderType.Restaurant, changeDeliveryStatusDetails.restaurantOrderId)
  }
  pushNotification(
    customer.firebaseId, 
    notification, 
    customer.notificationInfo, 
    ParticipantType.Customer, 
    customer.language
  ).then(() => {
    restaurantOperators.forEach((r) => {
      if(r.user) {
        pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.RestaurantOperator);
      }
    })
  });
  // if (newStatus == RestaurantOrderStatus.Delivered) {
  //   if (order.paymentType == PaymentType.Card) {
  //     order = (await capturePayment(order, order.costToCustomer)) as RestaurantOrder
  //     TODO: capture shipping payment
  //   }
  // }

  return { status: ServerResponseStatus.Success }
}