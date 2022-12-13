import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { DeliveryDriver, DeliveryOrder } from "../../models/Services/Delivery/DeliveryOrder";
import { CustomerInfo } from "../../models/Generic/User";
import { Restaurant } from "../../models/Services/Restaurant/Restaurant";
import { RestaurantOrder } from "../../models/Services/Restaurant/RestaurantOrder";

export async function setOrderChatInfo(restaurantOrder: RestaurantOrder, restaurant: Restaurant, delivery: DeliveryOrder, customer: CustomerInfo) {

  if(restaurantOrder.chatId == undefined) {
    throw new HttpsError(
      "internal",
      "No chat id"
    );
  }
  if(delivery.chatWithServiceProviderId == undefined) {
    throw new HttpsError(
      "internal",
      "No delivery chat with restaurant id"
    );
  }
  let chain = getHasura();

  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: restaurantOrder.chatId,
      },
      _set: {
        chat_info: JSON.stringify({
          CustomerApp: {
            chatTitle: restaurant.name,
            chatImage: restaurant.image,
            parentLink: `/restaurantOrders/${restaurantOrder.orderId}`
          },
          RestaurantApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            parentLink: `/restaurantOrders/${restaurantOrder.orderId}`
          },
          MezAdminApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            parentLink: `/restaurantOrders/${restaurantOrder.orderId}`
          },
        }),
      }
    }, {
      id: true
    }]
  });
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: delivery.chatWithCustomerId
      },
      _set: {
        chat_info: JSON.stringify({
          DeliveryApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            parentLink: `/Orders/${restaurantOrder.deliveryId}`
          },
          RestaurantApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            parentLink: `/Orders/${restaurantOrder.deliveryId}`
          },
          CustomerApp: {
            parentLink: `/RestaurantOrders/${restaurantOrder.orderId}`
          }
        }),
      }
    }, {
      id: true
    },]
  });
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: delivery.chatWithServiceProviderId
      },
      _set: {
        chat_info: JSON.stringify({
          DeliveryApp: {
            chatTitle: restaurant.name,
            chatImage: restaurant.image,
            parentLink: `/Orders/${restaurantOrder.deliveryId}`
          },
          RestaurantApp: {
            parentLink: `/RestaurantOrders/${restaurantOrder.orderId}`
          }
        }),
      }
    }, {
      id: true
    },]
  });
}

export async function setDeliveryChatInfo(delivery: DeliveryOrder, deliveryDriver: DeliveryDriver) {
  let chain = getHasura();

  if(delivery.chatWithServiceProviderId == undefined) {
    throw new HttpsError(
      "internal",
      "No delivery chat with restaurant id"
    );
  }
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: delivery.chatWithCustomerId
      },
      _append: {
        chat_info: JSON.stringify({
          CustomerApp: {
            chatTitle: deliveryDriver.user?.name ?? "Delivery Driver",
            chatImage: deliveryDriver.user?.image,
          }
        }),
      } 
    }, {
      id: true
    }]
  });
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: delivery.chatWithServiceProviderId
      },
      _append: {
        chat_info: JSON.stringify({
          RestaurantApp: {
            chatTitle: deliveryDriver.user?.name ?? "Delivery Driver",
            chatImage: deliveryDriver.user?.image,
          }
        }),
      }
    }, {
      id: true
    },]
  });
}