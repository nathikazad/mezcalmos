const logger = require("firebase-functions/lib/logger")
const notification = require("../notification");

const functions = require("firebase-functions");
const firebase = require("firebase-admin");


const keys = require("../keys").keys()
const hasuraModule = require("../hasura");

const hasura = new hasuraModule.Hasura(keys.hasura);

module.exports = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let response = await finish(firebase, context.auth.uid, hasura)
  return response
});

async function finish(firebase, uid, hasura) {
  
  let orderId = (await firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).once('value')).val();

  if (orderId == null) {
    return {
      status: "Error",
      errorMessage: "Driver has not accepted any ride"
    }
  }

  let response = await firebase.database().ref(`orders/taxi/${orderId}`).transaction(function (order) {
    if (order != null) {
      if (order.lock == null) {
        order.lock = true
      } else {
        console.log('attempt to finish ride');
        return
      }
    }
    return order
  })
  
  if (!response.committed) {
    return {
      status: 'Error',
      errorMessage: 'attempt to finish ride but locked'
    }
  }

  order = response.snapshot.val()

  if (order.status != "inTransit") {
    firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
    return {
      status: "Error",
      errorMessage: "Ride status is not inTransit but " + order.status
    }
  }

  let update = {
    status: "droppedOff",
    rideFinishTime: (new Date()).toISOString()
  }
  firebase.database().ref(`/orders/taxi/${orderId}`).update(update)
  firebase.database().ref(`/users/${order.customer.id}/orders/${orderId}`).update(update);
  firebase.database().ref(`/taxiDrivers/${order.driver.id}/orders/${orderId}`).update(update);
  firebase.database().ref(`/taxiDrivers/${order.driver.id}/state/currentOrder`).remove()
  firebase.database().ref(`/users/${order.customer.id}/state/currentOrder`).remove()
  firebase.database().ref(`/inProcessOrders/taxi/${orderId}`).remove();
  update.notificationType = "orderStatusChange"
  update.orderId = orderId
  update.orderType = "taxi"
  update.time = update.rideFinishTime
  delete update.rideFinishTime
  notification.push(firebase, order.customer.id, update)
  // update order in DB
  order = (await firebase.database().ref(`orders/taxi/${orderId}`).once('value')).val()
  let date1 = new Date(order.rideFinishTime)
  let date2 = new Date(order.rideStartTime)
  let time = (date1.getTime() - date2.getTime())
   
   
  await hasura.updateOrder({
    orderId: orderId,
    changes: {
      finalStatus: order.status,
      rideFinishTime: order.rideFinishTime,
      estimatedRideTime: time
    }
  })

  firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  return {
    status: "Success",
    message: "finished"
  };
}