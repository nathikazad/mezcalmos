import { LaundryOrder, LaundryOrderStatus } from "../shared/models/Services/Laundry/LaundryOrder";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Generic/Order";
import { getLaundryCheckDetails } from "../shared/graphql/laundry/laundryCheck";
import { isMezAdmin } from "../shared/helper";
import { MezError } from "../shared/models/Generic/Generic";

export async function finishOrder(
  order: LaundryOrder,
  orderId: string) {
  // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
  // await customerNodes.pastOrders(order.customer.firebaseId!, orderId).set(order)
  // await customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).remove();


  // and finally remove from root /inProcessOrders   
  await rootDbNodes.pastOrders(OrderType.Laundry, orderId).set(order)
  await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).remove();


  // if (order.laundry) {
  //   laundryNodes.pastOrders(order.laundry.firebaseId, orderId).set(order);
  //   laundryNodes.inProcessOrders(order.laundry.firebaseId, orderId).remove();
  // }

  // if (order.dropoffDriver) {
  //   await deliveryDriverNodes.pastOrders(order.dropoffDriver.firebaseId!, orderId).update(order)
  //   await deliveryDriverNodes.inProcessOrders(order.dropoffDriver.firebaseId!, orderId).remove();
  // }
  // if (order.pickupDriver) {
  //   await deliveryDriverNodes.pastOrders(order.pickupDriver.firebaseId!, orderId).update(order)
  //   await deliveryDriverNodes.inProcessOrders(order.pickupDriver.firebaseId!, orderId).remove();
  // }
}

let statusArrayInSeq: Array<LaundryOrderStatus> =
  [LaundryOrderStatus.OrderReceived,
  LaundryOrderStatus.OtwPickupFromCustomer,
  LaundryOrderStatus.PickedUpFromCustomer,
  LaundryOrderStatus.AtLaundry,
  LaundryOrderStatus.ReadyForDelivery,
  LaundryOrderStatus.OtwPickupFromLaundry,
  LaundryOrderStatus.PickedUpFromLaundry,
  LaundryOrderStatus.Delivered
  ]

export function expectedPreviousStatus(status: LaundryOrderStatus): LaundryOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

// async function checkLaundryOperator(laundryId: string, operatorId: string): Promise<ServerResponse | undefined> {
//   let operator = (await laundryNodes.laundryOperators(laundryId, operatorId).once('value')).val();
//   let isOperator = operator != null && operator == true
//   if (!isOperator) {
//     return {
//       status: ServerResponseStatus.Error,
//       errorMessage: "Only authorized laundry operators can run this operation"
//     }
//   }
//   return undefined;
// }

export async function passChecksForLaundry(orderId: number, userId: number) { 

  let response = await getLaundryCheckDetails(orderId, userId);
  let order = response.laundry_order_by_pk;

  if (order == null) {
    throw new MezError("orderNotFound");
  }

  if((await isMezAdmin(userId)) == false) {
    if (response.laundry_operator.length == 0) {
      throw new MezError("unauthorizedAccess");
    }
    if(response.laundry_operator[0].store_id != order.store_id) {
      throw new MezError("incorrectOrderId");
    }
  }
}