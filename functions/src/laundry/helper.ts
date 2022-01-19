import { LaundryOrder } from "./models/LaundryOrder";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Order";

export async function finishOrder(
  order: LaundryOrder,
  orderId: string) {
  // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
  await customerNodes.inProcessOrders(order.customer.id!, orderId).remove();
  await customerNodes.pastOrders(order.customer.id!, orderId).set(order)

  // and finally remove from root /inProcessOrders   
  await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).remove();
  await rootDbNodes.pastOrders(OrderType.Laundry, orderId).set(order)
}