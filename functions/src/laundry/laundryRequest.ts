// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");

// const hasura = new hasuraModule.Hasura(keys.hasura)

import * as functions from "firebase-functions";
import { constructLaundryOrder, ConstructLaundryOrderParameters, LaundryOrder, NewLaundryOrderNotification } from './models/LaundryOrder';
import { Chat, ChatType, ParticipantType } from "../shared/models/Chat";
import { OrderType } from "../shared/models/Order";
import { UserInfo } from "../shared/models/User";
import { ServerResponseStatus } from "../shared/models/Generic";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootNodes from "../shared/databaseNodes/root";
import { notifyDeliveryAdmins } from "../shared/notification/notifyDeliveryAdmin";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { isSignedIn } from "../shared/helper/authorizer";
import * as chatController from "../shared/controllers/chatController";
import { getUserInfo } from "../shared/controllers/rootController";
import { setChat } from "../shared/controllers/chatController";
import { NotificationAction, NotificationType } from "../shared/models/Notification";
import * as fcm from "../utilities/senders/fcm";

export = functions.https.onCall(async (data, context) => {
  let response = isSignedIn(context.auth)
  if (response != undefined)
    return response;

  let customerId: string = context.auth!.uid;
  let orderParams: ConstructLaundryOrderParameters = <ConstructLaundryOrderParameters>data;
  // TODO limit number of active orders
  // let customerCurrentOrders = (await customerNodes.inProcessOrders(customerId).once('value')).val();
  // if (customerCurrentOrders && customerCurrentOrders.length >= 3) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in laundry orders",
  //     errorCode: "alreadyInLaundryOrder"
  //   }
  // }


  let customerInfo: UserInfo = await getUserInfo(customerId);
  const order: LaundryOrder = constructLaundryOrder(orderParams);

  let orderId: string = (await customerNodes.inProcessOrders(customerId).push(order)).key!;
  rootNodes.inProcessOrders(OrderType.Laundry, orderId).set(order);

  let chat: Chat = {
    chatType: ChatType.Order,
    orderType: OrderType.Laundry,
    participants: {
      [customerId]: {
        ...customerInfo,
        particpantType: ParticipantType.Customer
      },
    }
  }
  await chatController.setChat(orderId, chat);

  deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
    let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
    addDeliveryAdminsToChat(deliveryAdmins, chat, orderId)
    notifyDeliveryAdminsNewOrder(deliveryAdmins, orderId)
  })

  return {
    status: ServerResponseStatus.Success,
    orderId: orderId
  }
})


async function addDeliveryAdminsToChat(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  chat: Chat,
  orderId: string) {
  for (var deliveryAdminId in deliveryAdmins) {
    var userInfo: UserInfo = await getUserInfo(deliveryAdminId);
    chat.participants[deliveryAdminId] = {
      ...userInfo,
      particpantType: ParticipantType.DeliveryAdmin
    }
  }

  setChat(orderId, chat);
}

async function notifyDeliveryAdminsNewOrder(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string) {
  let foregroundNotificaiton: NewLaundryOrderNotification = {
    time: (new Date()).toISOString(),
    notificationType: NotificationType.NewOrder,
    orderType: OrderType.Laundry,
    orderId: orderId,
    notificationAction: NotificationAction.ShowSnackBarAlways
  }

  let fcmNotification: fcm.fcmPayload = {
    token: [],
    payload: {
      notification: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de lavaderia`,
        tag: NotificationType.NewOrder
      }
    },
    options: {
      priority: fcm.NotificationPriority.High
    }
  };
  notifyDeliveryAdmins(deliveryAdmins, foregroundNotificaiton, fcmNotification);
}