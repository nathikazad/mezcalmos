const notification = require("../notification");
module.exports = ( firebase, uid, data ) => { return accept(firebase, uid, data) }

async function accept(firebase, uid, data) {
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

  let order = (await firebase.database().ref(`/orders/taxi/${data.orderId}`).once('value')).val();
  if (!order) {
    return {
      status: "Error",
      errorMessage: "Order does not exist"
    }
  }

  if (order.customer.id == uid) {
    return {
      status: "Error",
      errorMessage: "Driver and Customer cannot have same id"
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
  let response = await firebase.database().ref(`/orders/taxi/${data.orderId}`).transaction(function (order) {
    if (order != null) {
      if(order.lock == null){
        if (order.status == "lookingForTaxi" ) {
          order.lock = true,
          order.status = 'onTheWay';
          order.acceptRideTime = (new Date()).toUTCString()
          order.driver = {
            id: uid,
            name: driver.displayName.split(' ')[0],
            image: driver.photo,
            taxiNumber: (driver.taxiNumber) ? driver.taxiNumber : null,
          }
          return order
        } else {
          console.log(`${data.orderId} status is not lookingForTaxi but ${order.status}`)
          return;
        }
      } else {
        return
      }
    } 
    return order;
  })

  if (!response.committed) {
    //console.log(`${data.orderId} taxi request failure`)
    return {
      status: "Error",
      errorMessage: "Ride is not available, please try accepting another ride"
    };
  } else {
    let order = response.snapshot.val()
    //console.log(`${data.orderId} taxi request success`)
    firebase.database().ref(`/taxiDrivers/${uid}/orders/${data.orderId}`).set({
      customer: order.customer,
      acceptRideTime: order.acceptRideTime,
      status: order.status,
      routeInformation: {
        duration: order.duration,
        distance: order.distance,
      },
      estimatedPrice: order.estimatedPrice,
      paymentType: order.paymentType,
      to: order.to
    });
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
    firebase.database().ref(`orders/taxi/${data.orderId}/lock`).remove()
    return {
      status: "Success",
      func: "accept"
    };
  }
}