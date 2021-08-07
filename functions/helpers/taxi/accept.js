const notification = require("../notification");


module.exports = ( firebase, uid, data, hasura) => { return accept(firebase, uid, data, hasura) }
async function accept(firebase, uid, data, hasura) {
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
    
      await hasura.updateOrder({
        orderId: data.orderId,
        changes:{
          finalStatus: order.status,
          acceptRideTime: order.acceptRideTime,
          driverId: order.driver.id
        } 
      }) 
     
    firebase.database().ref(`orders/taxi/${data.orderId}/lock`).remove()
    return {
      status: "Success",
      func: "accepted"
    };
  }
  