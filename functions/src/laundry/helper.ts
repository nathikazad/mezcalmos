import { LaundryOrder } from "../shared/models/Services/Laundry/LaundryOrder";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import * as laundryNodes from "../shared/databaseNodes/services/laundry";
import { OrderType } from "../shared/models/Generic/Order";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";

export async function finishOrder(
  order: LaundryOrder,
  orderId: string) {
  // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
  await customerNodes.pastOrders(order.customer.id!, orderId).set(order)
  await customerNodes.inProcessOrders(order.customer.id!, orderId).remove();


  // and finally remove from root /inProcessOrders   
  await rootDbNodes.pastOrders(OrderType.Laundry, orderId).set(order)
  await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).remove();


  if (order.laundry) {
    laundryNodes.pastOrders(order.laundry.id, orderId).set(order);
    laundryNodes.inProcessOrders(order.laundry.id, orderId).remove();
  }

  if (order.dropoffDriver) {
    await deliveryDriverNodes.pastOrders(order.dropoffDriver.id!, orderId).update(order)
    await deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id!, orderId).remove();
  }
  if (order.pickupDriver) {
    await deliveryDriverNodes.pastOrders(order.pickupDriver.id!, orderId).update(order)
    await deliveryDriverNodes.inProcessOrders(order.pickupDriver.id!, orderId).remove();
  }
}