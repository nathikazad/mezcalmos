import { RestaurantOrder } from "../shared/models/Services/Restaurant/RestaurantOrder";
import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Generic/Order";

export async function finishOrder(
  order: RestaurantOrder,
  orderId: string) {
  // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
  customerNodes.pastOrders(order.customer.id!, orderId).set(order)
  customerNodes.inProcessOrders(order.customer.id!, orderId).remove();


  // moving the order node from /restaurants/inProcessOrders => /restaurants/pastOrders/
  restaurantNodes.pastOrders(order.restaurant.id!, orderId).set(order)
  restaurantNodes.inProcessOrders(order.restaurant.id!, orderId).remove();

  // and finally remove from root /inProcessOrders   
  await rootDbNodes.pastOrders(OrderType.Restaurant, orderId).set(order)
  await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).remove();

  if (order.dropoffDriver) {
    await deliveryDriverNodes.pastOrders(order.dropoffDriver.id!, orderId).set(order)
    await deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id!, orderId).remove();
  }
}