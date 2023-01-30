import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ParticipantType } from "../../models/Generic/Chat";
import { DeliveryDriver, DeliveryOrder } from "../../models/Generic/Delivery";
import { CustomerInfo } from "../../models/Generic/User";
import { Restaurant } from "../../models/Services/Restaurant/Restaurant";
import { DeliveryType, RestaurantOrder } from "../../models/Services/Restaurant/RestaurantOrder";

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
            phoneNumber: restaurant.phoneNumber,
            participantType: ParticipantType.RestaurantOperator,
            parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
          },
          RestaurantApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            phoneNumber: customer.phoneNumber,
            participantType: ParticipantType.Customer,
            parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
          },
          MezAdminApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            phoneNumber: customer.phoneNumber,
            participantType: ParticipantType.Customer,
            parentLink: `/restaurantOrders/${restaurantOrder.orderId}`
          }
        }),
      }
    }, {
      id: true
    }]
  });
  if(restaurantOrder.deliveryType == DeliveryType.Delivery) {
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
              phoneNumber: customer.phoneNumber,
              participantType: ParticipantType.Customer,
              parentLink: `/Orders/${delivery.deliveryId}`
            },
            CustomerApp: {
              parentLink: `/RestaurantOrders/${restaurantOrder.orderId}`,
              participantType: ParticipantType.DeliveryDriver
            }
          })
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
              phoneNumber: restaurant.phoneNumber,
              participantType: ParticipantType.RestaurantOperator,
              parentLink: `/Orders/${delivery.deliveryId}`
            },
            RestaurantApp: {
              parentLink: `/RestaurantOrders/${restaurantOrder.orderId}`,
              participantType: ParticipantType.DeliveryDriver,
            }
          })
        }
      }, {
        id: true
      },]
    });
  }
  
}

export async function setDeliveryChatInfo(delivery: DeliveryOrder, deliveryDriver: DeliveryDriver) {
  let chain = getHasura();

  if(delivery.chatWithServiceProviderId == undefined) {
    throw new HttpsError(
      "internal",
      "No delivery chat with restaurant id"
    );
  }
  let response = await chain.query({
    chat_by_pk: [{
      id: delivery.chatWithCustomerId
    }, {
      chat_info: [{}, true]
    }]
  })
  let chatInfo = JSON.parse(response.chat_by_pk?.chat_info)
  chatInfo.CustomerApp = {
    ...chatInfo.CustomerApp,
    chatTitle: deliveryDriver.user?.name ?? "Delivery Driver",
    chatImage: deliveryDriver.user?.image,
    phoneNumber: deliveryDriver.user?.phoneNumber
  }
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: delivery.chatWithCustomerId
      },
      _set: {
        chat_info: JSON.stringify(chatInfo),
      } 
    }, {
      id: true
    }]
  });
  response = await chain.query({
    chat_by_pk: [{
      id: delivery.chatWithServiceProviderId
    }, {
      chat_info: [{}, true]
    }]
  })
  chatInfo = JSON.parse(response.chat_by_pk?.chat_info)
  chatInfo.RestaurantApp = {
    ...chatInfo.RestaurantApp,
    chatTitle: deliveryDriver.user?.name ?? "Delivery Driver",
    chatImage: deliveryDriver.user?.image,
    phoneNumber: deliveryDriver.user?.phoneNumber
  }
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: delivery.chatWithServiceProviderId
      },
      _set: {
        chat_info: JSON.stringify(chatInfo),
      }
    }, {
      id: true
    },]
  });
}


// TODO: @sanchit to remove
// export async function setUserAgoraInfo(chatId: number, userId: number, participantType: ParticipantType, agoraDetails: ParticipantAgoraDetails) {
//   let chain = getHasura();
//   let response = await chain.query({
//     chat_by_pk: [{
//       id: chatId
//     }, {
//       agora_info: [{}, true]
//     }]
//   });
//   if((!response.chat_by_pk)) {
//     throw new HttpsError(
//       "internal",
//       "Incorrect chat id"
//     );
//   }
//   let agoraInfo: Record<ParticipantType, Record<number, ParticipantAgoraDetails>> = {
//     [ParticipantType.Customer]: {},
//     [ParticipantType.DeliveryDriver]: {},
//     [ParticipantType.DeliveryOperator]: {},
//     [ParticipantType.LaundryOperator]: {},
//     [ParticipantType.MezAdmin]: {},
//     [ParticipantType.RestaurantOperator]: {},
//     [ParticipantType.Taxi]: {},
//   };
//   if(response.chat_by_pk.agora_info) {
//     agoraInfo = JSON.parse(response.chat_by_pk.agora_info);
//   }
//   agoraInfo[participantType][userId] = agoraDetails;
//   await chain.mutation({
//     update_chat_by_pk: [{
//       pk_columns: {
//         id: chatId
//       },
//       _set: {
//         agora_info: JSON.stringify(agoraInfo)
//       }
//     }, {
//       id: true,
//     }]
//   })
  
// }