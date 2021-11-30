const functions = require("firebase-functions");
const firebase = require("firebase-admin");
const notification = require("../notification");


async function checkAdmin(firebase, params) {
  let isAdmin = (await firebase.database().ref(`deliveryAdmins/${params.adminId}/authorized`).once('value')).val();
  isAdmin = isAdmin != null && isAdmin == true
  if (!isAdmin) {
    return { status: "Error", errorMessage: "Only admins can run this operation" }
  }
}

// Customer Canceling
module.exports.cancelOrderFromCustomer = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  return changeStatus(context.auth.uid, data, "cancelledByCustomer");
});

// Cancel By Admin !
module.exports.cancelOrderFromAdmin = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  return changeStatus(context.auth.uid, data, "cancelledByAdmin");
});



async function changeStatus(uid, data, newStatus) {

  if (newStatus == "cancelledByAdmin") {
    let response = await checkAdmin(firebase, { adminId: uid })
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

  if (order.status == "cancelledByAdmin" ||
    order.status == "cancelledByCustomer" ||
    order.status == "delivered")
    return {
      status: "Error",
      errorMessage: `Order cannot be cancelled because it is not in process`,
      errorCode: "orderNotInProcess"
    }
  // changing the payload.status to newStatus
  order.status = newStatus;

  // differs weither is admin or not
  // const _pushNotificationTo = requireAdmin ? "customer" : "deliveryAdmin";

  // and also updating status on /orders (node for statistics)
  await firebase.database().ref(`/orders/restaurant/${data.orderId}/status`).update(order);

  // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
  await firebase.database().ref(`/customers/inProcessOrders/${order.customer.id}/${data.orderId}`).remove();
  await firebase.database().ref(`/customers/pastOrders/${order.customer.id}/${data.orderId}`).set(order)

  // moving the order node from /restaurants/inProcessOrders => /restaurants/pastOrders/
  await firebase.database().ref(`/restaurants/inProcessOrders/${order.serviceProviderId}/${data.orderId}`).remove();
  await firebase.database().ref(`/restaurants/pastOrders/${order.serviceProviderId}/${data.orderId}`).set(order)

  // and finally remove from root /inProcessOrders   
  await firebase.database().ref(`/inProcessOrders/restaurant/${data.orderId}`).set(order);
  await firebase.database().ref(`/pastOrders/restaurant/${data.orderId}`).set(order);
  
  // notifications part
  let update = {
    status: newStatus,
    time: (new Date()).toISOString(),
    notificationType: "orderStatusChange",
    orderType: "restaurant",
    orderId: data.orderId,
  }

  // push !
  if (newStatus == "cancelledByAdmin") {
    notification.push(firebase, order.customer.id, update, "customer");
  } else {
    firebase.database().ref(`/deliveryAdmins`).once('value', (snapshot) => {
      notifyAdminsCancelledOrder(snapshot.val(), firebase, update)
    });
  }
  
  // and return
  return { status: "Success" , orderId : data.orderId , message: "" }

}


async function notifyAdminsCancelledOrder(admins, firebase, update) {
  for (let adminId in admins) {
    firebase.database().ref(`/notifications/deliveryAdmin/${adminId}`).push(update)
    let admin = admins[adminId]
    if (admin.notificationInfo) {
      let payload = {
        notification: {
          title: "Pedido Cancellado",
          body: `Hay un pedido que es cancelado`,
          tag: "newOrder"
        }
      };
      let options = {
        collapse_key: "cancelOrder",
        priority: "high"
      }
      try {
        await firebase.messaging().sendToDevice(admin.notificationInfo.deviceNotificationToken, payload, options)
      } catch {
        console.log("Send to devices error");
      }
    }
  }
}