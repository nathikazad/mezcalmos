module.exports = {
  request,
  expireOrder,
  cancelTaxiFromCustomer,
  accept,
  start,
  cancelTaxiFromDriver,
  finish
}

const { notifyPromoterFromTest } = require("..");
const notification = require("./notification");
const promoters = require("./promoters");
const hasura = require("./hasura")

//possible statuses: lookingForTaxi, onTheWay, inTransit, droppedOff
async function request(firebase, uid, data) {
 // 
 let taxiDrivers = (await firebase.database().ref('/taxiDrivers').once('value')).val()
 for(let id in taxiDrivers ){
  async function updateDriver(){
      let req = await hasura.updateUser({
         uid: id,
         changes:{
           driver: true,
           taxiNumber: taxiDrivers[id].taxiNumber
         } 
       }) 
       if(req.status == 'Success'){
         console.log('driver is updated successfully in DB');
       }
       
  }
     await updateDriver()

 }

  // TODO: prevent user from sending another request before this finishes
  // let customerCurrentOrder = (await firebase.database().ref(`/users/${uid}/state/currentOrder`).once('value')).val();

  // if (customerCurrentOrder != null) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in another taxi"
  //   }
  // }
  if (!data.from || !data.to || !data.distance || !data.duration 
    || !data.estimatedPrice || !data.paymentType) {
    return {
      status: "Error",
      errorMessage: "Required from, to, distance, duration, estimatedPrice and paymentType"
    }
  }

  response = await firebase.database().ref(`users/${uid}/lock`).transaction(function(lock){
    if(lock == true){
      return
    } else{
      return true
    }
  })

  if(!response.committed){
    return{
      status: 'Error',
      errorMessage: 'can not request in the middle of another request'
    }
  }

  let customerCurrentOrder = (await firebase.database().ref(`/users/${uid}/state/currentOrder`).once('value')).val();

  if (customerCurrentOrder) {
    firebase.database().ref(`users/${uid}/lock`).remove()
    return {
      status: "Error",
      errorMessage: "Customer is already in another taxi"
    }
  }

  try{
    notification.notifyDriversNewRequest(firebase, data.from.address.split(',')[0]);
    //notification.notifyDriversNewRequest(firebase, data.from.split(',')[0]);
  }catch(e){
    console.log(e);
  }

 
  let user = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();
  
    let payload = {
      from: data.from,
      to: data.to,
      distance: data.distance,
      duration: data.duration,
      estimatedPrice: data.estimatedPrice,
      customer: {
        id: uid,
        name: user.displayName.split(' ')[0],
        image: user.photo
      },
      orderType: "taxi",
      status: "lookingForTaxi",
      orderTime: (new Date()).toUTCString(),
      paymentType: data.paymentType,
      routeInformation: {
        duration: data.duration,
        distance: data.distance,
      }
    }
    let orderRef = await firebase.database().ref(`/orders/taxi`).push(payload);
    firebase.database().ref(`/users/${uid}/orders/${orderRef.key}`).set(payload);
    firebase.database().ref(`/openOrders/taxi/${orderRef.key}`).set(payload);
    firebase.database().ref(`/users/${uid}/state/currentOrder`).set(orderRef.key);
    let chat = {
      participants: {},
      chatType: "order",
      orderType: "taxi"
    }
    chat.participants[uid] = {
      name: user.displayName.split(' ')[0],
      image: user.photo,
      particpantType: "customer",
      phoneNumber: (user.phoneNumber) ? user.phoneNumber : null
    }
    firebase.database().ref(`/chat/${orderRef.key}`).set(chat);
    firebase.database().ref(`users/${uid}/lock`).remove()

    // insert order
    async function addOrder(){
      let req = await hasura.insertOrder({
        order:{
          orderId: orderRef.key,
          customerId: uid,
          orderTime: payload.orderTime,
          finalStatus: payload.status
        }
      })
      if(req.status == 'Success'){
        console.log('order inserted successfully in DB');
      }
    }
    await addOrder()

    return{
      status: "Success",
      orderId: orderRef.key
  }
}
  
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
  //update order
  async function updateCancellingOrder(){
    let req = await hasura.updateOrder({
      orderId: orderId,
      changes:{
        finalStatus:update.status,
        rideFinishTime: update.rideFinishTime,
        cancellationParty: update.cancelledBy
      } 
    })
    if(req.status == 'Success'){
      console.log('cancelled order updated successfully in DB');
    }
   
    
  }
  await updateCancellingOrder()
  firebase.database().ref(`/chat/${orderId}`).remove()
  await firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  return {
    status: "Success", 
    message: 'cancelled by customer'
  };
}

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
  async function updateExpiringOrder(){
     let req = await hasura.updateOrder({
      orderId: orderId,
      changes:{
        finalStatus: order.status,
        rideFinishTime: order.rideFinishTime,
      } 
    }) 
    if(req.status == 'Success'){
      console.log('expired order updated successfully in DB');
    }
    
  }
  await updateExpiringOrder()

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

async function accept(firebase, data, uid) {
  if (!data.orderId) {
    return {
      status: "Error",
      errorMessage: "Required orderId"
    }
  }

  let driverState = (await firebase.database().ref(`/taxiDrivers/${uid}/state`).once('value')).val();
  if (!driverState || driverState.authorizationStatus != "authorized") {
    return {
      status: "Error",
      errorMessage: "User is not an authorized driver"
    }
  }

  if (driverState.currentOrder) {
    return {
      status: "Error",
      errorMessage: "Driver is already in another taxi"
    }
  }

  driver = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();
  // while(true){
  //   let time = Date.now()
  //   time = time%10000
  //   time = time/1000
  //   if(time == 0){
  //     break
  //   }
  //     // break
  // }
  // console.log("accepted ", Date.now()%60000)

  let response = await firebase.database().ref(`/orders/taxi/${data.orderId}`).transaction(function(order){
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
      status: "Error",
      errorMessage: "Order is locked in another request"
    };
  }
  let order = response.snapshot.val();
  
  if (order.customer.id == uid) {
    firebase.database().ref(`orders/taxi/${data.orderId}/lock`).remove()
    return {
      status: "Error",
      errorMessage: "Driver and Customer cannot have same id"
    }
  }
  
  if (order.status != "lookingForTaxi" ) {
    firebase.database().ref(`orders/taxi/${data.orderId}/lock`).remove()
    return {
      status: "Error",
      errorMessage: `${data.orderId} status is not lookingForTaxi but ${order.status}`
    };
  }

  order.status = 'onTheWay';
  order.acceptRideTime = (new Date()).toUTCString()
  order.driver = {
    id: uid,
    name: driver.displayName.split(' ')[0],
    image: driver.photo,
    taxiNumber: (driver.taxiNumber) ? driver.taxiNumber : null,
  }

  firebase.database().ref(`/orders/taxi/${data.orderId}`).update(order);
  firebase.database().ref(`/taxiDrivers/${uid}/orders/${data.orderId}`).set(order);
  firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).set(data.orderId)
  firebase.database().ref(`/users/${order.customer.id}/orders/${data.orderId}`).update({
    driver: order.driver,
    acceptRideTime: order.acceptRideTime,
    status: order.status,
    taxiNumber: (driver.taxiNumber) ? driver.taxiNumber : null
  });
  firebase.database().ref(`/inProcessOrders/taxi/${data.orderId}`).set({driver: order.driver, customer: order.customer});
  firebase.database().ref(`/openOrders/taxi/${data.orderId}`).remove();
  firebase.database().ref(`/chat/${data.orderId}/participants/${uid}`).set({
    name: driver.displayName.split(' ')[0],
    image: driver.photo,
    particpantType: "taxi",
    phoneNumber: (driver.phoneNumber) ? driver.phoneNumber : null,
    taxiNumber: (driver.taxiNumber) ? driver.taxiNumber : null
  });

  notification.push(firebase, order.customer.id, {
    notificationType: "orderStatusChange",
    orderId: data.orderId,
    orderType: order.orderType,
    status: order.status,
    driver: order.driver,
    time: order.acceptRideTime
  })
  order = (await firebase.database().ref(`/orders/taxi/${data.orderId}`).once('value')).val()
  //update accepting order
  async function updateAcceptingOrder(){
     let req = await hasura.updateOrder({
      orderId: data.orderId,
      changes:{
        finalStatus: order.status,
        acceptRideTime: order.acceptRideTime,
        driverId: order.driver.id
      } 
    }) 
    if(req.status == 'Success'){
      console.log('accepted order updated successfully in DB');
    }
    
  }
  await updateAcceptingOrder()

  //update user
//   async function updateDriver(){
//     let req = await hasura.updateUser({
//      uid: uid,
//      changes:{
//        driver: true
//      } 
//    }) 
//    if(req.status == 'Success'){
//      console.log('driver is updated successfully in DB');
//    }
   
//  }
//  await updateDriver()

  firebase.database().ref(`orders/taxi/${data.orderId}/lock`).remove()
  return {
    status: "Success",
    func: "accepted"
  };
}

async function cancelTaxiFromDriver(firebase, uid, data) {
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
  async function updateCancelledOrder(){
    let req = await hasura.updateOrder({
     orderId: orderId,
     changes:{
       finalStatus: order.status,
       rideFinishTime: order.rideFinishTime,
       cancellationParty: order.cancelledBy,
       cancellationReason: order.reason
     } 
   }) 
   if(req.status == 'Success'){
     console.log('cancelling order by driver is successfully updated in DB');
   }
   
 }
 await updateCancelledOrder()

  //removing driver from chat node
  await firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  return {
    status: "Success",
    message: 'cancelled by driver'
  };

}

async function start(firebase, uid) {
  
  let orderId = (await firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).once('value')).val();
  console.log('the order id', orderId);
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
    rideStartTime: (new Date()).toUTCString()
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
  async function updateStartingOrder(){
    let req = await hasura.updateOrder({
     orderId: orderId,
     changes:{
       finalStatus: order.status,
       rideStartTime: order.rideStartTime,
     } 
   }) 
   if(req.status == 'Success'){
     console.log('started order is successfully updated in DB');
   }
   
 }
 await updateStartingOrder()
  firebase.database().ref(`/orders/taxi/${orderId}/lock`).remove()
  return {
    status: "Success",
    message: "started"
  };
}

async function finish(firebase, uid) {
  
  let orderId = (await firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).once('value')).val();

  if (orderId == null) {
    return {
      status: "Error",
      errorMessage: "Driver has not accepted any ride"
    }
  }

  let response = await firebase.database().ref(`orders/taxi/${orderId}`).transaction(function(order){
    if(order != null){
      if(order.lock == null){
        order.lock = true
      } else{
        console.log('attempt to finish ride');
        return
      }
    }
    return order
  })

  if(!response.committed){
    return{
      status: 'Error',
      errorMessage: 'attempt to finish ride but locked'
    }
  }

  order = response.snapshot.val()
  
  if (order.status != "inTransit"){
    firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
    return {
      status: "Error",
      errorMessage: "Ride status is not inTransit but " + order.status
    }
  }

  let update = {
    status: "droppedOff",
    rideFinishTime: (new Date()).toUTCString()
  }
  firebase.database().ref(`/orders/taxi/${orderId}`).update(update)
  firebase.database().ref(`/users/${order.customer.id}/orders/${orderId}`).update(update);
  firebase.database().ref(`/taxiDrivers/${order.driver.id}/orders/${orderId}`).update(update);
  firebase.database().ref(`/taxiDrivers/${order.driver.id}/state/currentOrder`).remove()
  firebase.database().ref(`/users/${order.customer.id}/state/currentOrder`).remove()
  firebase.database().ref(`/inProcessOrders/taxi/${orderId}`).remove();
  firebase.database().ref(`/fulfilledOrders/${orderId}`).set(order)
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
 
  async function updateFinishingOrder(){
    let req = await hasura.updateOrder({
     orderId: orderId,
     changes:{
       finalStatus: order.status,
       rideFinishTime: order.rideFinishTime,
       estimatedRideTime: time 
     } 
   }) 
   if(req.status == 'Success'){
     console.log('finished order is successfully updated in DB');
   }
   
 }
 await updateFinishingOrder()


 promoters.checkCustomerIncentives(firebase, order.customer, order.driver)
 promoters.checkDriverIncentives(firebase, order.customer, order.driver)

 firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  return {
    status: "Success",
    message: "finished"
  };
}