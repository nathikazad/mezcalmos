// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");

// const hasura = new hasuraModule.Hasura(keys.hasura)

import * as functions from "firebase-functions";
import { Cart } from './models/Cart';
import { constructRestaurantOrder, RestaurantOrder } from './models/RestaurantOrder';
import { Chat, ParticipantType } from "../shared/models/Chat";
import { OrderType } from "../shared/models/Order";
import { Restaurant } from "./models/Restaurant";
import { UserInfo } from "../shared/models/User";
import { ServerResponseStatus } from "../shared/models/Generic";
import * as restaurantNodes from "../shared/databaseNodes/restaurant";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootNodes from "../shared/databaseNodes/root";
import { notifyDeliveryAdminsNewOrder } from "../shared/notification/notifyDeliveryAdmin";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { buildChatForOrder } from "../shared/helper/chat";
import { isSignedIn } from "../shared/helper/authorizer";
import { getRestaurant } from "./restaurantController";
import { getUserInfo } from "../shared/controllers/rootController";
import { setChat } from "../shared/controllers/chatController";

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

  let customerInfo: UserInfo = await getUserInfo(customerId);
  const order: RestaurantOrder = constructRestaurantOrder({
    cart: cart,
    customer: customerInfo,
    restaurant: restaurant.info,
  })

  let orderId: string = (await customerNodes.inProcessOrders(customerId).push(order)).key!;
  restaurantNodes.inProcessOrders(cart.serviceProviderId, orderId).set(order);
  rootNodes.inProcessOrders(OrderType.Restaurant, orderId).set(order);
  await customerNodes.cart(customerId).remove();


  let chat: Chat = await buildChatForOrder(customerId,
    {
      ...customerInfo,
      particpantType: ParticipantType.Customer
    },
    cart.serviceProviderId,
    {
      ...restaurant.info,
      particpantType: ParticipantType.Restaurant
    },
    OrderType.Restaurant,
    orderId);

  deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
    let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
    addDeliveryAdminsToChat(deliveryAdmins, chat, orderId)
    notifyDeliveryAdminsNewOrder(deliveryAdmins, orderId, restaurant.info)
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