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
import { pushChat, deleteChat } from "../shared/controllers/chatController";
import { buildChatForOrder, ChatObject, ParticipantType } from "../shared/models/Generic/Chat";
import * as chatController from "../shared/controllers/chatController";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { deliveryCancelOrderMessage, deliveryNewOrderMessage } from "./bgNotificationMessages";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { orderUrl } from "../utilities/senders/appRoutes";
import { LaundryOrder, LaundryOrderStatus } from "../shared/models/Services/Laundry/LaundryOrder";
import { RestaurantOrder, RestaurantOrderStatus } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { addServiceProviderOperatorsToChat, updateServiceProviderOrder } from "../shared/controllers/orderController";

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
  let deliveryDriverType: DeliveryDriverType = data.deliveryDriverType;
  let driverInfo: UserInfo = await getUserInfo(deliveryDriverId);
  let order: TwoWayDeliverableOrder = await getInProcessOrder(data.orderType, orderId);


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

  if (data.changeDriver) {
    let returnVal = removeOldDriver(deliveryDriverType, order, orderId);
    if (returnVal != null) return returnVal;
  }

  let serviceProviderDriverChatId: string = await pushChat();
  let customerDriverChatId: string = await pushChat();
  order.secondaryChats = order.secondaryChats ?? {};

  switch (deliveryDriverType) {
    case DeliveryDriverType.DropOff:
      if (order.dropoffDriver != null)
        return {
          status: ServerResponseStatus.Error,
          errorMessage: "dropoffDriver is already set"
        }
      order.dropoffDriver = driverInfo;
      order.secondaryChats.serviceProviderDropOffDriver = serviceProviderDriverChatId
      order.secondaryChats.customerDropOffDriver = customerDriverChatId
      break;
    case DeliveryDriverType.Pickup:
      if (order.pickupDriver != null)
        return {
          status: ServerResponseStatus.Error,
          errorMessage: "pickupDriver is already set"
        }
      order.pickupDriver = driverInfo;
      order.secondaryChats.serviceProviderPickupDriver = serviceProviderDriverChatId
      order.secondaryChats.customerPickupDriver = customerDriverChatId
      break;
  }

  customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
  rootNodes.inProcessOrders(data.orderType, orderId).update(order);
  deliveryDriverNodes.inProcessOrders(deliveryDriverId, orderId).update(order);


  updateServiceProviderOrder(orderId, order);

  let serviceProviderchat: ChatObject = await createServiceProviderChat(serviceProviderDriverChatId, data, orderId, driverInfo);
  addServiceProviderOperatorsToChat(orderId, order, serviceProviderchat, serviceProviderDriverChatId);

  await createCustomerChat(customerDriverChatId, data, orderId, driverInfo, order);

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

async function createServiceProviderChat(serviceProviderDriverChatId: string, data: any, orderId: string, driverInfo: UserInfo) {
  let serviceProviderchat: ChatObject = buildChatForOrder(serviceProviderDriverChatId, data.orderType, orderId);
  serviceProviderchat.addParticipant({
    ...driverInfo,
    particpantType: ParticipantType.DeliveryDriver
  });
  await chatController.setChat(serviceProviderDriverChatId, serviceProviderchat.chatData);

  deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
    let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
    chatController.addParticipantsToChat(Object.keys(deliveryAdmins), serviceProviderchat, serviceProviderDriverChatId, ParticipantType.DeliveryAdmin);
  });
  return serviceProviderchat;
}

async function createCustomerChat(customerDriverChatId: string, data: any, orderId: string, driverInfo: UserInfo, order: TwoWayDeliverableOrder) {
  let customerChat: ChatObject = buildChatForOrder(customerDriverChatId, data.orderType, orderId);
  customerChat.addParticipant({
    ...driverInfo,
    particpantType: ParticipantType.DeliveryDriver
  });
  customerChat.addParticipant({
    ...order.customer,
    particpantType: ParticipantType.Customer
  });
  await chatController.setChat(customerDriverChatId, customerChat.chatData);
}

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
      deleteChat(order.secondaryChats.serviceProviderDropOffDriver!);
      order.secondaryChats.serviceProviderDropOffDriver = null;
      deleteChat(order.secondaryChats.customerDropOffDriver!);
      order.secondaryChats.customerDropOffDriver = null;
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
      deleteChat(order.secondaryChats.serviceProviderPickupDriver!);
      order.secondaryChats.serviceProviderPickupDriver = null;
      deleteChat(order.secondaryChats.customerPickupDriver!);
      order.secondaryChats.customerPickupDriver = null;
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