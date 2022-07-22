// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");

// const hasura = new hasuraModule.Hasura(keys.hasura)

import * as functions from "firebase-functions";
import { constructLaundryOrder, ConstructLaundryOrderParameters, LaundryOrder, NewLaundryOrderNotification } from '../shared/models/Services/Laundry/LaundryOrder';
import { buildChatForOrder, ChatObject, ParticipantType } from "../shared/models/Generic/Chat";
import { OrderType } from "../shared/models/Generic/Order";
import { UserInfo } from "../shared/models/Generic/User";
import { Language, ServerResponseStatus } from "../shared/models/Generic/Generic";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootNodes from "../shared/databaseNodes/root";
import * as laundryNodes from "../shared/databaseNodes/services/laundry";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { isSignedIn } from "../shared/helper/authorizer";
import * as chatController from "../shared/controllers/chatController";
import { getUserInfo } from "../shared/controllers/rootController";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { orderUrl } from "../utilities/senders/appRoutes";
import { Laundry } from "../shared/models/Services/Laundry/Laundry";
import { getLaundry } from "./laundryController";
import { updateOrderIdAndFetchPaymentInfo } from "../utilities/stripe";
export = functions.https.onCall(async (data, context) => {
  let response = isSignedIn(context.auth)
  if (response != undefined)
    return response;

  let customerId: string = context.auth!.uid;
  if (!data.laundryId)
    return {
      status: "Error",
      errorMessage: "laundry id is not present",
      errorCode: "laundryIdNotPresent"
    }
  let laundry: Laundry = await getLaundry(data.laundryId);
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

  let transactionResponse = await customerNodes.lock(customerId).transaction(function (lock) {
    if (lock == true) {
      return
    } else {
      return true
    }
  })

  if (!transactionResponse.committed) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: 'Customer lock not available'
    }
  }

  try {
    let customerInfo: UserInfo = await getUserInfo(customerId);
    const order: LaundryOrder = constructLaundryOrder(orderParams, customerInfo, laundry.info);


    let orderId: string = (await customerNodes.inProcessOrders(customerId).push(null)).key!;

    if (data.stripePaymentId)
      await updateOrderIdAndFetchPaymentInfo(orderId, order, data.stripePaymentId)

    customerNodes.inProcessOrders(customerId, orderId).set(order);

    rootNodes.inProcessOrders(OrderType.Laundry, orderId).set(order);
    laundryNodes.inProcessOrders(laundry.info.id, orderId).set(order);


    let chat: ChatObject = buildChatForOrder(orderId, OrderType.Laundry);
    chat.addParticipant({
      ...customerInfo,
      particpantType: ParticipantType.Customer
    });

    chat.addParticipant({
      ...laundry.info,
      particpantType: ParticipantType.Laundry
    });

    await chatController.setChat(orderId, chat.chatData);


    deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
      let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
      chatController.addParticipantsToChat(Object.keys(deliveryAdmins), chat, orderId, ParticipantType.DeliveryAdmin)
      notifyParticipants(Object.keys(deliveryAdmins), orderId, ParticipantType.DeliveryAdmin)
    })

    laundryNodes.laundryOperators(data.laundryId).once('value').then((snapshot) => {
      if (snapshot.val() != null) {
        let laundryOperators: Record<string, boolean> = snapshot.val();
        chatController.addParticipantsToChat(Object.keys(laundryOperators), chat, orderId, ParticipantType.LaundryOperator)
        notifyParticipants(Object.keys(laundryOperators), orderId, ParticipantType.LaundryOperator)
      }
    })

    return {
      status: ServerResponseStatus.Success,
      orderId: orderId
    }
  } catch (e) {
    functions.logger.error(e);
    functions.logger.error(`Order request error ${customerId}`);
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order request error"
    }
  } finally {
    await customerNodes.lock(customerId).remove();
  }
})


async function notifyParticipants(participants: Array<string>,
  orderId: string, participantType: ParticipantType) {

  let notification: Notification = {
    foreground: <NewLaundryOrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: OrderType.Laundry,
      orderId: orderId,
      notificationAction: NotificationAction.ShowSnackBarAlways,
    },
    background: {
      [Language.ES]: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de lavaderia`
      },
      [Language.EN]: {
        title: "New Order",
        body: `There is a new laundry order`
      }
    },
    linkUrl: orderUrl(participantType, OrderType.Laundry, orderId)
  }

  for (let index in participants) {
    let participantId: string = participants[index]
    pushNotification(participantId, notification, participantType);
  }
}