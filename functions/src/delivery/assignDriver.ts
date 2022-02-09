// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");

// const hasura = new hasuraModule.Hasura(keys.hasura)

import * as functions from "firebase-functions";
import { TwoWayDeliverableOrder } from "../shared/models/Generic/Order";
import { UserInfo } from "../shared/models/Generic/User";
import { AuthorizationStatus, ServerResponseStatus } from "../shared/models/Generic/Generic";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import *  as rootNodes from "../shared/databaseNodes/root";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { getInProcessOrder, getUserInfo } from "../shared/controllers/rootController";
import { getDeliveryDriver } from "../shared/controllers/deliveryController";
import { DeliveryDriver, DeliveryDriverType } from "../shared/models/Drivers/DeliveryDriver";
import { getChat, updateChat } from "../shared/controllers/chatController";
import { Chat, ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../shared/notification/notifyUser";
import { NewDeliveryOrderNotification } from "../shared/models/Notifications/DeliveryDriver";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Generic/Notification";
import { deliveryNewOrderMessage } from "./bgNotificationMessages";

export = functions.https.onCall(async (data, context) => {
  if (!data.orderId || !data.orderType || !data.deliveryDriverId || !data.deliveryDriverType) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Required orderId, orderType and deliveryDriverId"
    }
  }

  let response = isSignedIn(context.auth)
  if (response != undefined)
    return response;

  response = await checkDeliveryAdmin(context.auth!.uid)
  if (response != undefined) {
    return response;
  }

  let deliveryDriverId: string = data.deliveryDriverId;
  let orderId: string = data.orderId;
  let deliveryDriver: DeliveryDriver = (await getDeliveryDriver(deliveryDriverId));

  if (!deliveryDriver || !deliveryDriver.state ||
    deliveryDriver.state.authorizationStatus != AuthorizationStatus.Authorized) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "User is not an authorized driver"
    }
  }

  if (data.deliveryDriverType != DeliveryDriverType.Pickup
    && data.deliveryDriverType != DeliveryDriverType.DropOff) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Invalid delivery driver type"
    }
  }
  // let orderParams: ConstructLaundryOrderParameters = <ConstructLaundryOrderParameters>data;
  // TODO limit number of active orders
  // let deliveryDriverOrders = (await customerNodes.inProcessOrders(customerId).once('value')).val();
  // if (customerCurrentOrders && customerCurrentOrders.length >= 3) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in laundry orders",
  //     errorCode: "alreadyInLaundryOrder"
  //   }
  // }

  let deliveryDriverType: DeliveryDriverType = data.deliveryDriverType;
  let driverInfo: UserInfo = await getUserInfo(deliveryDriverId);
  let order: TwoWayDeliverableOrder = await getInProcessOrder(data.orderType, orderId);

  switch (deliveryDriverType) {
    case DeliveryDriverType.DropOff:
      order.dropoffDriver = driverInfo;
      break;
    case DeliveryDriverType.Pickup:
      order.pickupDriver = driverInfo;
      break;
  }

  customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
  rootNodes.inProcessOrders(data.orderType, orderId).update(order);
  deliveryDriverNodes.inProcessOrders(deliveryDriverId, orderId).update(order);

  let chat: Chat = await getChat(orderId)
  chat.participants[deliveryDriverId] = {
    ...driverInfo,
    particpantType: ParticipantType.DeliveryDriver
  }
  updateChat(orderId, chat);

  let notification: Notification = {
    foreground: <NewDeliveryOrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: data.orderType,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      orderId: orderId,
      deliveryDriverType: deliveryDriverType
    },
    background: deliveryNewOrderMessage
  }

  pushNotification(deliveryDriverId, notification);


  return {
    status: ServerResponseStatus.Success,
  }
})

