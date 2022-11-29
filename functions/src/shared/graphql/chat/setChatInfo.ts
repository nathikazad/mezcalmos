import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { Delivery } from "../../models/Generic/Delivery";
import { CustomerInfo } from "../../models/Generic/User";
import { Restaurant } from "../../models/Services/Restaurant/Restaurant";
import { RestaurantOrder } from "../../models/Services/Restaurant/RestaurantOrder";

export async function setOrderChatInfo(restaurantOrder: RestaurantOrder, restaurant: Restaurant, delivery: Delivery, customer: CustomerInfo) {

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
            parentLink: `/RestaurantOrders/${restaurantOrder.orderId}`
          },
          RestaurantApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            parentLink: `/RestaurantOrders/${restaurantOrder.orderId}`
          },
          MezAdminApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            parentLink: `/RestaurantOrders/${restaurantOrder.orderId}`
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
          RestaurantApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            parentLink: `/RestaurantOrders/${restaurantOrder.orderId}`
          },
          DeliveryApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
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
            parentLink: `/RestaurantOrders/${restaurantOrder.orderId}`
          }
        }),
      }
    }, {
      id: true
    },]
  });
}