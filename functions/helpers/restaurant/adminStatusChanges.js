const functions = require("firebase-functions");
const firebase = require("firebase-admin");
const admin = require("../admin");

statusArrayInSeq =
  ["orderReceieved",
    "preparingOrder",
    "readyForPickup",
    "onTheWay",
    "delivered"]

module.exports.prepareOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  let response = changeStatus(context.auth.uid, data, "preparingOrder")
  return response
});

module.exports.readyForPickupOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  let response = changeStatus(context.auth.uid, data, "readyForPickup")
  return response
});

module.exports.deliverOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  let response = changeStatus(context.auth.uid, data, "onTheWay")
  return response
});

module.exports.dropOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  let response = changeStatus(context.auth.uid, data, "delivered")
  return response
});

function expectedPreviousStatus(status) {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(uid, data, newStatus) {

  let response = await admin.checkAdmin(firebase, { adminId: uid })
  if (response) {
    return response;
  }

  if (data.orderId == null) {
    return {
      status: "Error",
      errorMessage: `Expected order id`,
      errorCode: "orderIdNotGiven"
    }
  }

  let orderId = data.orderId;

  let order = (await firebase.database().ref(`/inProcessOrders/restaurant/${orderId}`).once('value')).val();
  if (order == null) {
    return {
      status: "Error",
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }

  if (expectedPreviousStatus(newStatus) != order.status) {
    return {
      status: "Error",
      errorMessage: `Status is not ${expectedPreviousStatus(newStatus)} but ${order.status}`,
      errorCode: "invalidOrderStatus"
    }
  }

  order.status = newStatus

  firebase.database().ref(`/orders/restaurant/${orderId}`).update(order);
  firebase.database().ref(`/customers/inProcessOrders/${order.customer.id}/${orderId}`).update(order);
  firebase.database().ref(`/restaurants/inProcessOrders/${order.serviceProviderId}/${orderId}`).update(order);
  firebase.database().ref(`/inProcessOrders/restaurant/${orderId}`).update(order);

  return { status: "Success" }
}