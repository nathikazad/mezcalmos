
const notification = require("../notification");
module.exports = ( firebase, orderId, customerId ) => { return expireOrder(firebase, orderId, customerId) }

async function expireOrder(firebase, orderId, customerId) {
  // while(true){
  //   let time = Date.now()
  //   time = time%10000
  //   time = time/1000
  //   if(time == 0)
  //     break
  // }
  console.log("expired ", Date.now()%60000)
  let response = await firebase.database().ref(`/orders/taxi/${orderId}`).transaction(function(order){
    if(order != null){
      if(order.lock == null){
        if(order.status == "lookingForTaxi") {
          order.status = "expired", 
          order.rideFinishTime = (new Date()).toUTCString()
          return order
        } else {
          console.log("attempted expire order but order already accepted")
          return 
        }
      } else {
        console.log("attempted expire order but locked")
        return
      }
    }
    return order
  })
  if(!response.committed){
    return{
      status: 'Error',
      errorMessage: 'Ride is not available from expire'
    }
  }
  console.log(`Removing order ${orderId} of ${customerId}`)
  let order = response.snapshot.val()
  firebase.database().ref(`/users/${customerId}/state/currentOrder`).remove()
  firebase.database().ref(`/users/${customerId}/orders/${orderId}`).remove();
  firebase.database().ref(`/openOrders/taxi/${orderId}`).remove();
  firebase.database().ref(`/chat/${orderId}`).remove();
  firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  
  firebase.database().ref(`/unfulfilledOrders/${orderId}`).set({...order, reason:"expired"});
  
  
  notification.push(firebase, customerId, {
    status: "expired",
    notificationType: "orderStatusChange",
    orderId: orderId,
    orderType: "taxi",
    rideFinishTime: (new Date()).toUTCString()
  })
  return {
    status: "Success"
  };
}