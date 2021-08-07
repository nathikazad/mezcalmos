const notification = require("../notification");


module.exports = ( firebase, uid, data, hasura) => { return cancelTaxiFromDriver(firebase, uid, data, hasura) }

async function cancelTaxiFromDriver(firebase, uid, data, hasura) {
    let orderId = (await firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).once('value')).val();
    if (orderId == null) {
      return {
        status: "Error",
        errorMessage: "Driver has not accepted any ride"
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
        errorMessage: 'attempt to cancel from driver but it is locked'
      }
    } 
  
    let order = response.snapshot.val();
  
    if (!order || (order.status != "onTheWay" && order.status != "inTransit")) {
      firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
      return {
        status: "Error",
        errorMessage: "Ride status is not onTheWay or inTransit"
      }
    }
  
    let update = {
      status: "cancelled",
      rideFinishTime: (new Date()).toUTCString()
    }
  
    if(data.reason){
      update.reason = data.reason
    }
    update.cancelledBy = "driver"
    firebase.database().ref(`/orders/taxi/${orderId}`).update(update)
    firebase.database().ref(`/users/${order.customer.id}/orders/${orderId}`).update(update);
    firebase.database().ref(`/users/${order.customer.id}/state/currentOrder`).remove()
  
    firebase.database().ref(`/taxiDrivers/${order.driver.id}/orders/${orderId}`).update(update);
    await firebase.database().ref(`/taxiDrivers/${order.driver.id}/state/currentOrder`).remove()
    firebase.database().ref(`/inProcessOrders/taxi/${orderId}`).remove();
    firebase.database().ref(`/taxiCancelledOrders/${orderId}`).set(order)
    
    update.notificationType = "orderStatusChange"
    update.orderId = orderId
    update.orderType = "taxi"
    update.time = update.rideFinishTime
    delete update.rideFinishTime
    notification.push(firebase, order.customer.id, update)
    // update cancelled order
    order = (await firebase.database().ref(`orders/taxi/${orderId}`).once('value')).val()
   
      await hasura.updateOrder({
       orderId: orderId,
       changes:{
         finalStatus: order.status,
         rideFinishTime: order.rideFinishTime,
         cancellationParty: order.cancelledBy,
         cancellationReason: order.reason
       } 
     }) 
  
    //removing driver from chat node
    await firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
    return {
      status: "Success",
      message: 'cancelled by driver'
    };
  
}