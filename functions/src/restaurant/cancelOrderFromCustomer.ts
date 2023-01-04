import { orderInProcess, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";
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
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmins";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { RestaurantOperator } from "../shared/models/Services/Restaurant/Restaurant";
import { MezAdmin } from "../shared/models/Generic/User";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Services/Delivery/DeliveryOrder";
import { HttpsError } from "firebase-functions/v1/auth";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";

// Customer Canceling
export async function cancelOrderFromCustomer(userId: number, data: any) {
  try {
    // let response: ServerResponse | undefined = isSignedIn(userId);
    // if (response != undefined) {
    //   return response;
    // }

    if (data.orderId == null) {
      throw new HttpsError(
        "internal", 
        `Expected order id`,
      );
    }

    let mezAdminPromise = getMezAdmins();
    console.log("[+] getMezAdmins " , mezAdminPromise);

    let order: RestaurantOrder = await getRestaurantOrder(data.orderId);
    console.log("[+] getRestaurantOrder " , order);

    let restaurantOperatorsPromise = getRestaurantOperators(order.restaurantId);
    console.log("[+] getRestaurantOperators " , restaurantOperatorsPromise);

    let deliveryPromise = getDeliveryOrder(order.deliveryId!);
    console.log("[+] getDeliveryOrder " , deliveryPromise);

    //delivery id assumed to be not null

    let promiseResponse = await Promise.all([mezAdminPromise, restaurantOperatorsPromise, deliveryPromise]);
    let mezAdmins: MezAdmin[] = promiseResponse[0];
    let restaurantOperators: RestaurantOperator[] = promiseResponse[1];
    let deliveryOrder: DeliveryOrder = promiseResponse[2];
    if (order == null) {
      throw new HttpsError(
        "internal",
        `Order does not exist`,
      );
    }

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
    deliveryOrder.status = DeliveryOrderStatus.CancelledByCustomer;
    updateDeliveryOrderStatus(deliveryOrder);
    
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
      let delivery: DeliveryOrder = await getDeliveryOrder(order.deliveryId);
      if(delivery.deliveryDriver != undefined) {
        notification.linkUrl = orderUrl(OrderType.Restaurant, order.orderId!);
        pushNotification(delivery.deliveryDriver.user?.firebaseId!, 
          notification, 
          delivery.deliveryDriver.notificationInfo,
          ParticipantType.DeliveryDriver,
          delivery.deliveryDriver.user?.language,
        );
      }
    }
    
    return { status: ServerResponseStatus.Success, orderId: data.orderId }
  } catch(error) {
    console.log("error =>", error);
    throw new HttpsError(
      "unknown",
      "Request was not authenticated.",
      error
    );
  }
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