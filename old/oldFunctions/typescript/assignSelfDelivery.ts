import * as functions from "firebase-functions";

import * as restaurantNodes from "../../../functions/src/shared/databaseNodes/services/restaurant";
import * as customerNodes from "../../../functions/src/shared/databaseNodes/customer";
import * as laundryNodes from "../../../functions/src/shared/databaseNodes/services/laundry";
import * as rootNodes from "../../../functions/src/shared/databaseNodes/root";
import {
  BackgroundNotification,
  Notification,
  NotificationAction,
  NotificationType,
} from "../../../functions/src/shared/models/Notification";
import { pushNotification } from "../../../functions/src/utilities/senders/notifyUser";
import { checkRestaurantOperator } from "../../../functions/src/restaurant/helper";
import * as deliveryAdminNodes from "../../../functions/src/shared/databaseNodes/deliveryAdmin";

import {
  Language,
  ServerResponse,
  ServerResponseStatus,
} from "../../../functions/src/shared/models/Generic/Generic";
import { isSignedIn } from "../../../functions/src/shared/helper/authorizer";
import { OrderType } from "../../../functions/src/shared/models/Generic/Order";
import { DeliveryMode } from "../../../functions/src/shared/models/Services/Restaurant/RestaurantOrder";
import { ForegroundNotification } from "../../../functions/src/shared/models/Notification";
import { orderUrl } from "../../../functions/src/utilities/senders/appRoutes";
import { ParticipantType } from "../../../functions/src/shared/models/Generic/Chat";
import { DeliveryAdmin } from "../../../functions/src/shared/models/DeliveryAdmin";

export const changeDeliveryMode = functions.https.onCall(
  async (data, context) => {
    let response: ServerResponse | undefined = await isSignedIn(context.auth);
    if (response != undefined) {
      return {
        ok: false,
        error: response,
      };
    }
    let isOp = await checkRestaurantOperator(
      data.restaurantId,
      context.auth?.uid!
    );
    if (isOp != undefined) {
      return {
        ok: false,
        error: isOp,
      };
    }
    // response = await checkDeliveryAdmin(context.auth!.uid);
    // if (response != undefined) {
    //   return {
    //     ok: false,
    //     error: response,
    //   };
    // }

    if (
      !data.deliveryMode ||
      !data.orderId ||
      !data.customerId ||
      !data.restaurantId ||
      !data.orderType
    ) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage:
          "required parameters orderId and restaurantId and orderType,customerId,deliveryMode",
      };
    }
    await customerNodes
      .inProcessOrders(data.customerId, data.orderId)
      .child("deliveryMode")
      .set(data.deliveryMode);
    if (data.orderType == OrderType.Restaurant) {
      await restaurantNodes
        .inProcessOrders(data.restaurantId, data.orderId)
        .child("deliveryMode")
        .set(data.deliveryMode);
    } else if (data.orderType == OrderType.Laundry) {
      await laundryNodes
        .inProcessOrders(data.restaurantId, data.orderId)
        .child("deliveryMode")
        .set(data.deliveryMode);
    }
    await rootNodes
      .inProcessOrders(data.orderType, data.orderId)
      .child("deliveryMode")
      .set(data.deliveryMode);
    if (
      data.deliveryMode == DeliveryMode.ForwardedToMezCalmos ||
      data.deliveryMode == DeliveryMode.SelfDeliveryByRestaurant
    ) {
      // remove dropOffdriver //
      await _removeDropDriverAndSecondaryChats(data);
    }
    // push notif to admin
    if (data.deliveryMode == DeliveryMode.ForwardedToMezCalmos) {
      await notifyAdminsToAssignDriver(data);
    }
    return { status: ServerResponseStatus.Success };
  }
);

export const assignSelfDeliveryTime = functions.https.onCall(
  async (data, context) => {
    // check auth //
    let response: ServerResponse | undefined = await isSignedIn(context.auth);
    if (response != undefined) {
      return {
        ok: false,
        error: response,
      };
    }
    // check params //
    if (
      !data.time ||
      !data.orderId ||
      !data.customerId ||
      !data.restaurantId ||
      !data.orderType
    ) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage:
          "required parameters orderId and restaurantId and orderType,customerId,time",
      };
    }
    // check is operator
    let isOp = await checkRestaurantOperator(
      data.restaurantId,
      context.auth?.uid!
    );
    if (isOp != undefined) {
      return {
        ok: false,
        error: isOp,
      };
    }
    customerNodes
      .inProcessOrders(data.customerI, data.orderId)
      .child("selfDeliveryDetails/estDeliveryTime")
      .set(data.time);
    if (data.orderType == OrderType.Restaurant) {
      await restaurantNodes
        .inProcessOrders(data.restaurantId, data.orderId)
        .child("selfDeliveryDetails/estDeliveryTime")
        .set(data.time);
    } else if (data.orderType == OrderType.Laundry) {
      await laundryNodes
        .inProcessOrders(data.restaurantId, data.orderId)
        .child("selfDeliveryDetails/estDeliveryTime")
        .set(data.time);
    }
    rootNodes
      .inProcessOrders(data.orderType, data.orderId)
      .child("selfDeliveryDetails/estDeliveryTime")
      .set(data.time);

    return { status: ServerResponseStatus.Success };
  }
);

async function _removeDropDriverAndSecondaryChats(data: any) {
  await customerNodes
    .inProcessOrders(data.customerId, data.orderId)
    .child("dropoffDriver")
    .remove();
  await customerNodes
    .inProcessOrders(data.customerId, data.orderId)
    .child("secondaryChats")
    .remove();
  if (data.orderType == OrderType.Restaurant) {
    await restaurantNodes
      .inProcessOrders(data.restaurantId, data.orderId)
      .child("dropoffDriver")
      .remove();
    await restaurantNodes
      .inProcessOrders(data.restaurantId, data.orderId)
      .child("secondaryChats")
      .remove();
  } else if (data.orderType == OrderType.Laundry) {
    await laundryNodes
      .inProcessOrders(data.restaurantId, data.orderId)
      .child("dropoffDriver")
      .remove();
    await laundryNodes
      .inProcessOrders(data.restaurantId, data.orderId)
      .child("secondaryChats")
      .remove();
  }
  await rootNodes
    .inProcessOrders(data.orderType, data.orderId)
    .child("dropoffDriver")
    .remove();
  await rootNodes
    .inProcessOrders(data.orderType, data.orderId)
    .child("secondaryChats")
    .remove();
}
async function notifyAdminsToAssignDriver(data: any) {
  let notification: Notification = {
    foreground: <ForegroundNotification>{
      time: new Date().toISOString(),
      notificationType: NotificationType.AssignDriver,
      orderType: data.orderType,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: data.orderId,
    },
    background: <BackgroundNotification>{
      [Language.EN]: {
        title: "Assign a driver",
        body: "Delivery has been forwarded to mezcalmos, please assign a driver",
      },
      [Language.ES]: {
        title: "Asignar un controlador",
        body: "La entrega se ha enviado a Mezcalmos, por favor asigne un controlador",
      },
    },
    linkUrl: orderUrl(
      ParticipantType.DeliveryAdmin,
      data.orderType,
      data.orderId
    ),
  };
  // let notification: Notification = {
  //   foreground: <LaundryOrderStatusChangeNotification>{
  //     status: LaundryOrderStatus.CancelledByCustomer,
  //     time: (new Date()).toISOString(),
  //     notificationType: NotificationType.OrderStatusChange,
  //     orderType: OrderType.Laundry,
  //     notificationAction: NotificationAction.ShowPopUp,
  //     orderId: orderId
  //   },
  //   background: LaundryOrderStatusChangeMessages[LaundryOrderStatus.CancelledByCustomer],
  //   linkUrl: orderUrl(ParticipantType.DeliveryAdmin, OrderType.Laundry, orderId),

  // }
  deliveryAdminNodes.deliveryAdmins().once("value", (snapshot) => {
    let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
    for (let adminId in deliveryAdmins) {
      pushNotification(adminId!, notification, ParticipantType.DeliveryAdmin);
    }
  });

  // notification.linkUrl = orderUrl(ParticipantType.DeliveryDriver, OrderType.Laundry, orderId)
  // if (order.dropoffDriver)
  //   pushNotification(order.dropoffDriver.id, notification, ParticipantType.DeliveryDriver);
  // else if (order.pickupDriver)
  //   pushNotification(order.pickupDriver.id, notification, ParticipantType.DeliveryDriver);
}
