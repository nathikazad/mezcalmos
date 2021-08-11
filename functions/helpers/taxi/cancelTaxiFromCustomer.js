const notification = require("../notification");
module.exports = ( firebase, uid, data ) => { return cancelTaxiFromCustomer(firebase, uid, data) }

async function cancelTaxiFromCustomer(firebase, uid, data) { 

  let orderId = (await firebase.database().ref(`/users/${uid}/state/currentOrder`).once('value')).val();
  if (orderId == null) {
    return {
      status: "Error",
      errorMessage: "Customer has not requested for any ride"
    }
  }

  let response = await firebase.database().ref(`/orders/taxi/${orderId}`).transaction(function(order){
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
  if(!response.committed){
    return{
      status: 'Error',
      errorMessage: 'attempt to cancel from customer but it is locked'
    }
  } 

  let order = response.snapshot.val();
  if (!order  || (order.status != "lookingForTaxi" && order.status != "onTheWay" && order.status != "inTransit"))  {
    await firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
    return {
      status: "Error",
      errorMessage: `Ride status is not in lookingForTaxi or onTheWay or inTransit but ${order.status}`
    }
  } 

  await firebase.database().ref(`/users/${order.customer.id}/state/currentOrder`).remove()
  let update = {
    status: "cancelled",
    rideFinishTime: (new Date()).toUTCString(),
    cancelledBy: "customer"
  }
  update.reason = (data.reason) ? data.reason : null
  if(order.status == "lookingForTaxi" ) {
    firebase.database().ref(`/openOrders/taxi/${orderId}`).remove();
    firebase.database().ref(`/orders/taxi/${orderId}`).update(update)
    firebase.database().ref(`/users/${order.customer.id}/orders/${orderId}`).remove();
  } else if (order.status == "onTheWay" || order.status == "inTransit") {
    firebase.database().ref(`/orders/taxi/${orderId}`).update(update)
    firebase.database().ref(`/users/${order.customer.id}/orders/${orderId}`).update(update);
    firebase.database().ref(`/taxiDrivers/${order.driver.id}/orders/${orderId}`).update(update);
    firebase.database().ref(`/taxiDrivers/${order.driver.id}/state/currentOrder`).remove()
    firebase.database().ref(`/inProcessOrders/taxi/${orderId}`).remove();
    update.notificationType = "orderStatusChange"
    update.orderId = orderId
    update.orderType = "taxi"
    update.time = update.rideFinishTime
    delete update.rideFinishTime
    notification.push(firebase, order.driver.id, update,'taxi')
  }
  firebase.database().ref(`/chat/${orderId}`).remove()
  await firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  return {
    status: "Success", 
    message: 'cancelled by customer'
  };
}