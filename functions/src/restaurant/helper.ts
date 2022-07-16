import { RestaurantOrder } from "../shared/models/Services/Restaurant/RestaurantOrder";
import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Generic/Order";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ServerResponse, ServerResponseStatus, ValidationPass } from "../shared/models/Generic/Generic";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";

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

async function checkRestaurantOperator(restaurantId: string, operatorId: string): Promise<ServerResponse | undefined> {
  let operator = (await restaurantNodes.restaurantOperators(restaurantId, operatorId).once('value')).val();
  let isOperator = operator != null && operator == true
  if (!isOperator) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Only authorized restaurant operators can run this operation"
    }
  }
  return undefined;
}

export async function passChecksForRestaurant(data: any, auth?: AuthData): Promise<ValidationPass> {
  let response = await isSignedIn(auth)
  if (response != undefined) {
    return {
      ok: false,
      error: response
    }
  }
  if (data.orderId == null) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected order id`,
        errorCode: "orderIdNotGiven"
      }
    }
  }

  let orderId: string = data.orderId;
  let order: RestaurantOrder = (await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).once('value')).val();
  if (order == null) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Order does not exist`,
        errorCode: "orderDontExist"
      }
    }
  }

  if (data.fromRestaurantOperator) {
    response = await checkRestaurantOperator(order.restaurant.id, auth!.uid)
    if (response != undefined) {
      return {
        ok: false,
        error: response
      };
    }
  } else {
    response = await checkDeliveryAdmin(auth!.uid)
    if (response != undefined) {
      return {
        ok: false,
        error: response
      };
    }
  }

  return {
    ok: true,
    order: order
  }
}