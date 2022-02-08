import { RestaurantOrder } from "../shared/models/Services/Restaurant/RestaurantOrder";
import * as restaurantNodes from "../shared/databaseNodes/restaurant";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Generic/Order";

export async function finishOrder(
  order: RestaurantOrder,
  orderId: string) {
  // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
  await customerNodes.inProcessOrders(order.customer.id!, orderId).remove();
  await customerNodes.pastOrders(order.customer.id!, orderId).set(order)

  // moving the order node from /restaurants/inProcessOrders => /restaurants/pastOrders/
  await restaurantNodes.inProcessOrders(order.restaurant.id!, orderId).remove();
  await restaurantNodes.pastOrders(order.restaurant.id!, orderId).set(order)

  // and finally remove from root /inProcessOrders   
  await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).remove();
  await rootDbNodes.pastOrders(OrderType.Restaurant, orderId).set(order)
}