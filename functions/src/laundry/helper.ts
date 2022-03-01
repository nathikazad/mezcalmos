import { LaundryOrder } from "../shared/models/Services/Laundry/LaundryOrder";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Generic/Order";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";

export async function finishOrder(
  order: LaundryOrder,
  orderId: string) {
  // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
  await customerNodes.inProcessOrders(order.customer.id!, orderId).remove();
  await customerNodes.pastOrders(order.customer.id!, orderId).set(order)

  // and finally remove from root /inProcessOrders   
  await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).remove();
  await rootDbNodes.pastOrders(OrderType.Laundry, orderId).set(order)

  if (order.dropoffDriver) {
    await deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id!, orderId).remove();
    await deliveryDriverNodes.pastOrders(order.dropoffDriver.id!, orderId).update(order)
  }
  if (order.pickupDriver) {
    await deliveryDriverNodes.inProcessOrders(order.pickupDriver.id!, orderId).remove();
    await deliveryDriverNodes.pastOrders(order.pickupDriver.id!, orderId).update(order)
  }
}