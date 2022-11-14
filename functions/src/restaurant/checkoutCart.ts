// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");

// const hasura = new hasuraModule.Hasura(keys.hasura)

import * as functions from "firebase-functions";
import { Cart } from '../shared/models/Services/Restaurant/Cart';
import { constructRestaurantOrder, NewRestaurantOrderNotification, RestaurantOrder, RestaurantOrderStatus } from '../shared/models/Services/Restaurant/RestaurantOrder';
import { buildChatForOrder, ChatObject, ParticipantType } from "../shared/models/Generic/Chat";
import { OrderType, PaymentType } from "../shared/models/Generic/Order";
import { Restaurant } from "../shared/models/Services/Restaurant/Restaurant";
import { UserInfo } from "../shared/models/Generic/User";
import { Language, Location, AppType, ServerResponseStatus } from "../shared/models/Generic/Generic";
import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootNodes from "../shared/databaseNodes/root";
import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
// import { isSignedIn } from "../shared/helper/authorizer";
import { getRestaurant } from "./restaurantController";
import { getUserInfo } from "../shared/controllers/rootController";
import * as chatController from "../shared/controllers/chatController";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { orderUrl } from "../utilities/senders/appRoutes";
import { updateOrderIdAndFetchPaymentInfo } from "../utilities/stripe/payment";
import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../utilities/hasura";

export interface CheckoutRequest {
  addressId: number;
  customerAppType: AppType,
  customerLocation: Location,
  deliveryCost: number,
  paymentType: PaymentType,
  notes: string,
  restaurantId: number,
  restaurantOrderType: 
}
export async function checkout(customerId: number, checkoutRequest: CheckoutRequest) {

  // TODO limit number of active orders
  // let customerCurrentOrder = (await firebase.database().ref(`/customers/${uid}/state/currentOrders`).once('value')).val();
  // if (customerCurrentOrder && Object.keys(customerCurrentOrder).length >= 3) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in three orders",
  //     errorCode: "inMoreThanThreeOrders"
  //   }
  // }


  let hasuraResponse = await getCheckoutHasuraInfo(checkoutRequest.restaurantId, customerId)


  if(hasuraResponse.restaurant_by_pk == undefined){
    throw new HttpsError(
			"internal",
			"Restaurant does not exist",
		);
  }
  if(hasuraResponse.restaurant_by_pk?.approved == false){
    throw new HttpsError(
			"internal",
			"Restaurant is not approved and taking orders right now",
		);
  }
  if(hasuraResponse.restaurant_by_pk?.open_status != "open"){
    throw new HttpsError(
			"internal",
			"Restaurant is closed",
		);
  }

  makeOrder()
  // try {
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

    // let chat: ChatObject = await buildChatForOrder(
    //   orderId,
    //   OrderType.Restaurant)
    // chat.addParticipant(
    //   {
    //     ...customerInfo,
    //     particpantType: ParticipantType.Customer
    //   });
    // chat.addParticipant(
    //   {
    //     ...restaurant.info,
    //     particpantType: ParticipantType.Restaurant
    //   });


    // await chatController.setChat(orderId, chat.chatData);

    // deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
    //   let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
    //   chatController.addParticipantsToChat(Object.keys(deliveryAdmins), chat, orderId, ParticipantType.DeliveryAdmin)
    //   notifyParticipants(Object.keys(deliveryAdmins), orderId, ParticipantType.DeliveryAdmin, restaurant.info)
    // })

    // restaurantNodes.restaurantOperators(cart.serviceProviderId).once('value').then((snapshot) => {
    //   if (snapshot.val() != null) {
    //     let restaurantOperators: Record<string, boolean> = snapshot.val();
    //     chatController.addParticipantsToChat(Object.keys(restaurantOperators), chat, orderId, ParticipantType.RestaurantOperator)
    //     notifyParticipants(Object.keys(restaurantOperators), orderId, ParticipantType.RestaurantOperator, restaurant.info)
    //   }
    // })

    // setTimeout(() => customerNodes.cart(customerId).remove(), 1000);
    // return {
    //   status: ServerResponseStatus.Success,
    //   orderId: orderId
    // }
  // } catch (e) {
  //   functions.logger.error(e);
  //   functions.logger.error(`Order request error ${customerId}`);
  //   return {
  //     status: ServerResponseStatus.Error,
  //     orderId: "Order request error"
  //   }
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


function getCheckoutHasuraInfo(restaurantId:number, customerId:number) {
  
  let chain = getHasura();
  let response = chain.query({
    restaurant_by_pk: [
      {id: restaurantId},
      {
        open_status:true,
        approved: true
      }
    ],
    customer_by_pk: [
      {
        user_id: customerId
      }, {
        cart: {
          items: [{},{
            cost_per_one: true,
            quantity: true,
            selected_options:[{}, true],
            restaurant_item_id: true
          }]
        }
      }
    ],
  })
  return response;
}

function makeOrder(checkoutRequest:CheckoutRequest, customerId:number) {
  let chain = getHasura();

  let response = chain.mutation({
    insert_restaurant_order_one: [{
      object: {
        customer_id: customerId,
        restaurant_id: checkoutRequest.restaurantId,
        customer_app_type: checkoutRequest.customerAppType,
        chat_id: ,
        delivery_cost: checkoutRequest.deliveryCost,
        delivery: {
          data: {

          }
        },
        payment_type: checkoutRequest.paymentType,
        order_time: ,
        to_location_gps: ,
        to_location_address: checkoutRequest.customerLocation.address,
        notes: checkoutRequest.notes,
        status: RestaurantOrderStatus.OrderReceieved,
        items: {
          data: {}
        },
        order_type: ,

      }
    }]
  })
  return response;
}