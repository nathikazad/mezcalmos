// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");

// const hasura = new hasuraModule.Hasura(keys.hasura)

import * as functions from "firebase-functions";
import { Cart } from './models/Cart';
import { constructRestaurantOrder, RestaurantOrder } from './models/RestaurantOrder';
import { Chat, ChatType, ParticipantType } from "../shared/models/Chat";
import { OrderType } from "../shared/models/Order";
import { Restaurant } from "./models/Restaurant";
import { UserInfo } from "../shared/models/User";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic";
import * as restaurantNodes from "../shared/databaseNodes/restaurant";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { notifyDeliveryAdminsNewOrder } from "../shared/notification/notifyDeliveryAdmin";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";

export = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let response: ServerResponse = await checkoutCart(context.auth.uid, <Cart>data)
  return response
});


async function checkoutCart(uid: string, cart: Cart): Promise<ServerResponse> {
  // TODO limit number of active orders
  // let customerCurrentOrder = (await firebase.database().ref(`/customers/${uid}/state/currentOrders`).once('value')).val();
  // if (customerCurrentOrder && Object.keys(customerCurrentOrder).length >= 3) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in three orders",
  //     errorCode: "inMoreThanThreeOrders"
  //   }
  // }

  let restaurant: Restaurant = (await restaurantNodes.info(cart.serviceProviderId).once('value')).val();

  if (restaurant.state.open == false) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Restaurant is closed`,
      errorCode: "restaurantClosed"
    }
  }

  let customerInfo: UserInfo = (await rootDbNodes.userInfo(uid).once('value')).val();
  const order: RestaurantOrder = constructRestaurantOrder({
    cart: cart,
    customer: {
      id: uid,
      name: customerInfo.displayName.split(' ')[0],
      image: customerInfo.photo
    },
    restaurant: {
      id: cart.serviceProviderId,
      name: restaurant.details.name,
      image: restaurant.details.photo
    },
  })

  let orderRef = await customerNodes.inProcessOrders(uid).push(order);
  restaurantNodes.inProcessOrders(cart.serviceProviderId, orderRef.key!).set(order);
  rootDbNodes.inProcessOrders(OrderType.Restaurant, orderRef.key!).set(order);
  await customerNodes.cart(uid).remove();

  const deliveryAdmins: Record<string, DeliveryAdmin> = (await deliveryAdminNodes.deliveryAdmins().once('value')).val()
  setChat(customerInfo, uid, cart.serviceProviderId, restaurant, deliveryAdmins, orderRef.key!);
  notifyDeliveryAdminsNewOrder(deliveryAdmins, orderRef.key!, restaurant)
  let response: ServerResponse = {
    status: ServerResponseStatus.Success,
    orderId: orderRef.key
  }
  return response
}


async function setChat(
  customerInfo: UserInfo,
  customerId: string,
  restaurantId: string,
  restaurant: Restaurant,
  deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string): Promise<any> {
  let chat: Chat = {
    chatType: ChatType.Order,
    orderType: OrderType.Restaurant,
    participants: {
      [customerId]: {
        name: customerInfo.displayName.split(' ')[0],
        image: customerInfo.photo,
        particpantType: ParticipantType.Customer,
        language: customerInfo.language ? customerInfo.language : "en",
        phoneNumber: (customerInfo.phoneNumber) ? customerInfo.phoneNumber : undefined
      },
      [restaurantId]: {
        name: restaurant.details.name,
        image: restaurant.details.photo,
        particpantType: ParticipantType.Restaurant,
        language: restaurant.details.language ? restaurant.details.language : "en",
        phoneNumber: (restaurant.details.phoneNumber) ? restaurant.details.phoneNumber : undefined
      }
    }
  }

  for (var deliveryAdminId in deliveryAdmins) {
    var userInfo: UserInfo = (await rootDbNodes.userInfo(deliveryAdminId).once('value')).val();
    chat.participants[deliveryAdminId] = {
      name: userInfo.displayName,
      image: userInfo.photo,
      particpantType: ParticipantType.DeliveryAdmin,
      language: userInfo.language
    }
  }
  rootDbNodes.chat(orderId).set(chat);
}


