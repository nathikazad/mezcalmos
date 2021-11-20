const notification = require("../notification");

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
  let response = await start(firebase, context.auth.uid, hasura)
  return response
});

async function start(firebase, uid, hasura) {
  
    let orderId = (await firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).once('value')).val();
    // console.log('the order id', orderId);
    if (orderId == null) {
      return {
        status: "Error",
        errorMessage: "Driver has not accepted any ride"
      }
    }
  
    let order = (await firebase.database().ref(`orders/taxi/${orderId}`).once('value')).val()
    if(order == null){
      return {
        status: "Error",
        errorMessage: "Order id does not match any order"
      }
    }
  
    // if(order.status != 'onTheWay'){
    //   return {
    //     status: 'Error',
    //     errorMessage: 'Ride status is not onTheWay but ' + order.status
    //   }
    // } 
  
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
        errorMessage: 'attempt to start but locked'
      }
    }
    order = response.snapshot.val()
  
    if(order.status != 'onTheWay'){
      firebase.database().ref(`/orders/taxi/${orderId}/lock`).remove()
      return{
        status: 'Error',
        errorMessage: 'Ride status in not onTheWay but ' + order.status
      }
    }
  
    let update = {
      status: "inTransit",
      rideStartTime: (new Date()).toISOString()
    }
    firebase.database().ref(`/orders/taxi/${orderId}`).update(update)
    firebase.database().ref(`/users/${order.customer.id}/orders/${orderId}`).update(update);
    firebase.database().ref(`/taxiDrivers/${order.driver.id}/orders/${orderId}`).update(update);
  
    update.notificationType = "orderStatusChange"
    update.orderType = "taxi"
    update.orderId = orderId
    update.time = update.rideStartTime
    delete update.rideStartTime
    notification.push(firebase, order.customer.id, update)
    // update started order
    order = (await firebase.database().ref(`orders/taxi/${orderId}`).once('value')).val()
   
      await hasura.updateOrder({
       orderId: orderId,
       changes:{
         finalStatus: order.status,
         rideStartTime: order.rideStartTime,
       } 
     }) 
   
    firebase.database().ref(`/orders/taxi/${orderId}/lock`).remove()
    return {
      status: "Success",
      message: "started"
    };
  }
  