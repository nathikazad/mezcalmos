
// const notification = require("../notification");
import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import { RestaurantOrder, RestaurantOrderStatus } from "./models/RestaurantOrder";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Order";
import { ServerResponseStatus } from "../shared/models/Generic";
import { finishOrder } from "./helper";
import { notifyDeliveryAdminsCancelledOrder } from "../shared/notification/notifyDeliveryAdmin";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";

// Customer Canceling
export = functions.https.onCall(async (data, context) => {
  let response = await isSignedIn(context.auth)
  if (response != undefined) {
    return response;
  }

  if (data.orderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected order id`,
      errorCode: "orderIdNotGiven"
    }
  }

  let orderId: string = data.orderId;

  let order: RestaurantOrder = (await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).once('value')).val();
  if (order == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }

  if (order.customer.id != context.auth!.uid) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not belong to customer`,
      errorCode: "notCustomerOrder"
    }
  }

  order.status = RestaurantOrderStatus.CancelledByCustomer;
  await finishOrder(order, orderId);

  deliveryAdminNodes.deliveryAdmins().once('value', (snapshot) => {
    notifyDeliveryAdminsCancelledOrder(snapshot.val(), orderId);
  });

  return { status: ServerResponseStatus.Success, orderId: data.orderId }
});
