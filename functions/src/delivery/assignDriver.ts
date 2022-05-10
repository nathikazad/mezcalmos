// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");

// const hasura = new hasuraModule.Hasura(keys.hasura)

import * as functions from "firebase-functions";
import { OrderType, TwoWayDeliverableOrder } from "../shared/models/Generic/Order";
import { UserInfo } from "../shared/models/Generic/User";
import { AuthorizationStatus, ServerResponseStatus } from "../shared/models/Generic/Generic";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import *  as rootNodes from "../shared/databaseNodes/root";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { getInProcessOrder, getUserInfo } from "../shared/controllers/rootController";
import { getDeliveryDriver } from "../shared/controllers/deliveryController";
import { CancelDeliveryOrderNotification, DeliveryDriver, DeliveryDriverType, NewDeliveryOrderNotification } from "../shared/models/Drivers/DeliveryDriver";
import { pushChat, deleteChat, addParticipantsToChat } from "../shared/controllers/chatController";
import { Chat, ChatType, ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { deliveryCancelOrderMessage, deliveryNewOrderMessage } from "./bgNotificationMessages";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { orderUrl } from "../utilities/senders/appRoutes";
import { LaundryOrder, LaundryOrderStatus } from "../shared/models/Services/Laundry/LaundryOrder";
import { RestaurantOrder, RestaurantOrderStatus } from "../shared/models/Services/Restaurant/RestaurantOrder";
import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as laundryNodes from "../shared/databaseNodes/services/laundry";

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


  let deliveryDriverType: DeliveryDriverType = data.deliveryDriverType;
  let driverInfo: UserInfo = await getUserInfo(deliveryDriverId);
  let order: TwoWayDeliverableOrder = await getInProcessOrder(data.orderType, orderId);

  if (order.serviceProviderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not have a service provider, call assign laundry first`,
      errorCode: "laundryDontExist"
    }
  }

  if (data.changeDriver) {
    let returnVal = removeOldDriver(deliveryDriverType, order, orderId);
    if (returnVal != null) return returnVal;
  }

  let chatId: string = await pushChat();
  order.secondaryChats = order.secondaryChats ?? {};
  switch (deliveryDriverType) {
    case DeliveryDriverType.DropOff:
      if (order.dropoffDriver != null)
        return {
          status: ServerResponseStatus.Error,
          errorMessage: "dropoffDriver is already set"
        }
      order.dropoffDriver = driverInfo;
      order.secondaryChats.deliveryAdminDropOffDriver = chatId
      break;
    case DeliveryDriverType.Pickup:
      if (order.pickupDriver != null)
        return {
          status: ServerResponseStatus.Error,
          errorMessage: "pickupDriver is already set"
        }
      order.pickupDriver = driverInfo;
      order.secondaryChats.deliveryAdminPickupDriver = chatId
      break;
  }

  customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
  rootNodes.inProcessOrders(data.orderType, orderId).update(order);
  deliveryDriverNodes.inProcessOrders(deliveryDriverId, orderId).update(order);

  if (order.orderType == OrderType.Restaurant) {
    let rOrder: RestaurantOrder = <RestaurantOrder>{ ...order }
    restaurantNodes.inProcessOrders(rOrder.restaurant.id!, orderId).update(order);
  } else if (order.orderType == OrderType.Laundry) {
    let lOrder: LaundryOrder = <LaundryOrder>{ ...order }
    laundryNodes.inProcessOrders(lOrder.laundry.id!, orderId).update(order);
  }

  let chat: Chat = {
    chatType: ChatType.Order,
    orderType: data.orderType,
    orderId: orderId,
    chatId: chatId,
    participants: {
      [deliveryDriverId]: {
        ...driverInfo,
        particpantType: ParticipantType.DeliveryDriver
      },
    }
  }

  deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
    let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
    addParticipantsToChat(Object.keys(deliveryAdmins), chat, chatId, ParticipantType.DeliveryAdmin)
  })

  laundryNodes.laundryOperators(order.serviceProviderId!).once('value').then((snapshot) => {
    let laundryOperators: Record<string, boolean> = snapshot.val();
    addParticipantsToChat(Object.keys(laundryOperators), chat, chatId, ParticipantType.LaundryOperator)
  })

  let notification: Notification = {
    foreground: <NewDeliveryOrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: data.orderType,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: orderId,
      deliveryDriverType: deliveryDriverType
    },
    background: deliveryNewOrderMessage,
    linkUrl: orderUrl(ParticipantType.DeliveryDriver, data.orderType, orderId)
  }

  pushNotification(deliveryDriverId, notification, ParticipantType.DeliveryDriver);


  return {
    status: ServerResponseStatus.Success,
  }
})

function removeOldDriver(deliveryDriverType: DeliveryDriverType, order: TwoWayDeliverableOrder, orderId: string) {
  let notification: Notification = {
    foreground: <CancelDeliveryOrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: order.orderType,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: orderId,
      deliveryDriverType: deliveryDriverType,
      status: order.orderType == OrderType.Laundry ? LaundryOrderStatus.CancelledByAdmin : RestaurantOrderStatus.CancelledByAdmin,
    },
    background: deliveryCancelOrderMessage,
    linkUrl: orderUrl(ParticipantType.DeliveryDriver, order.orderType, orderId)
  }
  switch (deliveryDriverType) {
    case DeliveryDriverType.DropOff:
      if (order.dropoffDriver == null)
        return {
          status: ServerResponseStatus.Error,
          errorMessage: "dropoffDriver is not set"
        }
      deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).remove();
      addCancelledOrderToPast(order.dropoffDriver.id, order, orderId);
      pushNotification(order.dropoffDriver.id, notification, ParticipantType.DeliveryDriver);
      delete order.dropoffDriver;
      deleteChat(order.secondaryChats.deliveryAdminDropOffDriver!);
      order.secondaryChats.deliveryAdminDropOffDriver = null;

      return null;
    case DeliveryDriverType.Pickup:
      if (order.pickupDriver == null)
        return {
          status: ServerResponseStatus.Error,
          errorMessage: "pickupDriver is not  set"
        }
      deliveryDriverNodes.inProcessOrders(order.pickupDriver.id, orderId).remove();
      addCancelledOrderToPast(order.pickupDriver.id, order, orderId);
      pushNotification(order.pickupDriver.id, notification, ParticipantType.DeliveryDriver);
      delete order.pickupDriver;
      deleteChat(order.secondaryChats.deliveryAdminPickupDriver!);
      order.secondaryChats.deliveryAdminPickupDriver = null;
      return null;
  }
}

function addCancelledOrderToPast(driverId: string, order: TwoWayDeliverableOrder, orderId: string) {
  if (order.orderType == OrderType.Restaurant) {
    let rOrder: RestaurantOrder = <RestaurantOrder>{ ...order }
    rOrder.status = RestaurantOrderStatus.CancelledByAdmin;
    deliveryDriverNodes.pastOrders(driverId, orderId).update(rOrder)
  } else if (order.orderType == OrderType.Laundry) {
    let lOrder: LaundryOrder = <LaundryOrder>{ ...order }
    lOrder.status = LaundryOrderStatus.CancelledByAdmin;
    deliveryDriverNodes.pastOrders(driverId, orderId).update(lOrder)
  }

}