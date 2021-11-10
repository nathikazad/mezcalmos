const functions = require("firebase-functions");
const firebase = require("firebase-admin");
const admin = require("../admin");


module.exports.cancelOrderFromCustomer = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  // move from customer inProcess to Past
  // move from restaurant inProcess to Past
  // remove from root inProcess
  // let response = changeStatus(context.auth.uid, data, "preparingOrder")

  // let update = {
  //   status: "cancelled",
  //   time: (new Date()).toISOString(),
  //   notificationType: "orderStatusChange",
  //   orderType: "restaurant",
  //   orderId: orderId,
  // }

  // notification.push(firebase, order.customer.id, update, "deliveryAdmin")
  return response
});

module.exports.cancelOrderFromAdmin = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  // move from customer inProcess to Past
  // move from restaurant inProcess to Past
  // remove from root inProcess

  // let update = {
  //   status: "cancelled",
  //   time: (new Date()).toISOString(),
  //   notificationType: "orderStatusChange",
  //   orderType: "restaurant",
  //   orderId: orderId,
  // }

  // notification.push(firebase, order.customer.id, update)
  let response = changeStatus(context.auth.uid, data, "preparingOrder")
  return response
});