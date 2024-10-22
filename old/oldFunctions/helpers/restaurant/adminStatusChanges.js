const functions = require("firebase-functions");
const firebase = require("firebase-admin");
const notification = require("../notification");

statusArrayInSeq =
  ["OrderReceived",
    "preparingOrder",
    "readyForPickup",
    "onTheWay",
    "delivered"]

async function checkAdmin(firebase, params) {
  let isAdmin = (await firebase.database().ref(`deliveryAdmins/${params.adminId}/authorized`).once('value')).val();
  isAdmin = isAdmin != null && isAdmin == true
  if (!isAdmin) {
    return { status: "Error", errorMessage: "Only admins can run this operation" }
  }
}

module.exports.prepareOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let response = changeStatus(context.auth.uid, data, "preparingOrder")
  return response
});

module.exports.readyForPickupOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let response = changeStatus(context.auth.uid, data, "readyForPickup")
  return response
});

module.exports.deliverOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let response = changeStatus(context.auth.uid, data, "onTheWay")
  return response
});

module.exports.dropOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let response = changeStatus(context.auth.uid, data, "delivered")
  return response
});

function expectedPreviousStatus(status) {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(uid, data, newStatus) {

  let response = await checkAdmin(firebase, { adminId: uid })
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

  let update = {
    status: newStatus,
    time: (new Date()).toISOString(),
    notificationType: "orderStatusChange",
    orderType: "restaurant",
    orderId: orderId,
  }

  notification.push(firebase, order.customer.id, update)

  if (newStatus == "delivered") {
    // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
    await firebase.database().ref(`/customers/inProcessOrders/${order.customer.id}/${data.orderId}`).remove();
    await firebase.database().ref(`/customers/pastOrders/${order.customer.id}/${data.orderId}`).set(order)

    // moving the order node from /restaurants/inProcessOrders => /restaurants/pastOrders/
    await firebase.database().ref(`/restaurants/inProcessOrders/${order.serviceProviderId}/${data.orderId}`).remove();
    await firebase.database().ref(`/restaurants/pastOrders/${order.serviceProviderId}/${data.orderId}`).set(order)

    // and finally remove from root /inProcessOrders   
    // await firebase.database().ref(`/inProcessOrders/restaurant/${data.orderId}`).remove();
    // await firebase.database().ref(`/pastOrders/restaurant/${data.orderId}`).set(order)
  }
  return { status: "Success" }
}