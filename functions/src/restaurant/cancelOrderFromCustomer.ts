
// const notification = require("../notification");
import * as functions from "firebase-functions";
import { isSignedIn } from "../shared/helper/authorizer";
import { RestaurantOrder, RestaurantOrderStatus } from "./models/RestaurantOrder";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Order";
import { ServerResponseStatus } from "../shared/models/Generic";
import { finishOrder } from "./helper";


// Customer Canceling
module.exports.cancelOrderFromCustomer = functions.https.onCall(async (data, context) => {
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

  // notifications part
  // let update = {
  //   status: newStatus,
  //   time: (new Date()).toISOString(),
  //   notificationType: "orderStatusChange",
  //   orderType: "restaurant",
  //   orderId: data.orderId,
  // }
  //   firebase.database().ref(`/deliveryAdmins`).once('value', (snapshot) => {
  //     notifyAdminsCancelledOrder(snapshot.val(), firebase, update)
  //   });
  return { status: ServerResponseStatus.Success, orderId: data.orderId }
});


// async function notifyAdminsCancelledOrder(admins, firebase, update) {
//   for (let adminId in admins) {
//     firebase.database().ref(`/notifications/deliveryAdmin/${adminId}`).push(update)
//     let admin = admins[adminId]
//     if (admin.notificationInfo) {
//       let payload = {
//         notification: {
//           title: "Pedido Cancellado",
//           body: `Hay un pedido que es cancelado`,
//           tag: "newOrder"
//         }
//       };
//       let options = {
//         collapse_key: "cancelOrder",
//         priority: "high"
//       }
//       try {
//         await firebase.messaging().sendToDevice(admin.notificationInfo.deviceNotificationToken, payload, options)
//       } catch {
//         console.log("Send to devices error");
//       }
//     }
//   }
// }