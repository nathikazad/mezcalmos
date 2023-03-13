import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ParticipantType } from "../../models/Generic/Chat";
import { DeliveryDriver, DeliveryOrder } from "../../models/Generic/Delivery";
import { MezError } from "../../models/Generic/Generic";
import { DeliveryType, OrderType } from "../../models/Generic/Order";
import { CustomerInfo } from "../../models/Generic/User";
import { LaundryOrder } from "../../models/Services/Laundry/LaundryOrder";
import { RestaurantOrder } from "../../models/Services/Restaurant/RestaurantOrder";
import { ServiceProvider } from "../../models/Services/Service";

export async function setRestaurantOrderChatInfo(restaurantOrder: RestaurantOrder, restaurant: ServiceProvider, delivery: DeliveryOrder, customer: CustomerInfo) {

  if(restaurantOrder.chatId == undefined) {
    throw new MezError("noChatId");
  }
  if(delivery.chatWithServiceProviderId == undefined) {
    throw new MezError("noRestaurantDeliveryChatId");
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
              parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
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
              parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
              participantType: ParticipantType.DeliveryDriver,
            },
            MezAdminApp: {
              parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
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

export async function setLaundryOrderChatInfo(
  laundryOrder: LaundryOrder, 
  laundryStore: ServiceProvider, 
  fromCustomerDelivery: DeliveryOrder,
  customer: CustomerInfo
) {
  if(laundryOrder.chatId == undefined) {
    throw new HttpsError(
      "internal",
      "No chat id"
    );
  }
  
  let chain = getHasura();
  
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: laundryOrder.chatId,
      },
      _set: {
        chat_info: JSON.stringify({
          CustomerApp: {
            chatTitle: laundryStore.name,
            chatImage: laundryStore.image,
            phoneNumber: laundryStore.phoneNumber,
            participantType: ParticipantType.LaundryOperator,
            parentLink: `/laundryOrders/${laundryOrder.orderId}`,
          },
          LaundryApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            phoneNumber: customer.phoneNumber,
            participantType: ParticipantType.Customer,
            parentLink: `/laundryOrders/${laundryOrder.orderId}`,
          },
          MezAdminApp: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
            phoneNumber: customer.phoneNumber,
            participantType: ParticipantType.Customer,
            parentLink: `/laundryOrders/${laundryOrder.orderId}`
          }
        }),
      }
    }, {
      id: true
    }]
  });
  if(laundryOrder.deliveryType == DeliveryType.Delivery) {
    
    if(fromCustomerDelivery.chatWithServiceProviderId == undefined) {
      throw new HttpsError(
        "internal",
        "No delivery chat with store id"
      );
    }
    let chatInfo: any = {
      DeliveryApp: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/Orders/${fromCustomerDelivery.deliveryId}`
      },
      CustomerApp: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver
      }
    }

    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: fromCustomerDelivery.chatWithCustomerId
        },
        _set: {
          chat_info: JSON.stringify(chatInfo)
        }
      }, {
        id: true
      },]
    });

    chatInfo = {
      DeliveryApp: {
        chatTitle: laundryStore.name,
        chatImage: laundryStore.image,
        phoneNumber: laundryStore.phoneNumber,
        participantType: ParticipantType.LaundryOperator,
        parentLink: `/Orders/${fromCustomerDelivery.deliveryId}`
      },
      LaundryApp: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver,
      },
      MezAdminApp: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver,
      }
    }

    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: fromCustomerDelivery.chatWithServiceProviderId
        },
        _set: {
          chat_info: JSON.stringify(chatInfo)
        }
      }, {
        id: true
      },]
    });
  }
}
export async function setLaundryToCustomerDeliveryOrderChatInfo(
  laundryOrder: LaundryOrder, 
  laundryStore: ServiceProvider, 
  toCustomerDelivery: DeliveryOrder,
  customer: CustomerInfo
) {
  let chain = getHasura();
    
    if(toCustomerDelivery.chatWithServiceProviderId == undefined) {
      throw new MezError("noDeliveryChatWithStoreId");
    }
    let chatInfo: any = {
      DeliveryApp: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/Orders/${toCustomerDelivery.deliveryId}`
      },
      CustomerApp: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver
      }
    }

    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: toCustomerDelivery.chatWithCustomerId
        },
        _set: {
          chat_info: JSON.stringify(chatInfo)
        }
      }, {
        id: true
      },]
    });

    chatInfo = {
      DeliveryApp: {
        chatTitle: laundryStore.name,
        chatImage: laundryStore.image,
        phoneNumber: laundryStore.phoneNumber,
        participantType: ParticipantType.LaundryOperator,
        parentLink: `/Orders/${toCustomerDelivery.deliveryId}`
      },
      LaundryApp: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver,
      },
      MezAdminApp: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver,
      }
    }

    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: toCustomerDelivery.chatWithServiceProviderId
        },
        _set: {
          chat_info: JSON.stringify(chatInfo)
        }
      }, {
        id: true
      },]
    });
}


export async function setDeliveryChatInfo(delivery: DeliveryOrder, deliveryDriver: DeliveryDriver, orderType: OrderType) {
  let chain = getHasura();

  if(delivery.chatWithServiceProviderId == undefined) {
    throw new MezError("serviceProviderDeliveryChatNotFound");
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
  
  switch (orderType) {
    case OrderType.Restaurant:
      chatInfo.RestaurantApp = {
        ...chatInfo.RestaurantApp,
        chatTitle: deliveryDriver.user?.name ?? "Delivery Driver",
        chatImage: deliveryDriver.user?.image,
        phoneNumber: deliveryDriver.user?.phoneNumber
      }
      break;
    case OrderType.Laundry:
        chatInfo.LaundryApp = {
          ...chatInfo.LaundryApp,
          chatTitle: deliveryDriver.user?.name ?? "Delivery Driver",
          chatImage: deliveryDriver.user?.image,
          phoneNumber: deliveryDriver.user?.phoneNumber
        }
        break;
    default:
      break;
  }
  chatInfo.MezAdminApp = {
    ...chatInfo.MezAdminApp,
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