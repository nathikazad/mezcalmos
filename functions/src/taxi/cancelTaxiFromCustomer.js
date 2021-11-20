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
  let response = await cancelTaxiFromCustomer(firebase, context.auth.uid, data, hasura)
  return response
});

async function cancelTaxiFromCustomer(firebase, uid, data, hasura) { 

  // let orderId = (await firebase.database().ref(`/users/${uid}/state/currentOrder`).once('value')).val();
  // if (orderId == null) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer has not requested for any ride"
  //   }
  // }
  if (!data.orderId) {
      return {
        status: "Error",
        errorMessage: "User needs to be signed in"
      }
    }

  let orderId = data.orderId

  let response = await firebase.database().ref(`/inProcessOrders/taxi/${orderId}`).transaction(function (order) {
      if(order != null) {
       if(order.lock == true){
         return
       } else{
         order.lock = true
         return order
       }
     }
     return order
   })
  if (!response.committed) {
    return {
      status: 'Error',
      errorMessage: 'attempt to cancel from customer but it is locked'
    }
  }
  
  let order = response.snapshot.val();
  if (!order || (order.status != "lookingForTaxi" && order.status != "onTheWay" && order.status != "inTransit")) {
    await firebase.database().ref(`inProcessOrders/taxi/${orderId}/lock`).remove()
    let orderStatus = order == null ? "removed" : order.status;
    return {
      status: "Error",
      errorMessage: `Ride status is not in lookingForTaxi or onTheWay or inTransit but ${orderStatus}`
    }
  }

  let update = {
    status: "cancelledByCustomer",
    rideFinishTime: (new Date()).toISOString(),
  }

  order = {
    ...order,
    ...update
  }

  update.reason = (data.reason) ? data.reason : null
  firebase.database().ref(`/openOrders/taxi/${orderId}`).remove();
  firebase.database().ref(`/pastOrders/taxi/${orderId}`).set(order);
  if (order.status == "lookingForTaxi") {
    firebase.database().ref(`/customers/inProcessOrders/${order.customer.id}/${orderId}`).remove();
    firebase.database().ref(`/customers/pastOrders/${order.customer.id}/${orderId}`).set(order);
    notification.cancelNotificationsForOrderId(firebase, orderId);
  } else if (order.status == "onTheWay" || order.status == "inTransit") {
    firebase.database().ref(`/customers/inProcessOrders/${order.customer.id}/${orderId}`).remove();
    firebase.database().ref(`/customers/pastOrders/${order.customer.id}/${orderId}`).set(order);
    firebase.database().ref(`/taxiDrivers/${order.driver.id}/orders/${orderId}`).update(update);
    firebase.database().ref(`/taxiDrivers/${order.driver.id}/state/currentOrder`).remove()
    firebase.database().ref(`/inProcessOrders/taxi/${orderId}`).remove();
    update.notificationType = "orderStatusChange"
    update.orderId = orderId
    update.orderType = "taxi"
    update.time = update.rideFinishTime
    delete update.rideFinishTime
    notification.push(firebase, order.driver.id, update, 'taxi')
  }
    //update order
  await hasura.updateOrder({
    orderId: orderId,
    changes: {
      finalStatus: update.status,
      rideFinishTime: update.rideFinishTime,
      cancellationParty: update.cancelledBy
    }
  })
    
    firebase.database().ref(`/chat/${orderId}`).remove()
    await firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
    return {
      status: "Success", 
      message: 'cancelled by customer'
    };
  }