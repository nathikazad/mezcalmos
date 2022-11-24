import * as functions from "firebase-functions";
import { OrderItem, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderType } from '../shared/models/Services/Restaurant/RestaurantOrder';
import { PaymentType } from "../shared/models/Generic/Order";
import { Location, AppType, ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { HttpsError } from "firebase-functions/v1/auth";
import { getRestaurant } from "../shared/graphql/restaurant/getRestaurant";
import { createRestaurantOrder } from "../shared/graphql/restaurant/order/createRestaurantOrder";
import { Restaurant } from "../shared/models/Services/Restaurant/Restaurant";
import { checkCart } from "../shared/graphql/restaurant/cart/checkCart";
import { clearCart } from "../shared/graphql/restaurant/cart/clearCart";
import { setOrderChatInfo } from "../shared/graphql/chat/setChatInfo";

export interface CheckoutRequest {
  customerAppType: AppType,
  customerLocation: Location,
  deliveryCost: number,
  paymentType: PaymentType,
  notes: string,
  restaurantId: number,
  restaurantOrderType: RestaurantOrderType,
  tripDistance: number,
  tripDuration: number,
  tripPolyline: string,
  estimatedFoodReadyTime: string,
  items: Array<OrderItem>
}

export async function checkout(customerId: number, checkoutRequest: CheckoutRequest): Promise<ServerResponse> {

  let restaurant: Restaurant = await getRestaurant(checkoutRequest.restaurantId);

  errorChecks(restaurant, checkoutRequest, customerId);

  let restaurantOrder: RestaurantOrder = {
    customerId,
    restaurantId: checkoutRequest.restaurantId,
    paymentType: checkoutRequest.paymentType,
    toLocation: checkoutRequest.customerLocation,
    estimatedFoodReadyTime: checkoutRequest.estimatedFoodReadyTime,
    status:RestaurantOrderStatus.OrderReceived,
    orderType: checkoutRequest.restaurantOrderType,
    customerAppType: checkoutRequest.customerAppType,
    items: checkoutRequest.items,
    deliveryCost: checkoutRequest.deliveryCost,
  }

  // let chain = getHasura();
  // let response = await getCheckoutDetails()

  try {
    // if (data.stripePaymentId) {
    //   order = (await updateOrderIdAndFetchPaymentInfo(orderId, order, data.stripePaymentId, data.stripeFees)) as RestaurantOrder
    // }

    let orderResponse = await createRestaurantOrder(restaurantOrder, restaurant);
    
    // clear user cart
    clearCart(customerId);

    setOrderChatInfo(restaurantOrder, restaurant, orderResponse.delivery);

    // setCustomerRestaurantChatInfo(orderResponse, orderId);
    // setCustomerDeliveryDriverChatInfo(orderResponse, orderId);
    // setRestaurantDeliveryDriverChatInfo(orderResponse, orderId);
    // notifyAdmins(response, orderId);

    return <ServerResponse> {
      status: ServerResponseStatus.Success
    }
  } catch (e) {
    functions.logger.error(e);
    functions.logger.error(`Order request error ${customerId}`);
    throw new HttpsError(
      "internal",
       (<Error>e).message
    )
  }


  // function setCustomerRestaurantChatInfo(orderResponse: { insert_restaurant_order_one: { id: number; chat_id: number; delivery: { chat_with_customer_id: number; chat_with_service_provider_id: number | undefined; } | undefined; } | undefined; delete_restaurant_cart_item: {} | undefined; delete_restaurant_cart_by_pk: {} | undefined; }, orderId: number) {
  //   chain.mutation({
  //     update_chat_by_pk: [{
  //       pk_columns: {
  //         id: orderResponse.insert_restaurant_order_one!.chat_id
  //       },
  //       _set: {
  //         chat_info: JSON.stringify({
  //           CustomerApp: {
  //             chatTitle: response.restaurant_by_pk!.name,
  //             chatImage: response.restaurant_by_pk!.image,
  //             parentLink: `/RestaurantOrders/${orderId}`
  //           },
  //           RestaurantApp: {
  //             chatTitle: response.customer_by_pk?.user.name ?? "Customer",
  //             chatImage: response.customer_by_pk?.user.image,
  //             parentLink: `/RestaurantOrders/${orderId}`
  //           },
  //           MezAdminApp: {
  //             chatTitle: response.customer_by_pk?.user.name ?? "Customer",
  //             chatImage: response.customer_by_pk?.user.image,
  //             parentLink: `/RestaurantOrders/${orderId}`
  //           },
  //         }),
  //       }
  //     }, {
  //       id: true
  //     },]
  //   });
  // }

  // function setCustomerDeliveryDriverChatInfo(orderResponse: { insert_restaurant_order_one: { id: number; chat_id: number; delivery: { chat_with_customer_id: number; chat_with_service_provider_id: number | undefined; } | undefined; } | undefined; delete_restaurant_cart_item: {} | undefined; delete_restaurant_cart_by_pk: {} | undefined; }, orderId: number) {
  //   chain.mutation({
  //     update_chat_by_pk: [{
  //       pk_columns: {
  //         id: orderResponse.insert_restaurant_order_one!.delivery!.chat_with_customer_id
  //       },
  //       _set: {
  //         chat_info: JSON.stringify({
  //           RestaurantApp: {
  //             chatTitle: response.customer_by_pk?.user.name ?? "Customer",
  //             chatImage: response.customer_by_pk?.user.image,
  //             parentLink: `/RestaurantOrders/${orderId}`
  //           },
  //           DeliveryApp: {
  //             chatTitle: response.customer_by_pk?.user.name ?? "Customer",
  //             chatImage: response.customer_by_pk?.user.image,
  //             parentLink: `/RestaurantOrders/${orderId}`
  //           }
  //         }),
  //       }
  //     }, {
  //       id: true
  //     },]
  //   });
  // }

  // function setRestaurantDeliveryDriverChatInfo(orderResponse: { insert_restaurant_order_one: { id: number; chat_id: number; delivery: { chat_with_customer_id: number; chat_with_service_provider_id: number | undefined; } | undefined; } | undefined; delete_restaurant_cart_item: {} | undefined; delete_restaurant_cart_by_pk: {} | undefined; }, orderId: number) {
  //   chain.mutation({
  //     update_chat_by_pk: [{
  //       pk_columns: {
  //         id: orderResponse.insert_restaurant_order_one!.delivery!.chat_with_service_provider_id!
  //       },
  //       _set: {
  //         chat_info: JSON.stringify({
  //           DeliveryApp: {
  //             chatTitle: response.restaurant_by_pk!.name,
  //             chatImage: response.restaurant_by_pk!.image,
  //             parentLink: `/RestaurantOrders/${orderId}`
  //           }
  //         }),
  //       }
  //     }, {
  //       id: true
  //     },]
  //   });
  // }

}
function errorChecks(restaurant: Restaurant, checkoutRequest: CheckoutRequest, customerId: number) {

  checkCart(customerId, restaurant.restaurantId);
  if(restaurant.approved == false) {
    throw new HttpsError(
      "internal",
      "Restaurant is not approved and taking orders right now"
    );
  }
  if(restaurant.openStatus != "open") {
    throw new HttpsError(
      "internal",
      "Restaurant is closed"
    );
  }
  if((checkoutRequest.items.length ?? 0) == 0) {
    throw new HttpsError(
      "internal",
      "Empty cart"
    );
  }
}


// function errorChecks(response: { restaurant_by_pk: { open_status: string; approved: boolean; location_gps: any; location_text: string; } | undefined; customer_by_pk: { cart: { restaurant_id: number | undefined; items: { cost_per_one: any; quantity: number; selected_options: any; restaurant_item_id: number; note: string | undefined; restaurant_item: { name: { translations: { language_id: string; value: string; }[]; }; description: { translations: { language_id: string; value: string; }[]; } | undefined; }; }[]; } | undefined; } | undefined; restaurant_operator: { id: number; }[]; }, checkoutRequest: CheckoutRequest) {
//   if (response.restaurant_by_pk == undefined) {
//     throw new HttpsError(
//       "internal",
//       "Restaurant does not exist"
//     );
//   }
//   if (response.restaurant_by_pk?.approved == false) {
//     throw new HttpsError(
//       "internal",
//       "Restaurant is not approved and taking orders right now"
//     );
//   }

//   if (response.restaurant_by_pk?.open_status != "open") {
//     throw new HttpsError(
//       "internal",
//       "Restaurant is closed"
//     );
//   }
//   if ((response.customer_by_pk?.cart?.items.length ?? 0) == 0) {
//     throw new HttpsError(
//       "internal",
//       "Empty cart"
//     );
//   }

//   if (response.customer_by_pk?.cart?.restaurant_id !== checkoutRequest.restaurantId) {
//     throw new HttpsError(
//       "internal",
//       "Restaurant id mismatch"
//     );
//   }
// }

// function notifyAdmins(response: { restaurant_by_pk: { open_status: string; approved: boolean; location_gps: any; location_text: string; name: string; image: string; } | undefined; customer_by_pk: { cart: { restaurant_id: number | undefined; items: { cost_per_one: any; quantity: number; selected_options: any; restaurant_item_id: number; note: string | undefined; restaurant_item: { name: { translations: { language_id: string; value: string; }[]; }; description: { translations: { language_id: string; value: string; }[]; } | undefined; }; }[]; } | undefined; user: { name: string | undefined; image: string | undefined; }; } | undefined; restaurant_operator: { id: number; notification_info: { token: string; app_type_id: string; }; }[]; mez_admin: { notification_info: { token: string; app_type_id: string; } | undefined; }[]; }, orderId: number) {
  

  // let notification: Notification = {
  //   foreground: <NewRestaurantOrderNotification>{
  //     time: (new Date()).toISOString(),
  //     notificationType: NotificationType.NewOrder,
  //     orderType: OrderType.Restaurant,
  //     orderId: orderId,
  //     notificationAction: NotificationAction.ShowSnackBarAlways,
  //     restaurant: restaurant
  //   },
  //   background: {
  //     [Language.ES]: {
  //       title: "Nueva Pedido",
  //       body: `Hay una nueva orden de alimento`
  //     },
  //     [Language.EN]: {
  //       title: "New Order",
  //       body: `There is a new restaurant order`
  //     }
  //   },
  //   linkUrl: orderUrl(participantType, OrderType.Restaurant, orderId)
  // }

  // for (let index in participants) {
  //   let participantId: string = participants[index]
  //   pushNotification(participantId, notification, participantType);
  // }

// }

