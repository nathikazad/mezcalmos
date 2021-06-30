
const notification = require("../notification");
module.exports = ( firebase, orderId, customerId ) => { return expireOrder(firebase, orderId, customerId) }

async function expireOrder(firebase, orderId, customerId) {

  
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
  let order = response.snapshot.val();
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
  firebase.database().ref(`/orders/taxi/${orderId}`).update({
    status: "expired",
    rideFinishTime: (new Date()).toUTCString(),
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

  // while(true){
  //   let time = Date.now()
  //   time = time%10000
  //   time = time/1000
  //   if(time == 0)
  //     break
  // }
  // console.log("expired ", Date.now()%60000)
  // let response = await firebase.database().ref(`/orders/taxi/${orderId}`).transaction(function(order){
  //   if(order != null){
  //     if(order.lock == null){
  //       order.lock = true
  //       // if(order.status == "lookingForTaxi"){
  //       //   order.status = "expired", 
  //       //   order.rideFinishTime = (new Date()).toUTCString()
  //       // }
  //     }else{
  //       console.log("attempted expire order but locked")
  //       return 
  //     }
  //   }
  //   return order
  // })

  // if(!response.committed){
  //   return{
  //     status: 'Error',
  //     errorMessage: 'Ride is not available from expire'
  //   }
  // }

  // console.log(`Removing order ${orderId} of ${customerId}`)
  // let order = response.snapshot.val()
  // if(order.status == "lookingForTaxi"){
  //   order.status = "expired", 
  //   order.rideFinishTime = (new Date()).toUTCString()
  // }
  // firebase.database().ref(`/users/${customerId}/state/currentOrder`).remove()
  // firebase.database().ref(`/users/${customerId}/orders/${orderId}`).remove();
  // firebase.database().ref(`/openOrders/taxi/${orderId}`).remove();
  // firebase.database().ref(`/chat/${orderId}`).remove();
  // firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  // firebase.database().ref(`/unfulfilledOrders/${orderId}`).set({...order, reason:"expired"});
  
  // notification.push(firebase, customerId, {
  //   status: "expired",
  //   notificationType: "orderStatusChange",
  //   orderId: orderId,
  //   orderType: "taxi",
  //   rideFinishTime: (new Date()).toUTCString()
  // })
  // firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  // return {
  //   status: "Success",
  //   message: "expired"
  // };
}