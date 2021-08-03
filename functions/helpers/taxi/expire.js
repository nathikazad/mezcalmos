const notification = require("../notification");
const hasura = require("../hasura");

module.exports = ( firebase, orderId, customerId ) => { return expireOrder(firebase, orderId, customerId) }

async function expireOrder(firebase, orderId, customerId) {

    let order = (await firebase.database().ref(`/orders/taxi/${orderId}`).once('value')).val() 
    if(order == null){
      return{
        status: 'Error',
        errorMessage: 'Order id does not match any order'
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
      return {
        status: 'Error',
        errorMessage: 'attempt to expire but locked'
      }
    }
  
    order = response.snapshot.val();
  
    
      if(order.status != "lookingForTaxi") {
        await firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
        return {
          status: 'Error',
          errorMessage: 'cannot expire because order status is not lookingForTaxi'
        }
      }
    
    
    console.log(`Removing order ${orderId} of ${customerId}`)
    firebase.database().ref(`/users/${customerId}/state/currentOrder`).remove()
    firebase.database().ref(`/users/${customerId}/orders/${orderId}`).remove();
    firebase.database().ref(`/openOrders/taxi/${orderId}`).remove();
    firebase.database().ref(`/chat/${orderId}`).remove();
    await firebase.database().ref(`/orders/taxi/${orderId}`).update({
      status: "expired",
      rideFinishTime: (new Date()).toUTCString(),
    })
    order = (await firebase.database().ref(`/orders/taxi/${orderId}`).once('value')).val()
    //update order
   
      await hasura.updateOrder({
        orderId: orderId,
        changes:{
          finalStatus: order.status,
          rideFinishTime: order.rideFinishTime,
        } 
      }) 
      
    firebase.database().ref(`/orders/taxi/${orderId}`).once('value', function(snap) {
      let order = snap.val()
      firebase.database().ref(`/unfulfilledOrders/${orderId}`).set({...order, reason:"expired"});
    })
  
    notification.push(firebase, customerId, {
      status: "expired",
      notificationType: "orderStatusChange",
      orderId: orderId,
      orderType: "taxi",
      rideFinishTime: (new Date()).toUTCString()
    })
    await firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  
    return{
      status: 'Success',
      message: 'expired'
    }
  }
