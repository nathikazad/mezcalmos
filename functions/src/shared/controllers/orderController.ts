import { Order, OrderType } from "../models/Generic/Order";
import { LaundryOrder } from "../models/Services/Laundry/LaundryOrder";
import { RestaurantOrder } from "../models/Services/Restaurant/RestaurantOrder";
import * as restaurantNodes from "../databaseNodes/services/restaurant";
import * as laundryNodes from "../databaseNodes/services/laundry";
import { ChatObject, ParticipantType } from "../models/Generic/Chat";
import { addParticipantsToChat } from "./chatController";

export function updateServiceProviderOrder(orderId: string, order: Order) {
  if (order.orderType == OrderType.Restaurant) {
    let rOrder: RestaurantOrder = <RestaurantOrder>{ ...order }
    restaurantNodes.inProcessOrders(rOrder.restaurant.id!, orderId).update(order);
  } else if (order.orderType == OrderType.Laundry) {
    let lOrder: LaundryOrder = <LaundryOrder>{ ...order }
    laundryNodes.inProcessOrders(lOrder.laundry.id!, orderId).update(order);
  }
}

export function addServiceProviderOperatorsToChat(orderId: string, order: Order, serviceProviderchat: ChatObject,
  serviceProviderDriverChatId: string) {
  switch (order.orderType) {
    case OrderType.Laundry:
      laundryNodes.laundryOperators(order.serviceProviderId!).once('value').then((snapshot) => {
        let laundryOperators: Record<string, boolean> = snapshot.val();
        addParticipantsToChat(Object.keys(laundryOperators), serviceProviderchat, serviceProviderDriverChatId, ParticipantType.LaundryOperator)
      })
      break;

    default:
      break;
  }
}