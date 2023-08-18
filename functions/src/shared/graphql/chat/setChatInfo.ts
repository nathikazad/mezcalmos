import { $ } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { getHasura } from "../../../utilities/hasura";
import { ChatInfoAppName, ParticipantType } from "../../models/Generic/Chat";
import { DeliveryDriver, DeliveryOrder } from "../../models/Generic/Delivery";
import { MezError } from "../../models/Generic/Generic";
import { DeliveryType, OrderType } from "../../models/Generic/Order";
import { CustomerInfo } from "../../models/Generic/User";
import { Business } from "../../models/Services/Business/Business";
import { BusinessOrder } from "../../models/Services/Business/BusinessOrder";
import { CourierOrder } from "../../models/Services/Courier/Courier";
import { LaundryOrder } from "../../models/Services/Laundry/LaundryOrder";
import { RestaurantOrder } from "../../models/Services/Restaurant/RestaurantOrder";
import { ServiceProvider } from "../../models/Services/Service";
import { TaxiDriver } from "../../models/Services/Taxi/Taxi";
import { TaxiOrder } from "../../models/Services/Taxi/TaxiOrder";

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
        chat_info: $`chat_info`,
      }
    }, {
      id: true
    }]
  }, {
    "chat_info": {
      [ChatInfoAppName.CustomerApp]: {
        chatTitle: restaurant.name,
        chatImage: restaurant.image,
        phoneNumber: restaurant.phoneNumber,
        participantType: ParticipantType.RestaurantOperator,
        parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
      },
      [ChatInfoAppName.RestaurantApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
      },
      [ChatInfoAppName.MezAdminApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/restaurantOrders/${restaurantOrder.orderId}`
      }
    }
  });
  if(restaurantOrder.deliveryType == DeliveryType.Delivery) {
    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: delivery.chatWithCustomerId
        },
        _set: {
          chat_info: $`chat_info`
        }
      }, {
        id: true
      },]
    }, {
      "chat_info": {
        [ChatInfoAppName.DeliveryApp]: {
          chatTitle: customer.name ?? "Customer",
          chatImage: customer.image,
          phoneNumber: customer.phoneNumber,
          participantType: ParticipantType.Customer,
          parentLink: `/orders/${delivery.deliveryId}`
        },
        [ChatInfoAppName.CustomerApp]: {
          parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
          participantType: ParticipantType.DeliveryDriver
        },
        [ChatInfoAppName.MezAdminApp]: {
          chatTitle: customer.name ?? "Customer",
          chatImage: customer.image,
          phoneNumber: customer.phoneNumber,
          participantType: ParticipantType.Customer,
          parentLink: `/restaurantOrders/${restaurantOrder.orderId}`
        }
      }
    });
    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: delivery.chatWithServiceProviderId
        },
        _set: {
          chat_info: $`chat_info`
        }
      }, {
        id: true
      },]
    }, {
      "chat_info": {
        [ChatInfoAppName.DeliveryApp]: {
          chatTitle: restaurant.name,
          chatImage: restaurant.image,
          phoneNumber: restaurant.phoneNumber,
          participantType: ParticipantType.RestaurantOperator,
          parentLink: `/orders/${delivery.deliveryId}`
        },
        [ChatInfoAppName.RestaurantApp]: {
          parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
          participantType: ParticipantType.DeliveryDriver,
        },
        [ChatInfoAppName.MezAdminApp]: {
          chatTitle: restaurant.name,
          chatImage: restaurant.image,
          phoneNumber: restaurant.phoneNumber,
          participantType: ParticipantType.RestaurantOperator,
          parentLink: `/restaurantOrders/${restaurantOrder.orderId}`,
        }
      }
    });
  }
  
}

export async function setLaundryOrderChatInfo(
  laundryOrder: LaundryOrder, 
  laundryStore: ServiceProvider, 
  fromCustomerDelivery: DeliveryOrder,
  customer: CustomerInfo
) {
  
  let chain = getHasura();
  
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: laundryOrder.chatId!,
      },
      _set: {
        chat_info: $`chat_info`,
      }
    }, {
      id: true
    }]
  }, {
    "chat_info": {
      [ChatInfoAppName.CustomerApp]: {
        chatTitle: laundryStore.name,
        chatImage: laundryStore.image,
        phoneNumber: laundryStore.phoneNumber,
        participantType: ParticipantType.LaundryOperator,
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
      },
      [ChatInfoAppName.LaundryApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
      },
      [ChatInfoAppName.MezAdminApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/laundryOrders/${laundryOrder.orderId}`
      }
    }
  });
  if(laundryOrder.deliveryType == DeliveryType.Delivery) {
    
    let chatInfo: any = {
      [ChatInfoAppName.DeliveryApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/orders/${fromCustomerDelivery.deliveryId}`
      },
      [ChatInfoAppName.CustomerApp]: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver
      },
      [ChatInfoAppName.MezAdminApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
      },
    }

    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: fromCustomerDelivery.chatWithCustomerId
        },
        _set: {
          chat_info: $`chat_info`
        }
      }, {
        id: true
      },]
    }, {
      "chat_info": chatInfo
    });

    chatInfo = {
      [ChatInfoAppName.DeliveryApp]: {
        chatTitle: laundryStore.name,
        chatImage: laundryStore.image,
        phoneNumber: laundryStore.phoneNumber,
        participantType: ParticipantType.LaundryOperator,
        parentLink: `/orders/${fromCustomerDelivery.deliveryId}`
      },
      [ChatInfoAppName.LaundryApp]: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver,
      },
      [ChatInfoAppName.MezAdminApp]: {
        chatTitle: laundryStore.name,
        chatImage: laundryStore.image,
        phoneNumber: laundryStore.phoneNumber,
        participantType: ParticipantType.LaundryOperator,
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
      }
    }

    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: fromCustomerDelivery.chatWithServiceProviderId!
        },
        _set: {
          chat_info: $`chat_info`
        }
      }, {
        id: true
      },]
    }, {
      "chat_info": chatInfo
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
      [ChatInfoAppName.DeliveryApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/orders/${toCustomerDelivery.deliveryId}`
      },
      [ChatInfoAppName.CustomerApp]: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver
      },
      [ChatInfoAppName.MezAdminApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
      },
    }

    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: toCustomerDelivery.chatWithCustomerId
        },
        _set: {
          chat_info: $`chat_info`
        }
      }, {
        id: true
      },]
    }, {
      "chat_info": chatInfo
    });

    chatInfo = {
      [ChatInfoAppName.DeliveryApp]: {
        chatTitle: laundryStore.name,
        chatImage: laundryStore.image,
        phoneNumber: laundryStore.phoneNumber,
        participantType: ParticipantType.LaundryOperator,
        parentLink: `/orders/${toCustomerDelivery.deliveryId}`
      },
      [ChatInfoAppName.LaundryApp]: {
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
        participantType: ParticipantType.DeliveryDriver,
      },
      [ChatInfoAppName.MezAdminApp]: {
        chatTitle: laundryStore.name,
        chatImage: laundryStore.image,
        phoneNumber: laundryStore.phoneNumber,
        participantType: ParticipantType.LaundryOperator,
        parentLink: `/laundryOrders/${laundryOrder.orderId}`,
      }
    }

    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: toCustomerDelivery.chatWithServiceProviderId
        },
        _set: {
          chat_info: $`chat_info`
        }
      }, {
        id: true
      },]
    }, {
      "chat_info": chatInfo
    });
}


export async function setDeliveryChatInfo(delivery: DeliveryOrder, deliveryDriver: DeliveryDriver, orderType: OrderType) {
  let chain = getHasura();

  if((orderType != OrderType.Courier) && delivery.chatWithServiceProviderId == undefined) {
    throw new MezError("serviceProviderDeliveryChatNotFound");
  }
  let response = await chain.query({
    chat_by_pk: [{
      id: delivery.chatWithCustomerId
    }, {
      chat_info: [{}, true]
    }]
  })
  let chatInfo = (response.chat_by_pk?.chat_info)
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
        chat_info: $`chat_info`,
      } 
    }, {
      id: true
    }]
  }, {
    "chat_info": chatInfo
  });

  if(orderType == OrderType.Courier) 
    return;

  response = await chain.query({
    chat_by_pk: [{
      id: delivery.chatWithServiceProviderId!
    }, {
      chat_info: [{}, true]
    }]
  })
  chatInfo = (response.chat_by_pk?.chat_info)
  
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
  // chatInfo.MezAdminApp = {
  //   ...chatInfo.MezAdminApp,
  //   chatTitle: deliveryDriver.user?.name ?? "Delivery Driver",
  //   chatImage: deliveryDriver.user?.image,
  //   phoneNumber: deliveryDriver.user?.phoneNumber
  // }
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: delivery.chatWithServiceProviderId!
      },
      _set: {
        chat_info: $`chat_info`,
      }
    }, {
      id: true
    },]
  }, {
    "chat_info": chatInfo
  });
}

export async function setCourierChatInfo(courierOrder: CourierOrder, customer: CustomerInfo) {

  let chain = getHasura();
  
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: courierOrder.deliveryOrder.chatWithCustomerId
      },
      _set: {
        chat_info: $`chat_info`
      }
    }, {
      id: true
    },]
  }, {
    "chat_info": {
      [ChatInfoAppName.DeliveryApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/orders/${courierOrder.deliveryOrder.deliveryId}`
      },
      [ChatInfoAppName.CustomerApp]: {
        parentLink: `/courierOrders/${courierOrder.id}`,
        participantType: ParticipantType.DeliveryDriver
      },
      [ChatInfoAppName.MezAdminApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/courierOrders/${courierOrder.id}`
      }
    }
  });
  
}

export async function setBusinessOrderRequestChatInfo(
  order: BusinessOrder,
  business: Business,
  customer: CustomerInfo
) {
  
  let chain = getHasura();
  
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: order.chatId!,
      },
      _set: {
        chat_info: $`chat_info`,
      }
    }, {
      id: true
    }]
  }, {
    "chat_info": {
      [ChatInfoAppName.CustomerApp]: {
        chatTitle: business.details.name,
        chatImage: business.details.image,
        phoneNumber: business.details.phoneNumber,
        participantType: ParticipantType.BusinessOperator,
        parentLink: `/businessOrders/${order.orderId}`,
      },
      [ChatInfoAppName.BusinessApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/businessOrders/${order.orderId}`,
      },
      [ChatInfoAppName.MezAdminApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/businessOrders/${order.orderId}`
      }
    }
  });
}

export async function setTaxiChatInfo(taxiOrder: TaxiOrder, customer: CustomerInfo) {

  let chain = getHasura();
  
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: taxiOrder.chatId
      },
      _set: {
        chat_info: $`chat_info`
      }
    }, {
      id: true
    },]
  }, {
    "chat_info": {
      [ChatInfoAppName.TaxiApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/orders/${taxiOrder.id}`
      },
      [ChatInfoAppName.CustomerApp]: {
        parentLink: `/taxiOrders/${taxiOrder.id}`,
        participantType: ParticipantType.TaxiDriver
      },
      [ChatInfoAppName.MezAdminApp]: {
        chatTitle: customer.name ?? "Customer",
        chatImage: customer.image,
        phoneNumber: customer.phoneNumber,
        participantType: ParticipantType.Customer,
        parentLink: `/taxiOrders/${taxiOrder.id}`
      }
    }
  });
  
}


export async function updateTaxiChatInfo(order: TaxiOrder, driver: TaxiDriver) {
  let chain = getHasura();

  let response = await chain.query({
    chat_by_pk: [{
      id: order.chatId
    }, {
      chat_info: [{}, true]
    }]
  })
  let chatInfo = (response.chat_by_pk?.chat_info)
  chatInfo.CustomerApp = {
    ...chatInfo.CustomerApp,
    chatTitle: driver.user?.name ?? "Driver",
    chatImage: driver.user?.image,
    phoneNumber: driver.user?.phoneNumber
  }
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: order.chatId
      },
      _set: {
        chat_info: $`chat_info`,
      } 
    }, {
      id: true
    }]
  }, {
    "chat_info": chatInfo
  });
}