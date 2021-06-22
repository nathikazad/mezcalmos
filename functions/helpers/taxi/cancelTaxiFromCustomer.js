
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
  // while(true){
  //   let time = Date.now()
  //   time = time%10000
  //   time = time/1000
  //   if(time == 0)
  //     break
  // }
  // console.log("cancelled ", Date.now()%60000)
  let response = await firebase.database().ref(`/orders/taxi/${orderId}`).transaction(function(order){
    if(order != null){
      if(order.lock == null){
        if(order.status == "lookingForTaxi" ){
          order.rideStarted = false
          order.rideFinishTime = (new Date()).toUTCString()
        } else if (order.status == "onTheWay" || order.status == "inTransit") {
          order.rideStarted = true
          order.rideFinishTime = (new Date()).toUTCString()
        } else{
          return
        }
        order.status = "cancelled"
        order.cancelledBy = "customer"
        order.reason = (data.reason) ? data.reason : null
        order.lock = true
        return order
      } else {
        console.log("cancel from customer but locked")
        return
      }
    }
    return order
  })
  if(!response.committed){
    return{
      status: 'Error',
      errorMessage: 'Ride is not available '
    }
  }
  let order = response.snapshot.val()
  if (order.status != "cancelled") {
    return {
      status: "Error",
      errorMessage: "Ride status is not in lookingForTaxi or onTheWay or inTransit"
    }
  }

  await firebase.database().ref(`/users/${order.customer.id}/state/currentOrder`).remove()

  if(order.rideStarted == false ) {
    firebase.database().ref(`/openOrders/taxi/${orderId}`).remove();
    firebase.database().ref(`/users/${order.customer.id}/orders/${orderId}`).remove();
    firebase.database().ref(`/unfulfilledOrders/${orderId}`).set({...order, reason:"cancelled"});
  } else {
    let update = {
      status: "cancelled",
      rideFinishTime: (new Date()).toUTCString(),
      cancelledBy: "customer"
    }
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
  firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  return{
    status: "Success",
    message: 'Cancelled'
  }
}