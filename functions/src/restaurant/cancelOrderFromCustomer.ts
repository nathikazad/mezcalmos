import { isSignedIn } from "../shared/helper/authorizer";
import { orderInProcess, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
// import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
// import { capturePayment } from "../utilities/stripe/payment";
import { getRestaurantOrder } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { updateOrderStatus } from "../shared/graphql/restaurant/order/updateOrder"
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { OrderType } from "../shared/models/Generic/Order";
import { restaurantOrderStatusChangeMessages } from "./bgNotificationMessages";
import { orderUrl } from "../utilities/senders/appRoutes";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { getMezAdmins } from "../shared/graphql/restaurant/mezAdmin/getMezAdmins";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { RestaurantOperator } from "../shared/models/Services/Restaurant/Restaurant";
import { MezAdmin } from "../shared/models/Generic/User";
import { getDelivery } from "../shared/graphql/delivery/getDelivery";
import { Delivery } from "../shared/models/Generic/Delivery";

// Customer Canceling
export async function cancelOrderFromCustomer(userId: number, data: any) {

  let response: ServerResponse | undefined = isSignedIn(userId);
  if (response != undefined) {
    return response;
  }

  if (data.orderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected order id`,
      errorCode: "orderIdNotGiven"
    }
  }

  let mezAdminPromise = getMezAdmins();
  let order: RestaurantOrder = await getRestaurantOrder(data.orderId);
  let restaurantOperatorsPromise = getRestaurantOperators(order.restaurantId);
  let promiseResponse = await Promise.all([mezAdminPromise, restaurantOperatorsPromise]);
  let mezAdmins: MezAdmin[] = promiseResponse[0];
  let restaurantOperators: RestaurantOperator[] = promiseResponse[1];
  if (order == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }

  if (order.customerId != userId) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not belong to customer`,
      errorCode: "notCustomerOrder"
    }
  }

  if (!orderInProcess(order.status)) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order cannot be cancelled because it is not in process`,
      errorCode: "orderNotInProcess"
    }
  }

  switch (order.status) {
    case RestaurantOrderStatus.OrderReceived:
      // if (order.paymentType == PaymentType.Card) {
        // order = (await capturePayment(order, 0)) as RestaurantOrder
        // TODO: cancel delivery payment intent by capturing 0
      // }

      order.refundAmount = order.totalCost;
      // order.costToCustomer = order.totalCost - order.refundAmount;
      break;
    case RestaurantOrderStatus.PreparingOrder:
    case RestaurantOrderStatus.ReadyForPickup:
      // if (order.paymentType == PaymentType.Card) {
        // order = (await capturePayment(order, order.totalCost)) as RestaurantOrder
        // TODO: cancel delivery payment intent by capturing 0
      // }

      order.refundAmount = (order.refundAmount ?? 0) + order.deliveryCost;
      // order.costToCustomer = order.totalCost - order.refundAmount;
      break;
    // case RestaurantOrderStatus.OnTheWay:
    //   if (order.paymentType == PaymentType.Card) {
        // order = (await capturePayment(order)) as RestaurantOrder
        // TODO: capture delivery payment intent
      // }

      break;

    default:
      break;
  }


  order.status = RestaurantOrderStatus.CancelledByCustomer;
  // await finishOrder(order, orderId);

  // deliveryAdminNodes.deliveryAdmins().once('value', (snapshot) => {
  //   let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();

  //TODO
      // notifyOthersCancelledOrder(deliveryAdmins, orderId, order, restaurantOperators);
  //   });

  updateOrderStatus(order)
  
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
      pushNotification(m.user?.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
  });
  restaurantOperators.forEach((r) => {
    pushNotification(r.user?.firebaseId!, notification, r.notificationInfo, ParticipantType.RestaurantOperator);
  });
  if(order.deliveryId != undefined) {
    let delivery: Delivery = await getDelivery(order.deliveryId);
    if(delivery.deliverer != undefined) {
      notification.linkUrl = orderUrl(OrderType.Restaurant, order.orderId!);
      pushNotification(delivery.deliverer.user?.firebaseId!, 
        notification, 
        delivery.deliverer.notificationInfo,
        ParticipantType.DeliveryDriver,
        delivery.deliverer.user?.language,
      );
    }
  }
  
  return { status: ServerResponseStatus.Success, orderId: data.orderId }
};


// async function notifyOthersCancelledOrder(
//   deliveryAdmins: Record<string, DeliveryAdmin>,
//   orderId: string,
//   order: RestaurantOrder,
//   restaurantOperators: Record<string, boolean>) {

//   let notification: Notification = {
//     foreground: <RestaurantOrderStatusChangeNotification>{
//       status: RestaurantOrderStatus.CancelledByCustomer,
//       time: (new Date()).toISOString(),
//       notificationType: NotificationType.OrderStatusChange,
//       orderType: OrderType.Restaurant,
//       notificationAction: NotificationAction.ShowPopUp,
//       orderId: orderId
//     },
//     background: restaurantOrderStatusChangeMessages[RestaurantOrderStatus.CancelledByCustomer],
//     linkUrl: orderUrl(ParticipantType.DeliveryAdmin, OrderType.Restaurant, orderId)
//   }

//   for (let adminId in deliveryAdmins) {
//     pushNotification(adminId!, notification, ParticipantType.DeliveryAdmin);
//   }

//   for (let operatorId in restaurantOperators) {
//     pushNotification(operatorId, notification, ParticipantType.RestaurantOperator);
//   }

//   if (order.dropoffDriver) {
//     notification.linkUrl = orderUrl(ParticipantType.DeliveryDriver, OrderType.Restaurant, orderId)
//     pushNotification(order.dropoffDriver.id, notification, ParticipantType.DeliveryDriver);
//   }


// }