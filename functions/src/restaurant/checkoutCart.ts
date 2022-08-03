// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");

// const hasura = new hasuraModule.Hasura(keys.hasura)

import * as functions from "firebase-functions";
import { Cart } from '../shared/models/Services/Restaurant/Cart';
import { constructRestaurantOrder, NewRestaurantOrderNotification, RestaurantOrder } from '../shared/models/Services/Restaurant/RestaurantOrder';
import { buildChatForOrder, ChatObject, ParticipantType } from "../shared/models/Generic/Chat";
import { OrderType } from "../shared/models/Generic/Order";
import { Restaurant } from "../shared/models/Services/Restaurant/Restaurant";
import { UserInfo } from "../shared/models/Generic/User";
import { Language, ServerResponseStatus } from "../shared/models/Generic/Generic";
import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootNodes from "../shared/databaseNodes/root";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { isSignedIn } from "../shared/helper/authorizer";
import { getRestaurant } from "./restaurantController";
import { getUserInfo } from "../shared/controllers/rootController";
import * as chatController from "../shared/controllers/chatController";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { orderUrl } from "../utilities/senders/appRoutes";
import { updateOrderIdAndFetchPaymentInfo } from "../utilities/stripe/payment";

export = functions.https.onCall(async (data, context) => {

  let response = isSignedIn(context.auth)
  if (response != undefined)
    return response;

  let customerId: string = context.auth!.uid;
  let cart: Cart = <Cart>data;
  // TODO limit number of active orders
  // let customerCurrentOrder = (await firebase.database().ref(`/customers/${uid}/state/currentOrders`).once('value')).val();
  // if (customerCurrentOrder && Object.keys(customerCurrentOrder).length >= 3) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in three orders",
  //     errorCode: "inMoreThanThreeOrders"
  //   }
  // }

  let restaurant: Restaurant = await getRestaurant(cart.serviceProviderId);

  if (restaurant.state.open == false) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Restaurant is closed`,
      errorCode: "restaurantClosed"
    }
  }

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
    let order: RestaurantOrder = constructRestaurantOrder({
      cart: cart,
      customer: customerInfo,
      restaurant: restaurant.info,
      stripeFees: data.stripeFees ?? 0
    })

    let orderId: string = (await customerNodes.inProcessOrders(customerId).push(null)).key!;

    if (data.stripePaymentId) {
      order = (await updateOrderIdAndFetchPaymentInfo(orderId, order, data.stripePaymentId, data.stripeFees)) as RestaurantOrder
    }
    delete (order as any).stripePaymentId;
    delete (order as any).stripeFees;
    customerNodes.inProcessOrders(customerId, orderId).set(order);
    restaurantNodes.inProcessOrders(cart.serviceProviderId, orderId).set(order);
    rootNodes.inProcessOrders(OrderType.Restaurant, orderId).set(order);

    let chat: ChatObject = await buildChatForOrder(
      orderId,
      OrderType.Restaurant)
    chat.addParticipant(
      {
        ...customerInfo,
        particpantType: ParticipantType.Customer
      });
    chat.addParticipant(
      {
        ...restaurant.info,
        particpantType: ParticipantType.Restaurant
      });


    await chatController.setChat(orderId, chat.chatData);

    deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
      let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
      chatController.addParticipantsToChat(Object.keys(deliveryAdmins), chat, orderId, ParticipantType.DeliveryAdmin)
      notifyParticipants(Object.keys(deliveryAdmins), orderId, ParticipantType.DeliveryAdmin, restaurant.info)
    })

    restaurantNodes.restaurantOperators(cart.serviceProviderId).once('value').then((snapshot) => {
      if (snapshot.val() != null) {
        let restaurantOperators: Record<string, boolean> = snapshot.val();
        chatController.addParticipantsToChat(Object.keys(restaurantOperators), chat, orderId, ParticipantType.RestaurantOperator)
        notifyParticipants(Object.keys(restaurantOperators), orderId, ParticipantType.RestaurantOperator, restaurant.info)
      }
    })

    setTimeout(() => customerNodes.cart(customerId).remove(), 1000);
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
  orderId: string, participantType: ParticipantType, restaurant: UserInfo) {

  let notification: Notification = {
    foreground: <NewRestaurantOrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: OrderType.Restaurant,
      orderId: orderId,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      restaurant: restaurant
    },
    background: {
      [Language.ES]: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de alimento`
      },
      [Language.EN]: {
        title: "New Order",
        body: `There is a new restaurant order`
      }
    },
    linkUrl: orderUrl(participantType, OrderType.Restaurant, orderId)
  }

  for (let index in participants) {
    let participantId: string = participants[index]
    pushNotification(participantId, notification, participantType);
  }
}