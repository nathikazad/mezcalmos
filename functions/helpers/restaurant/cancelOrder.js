const functions = require("firebase-functions");
const firebase = require("firebase-admin");
const admin = require("../admin");
const notification = require("../notification");


// Customer Canceling
module.exports.cancelOrderFromCustomer = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  return changeStatus(context.auth.uid, data, "cancelledByCustomer");
});

// Cancel By Admin !
module.exports.cancelOrderFromAdmin = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  return changeStatus(context.auth.uid, data, "cancelledByAdmin", true);
});



async function changeStatus(uid, data, newStatus , requireAdmin = false) {

  // checking if the call is from an admin (in case requireAdmin is sat to true)
  if (requireAdmin) {
    let response = await admin.checkAdmin(firebase, { adminId: uid })
    if (response) {
      return response;
    }
  }
  // checking if the call to this cfunction was provided along with orderId param
  if (data.orderId == null) {
    return {
      status: "Error",
      errorMessage: `Expected order id`,
      errorCode: "orderIdNotGiven"
    }
  }

  // making a copy of the order and checking if it does actually exists!
  let order = (await firebase.database().ref(`/inProcessOrders/restaurant/${data.orderId}`).once('value')).val();
  if (order == null) {
    return {
      status: "Error",
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }

  // changing the payload.status to newStatus
  order.status = newStatus;

  // differs weither is admin or not
  const _customerId = requireAdmin ? order.customer.id : uid;
  const _pushNotificationTo = requireAdmin ? "customer" : "deliveryAdmin";

  // and also updating status on /orders (node for statistics)
  await firebase.database().ref(`/orders/restaurant/${data.orderId}/status`).update(order);

  // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
  await firebase.database().ref(`/customers/inProcessOrders/${_customerId}/${data.orderId}`).remove();
  await firebase.database().ref(`/customers/pastOrders/${_customerId}/${data.orderId}`).set(order)

  // moving the order node from /restaurants/inProcessOrders => /restaurants/pastOrders/
  await firebase.database().ref(`/restaurants/inProcessOrders/${order.serviceProviderId}/${data.orderId}`).remove();
  await firebase.database().ref(`/restaurants/pastOrders/${order.serviceProviderId}/${data.orderId}`).set(order)

  // and finally remove from root /inProcessOrders   
  await firebase.database().ref(`/inProcessOrders/restaurant/${data.orderId}`).remove();
  
  // notifications part
  let update = {
    status: "cancelled",
    time: (new Date()).toISOString(),
    notificationType: "orderStatusChange",
    orderType: "restaurant",
    orderId: data.orderId,
  }

  // push !
  notification.push(firebase, _customerId, update, _pushNotificationTo);
  
  // and return
  return { status: "Success" , orderId : data.orderId , message: "" }

}
