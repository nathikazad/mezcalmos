module.exports = {
  request,
  cancelTaxiFromCustomer,
  accept,
  start,
  cancelTaxiFromDriver,
  finish
}

const { database } = require("firebase-admin");
const notification = require("./notification");

//possible statuses: lookingForTaxi, onTheWay, inTransit, droppedOff
async function request(firebase, uid, data) {
  // TODO: prevent user from sending another request before this finishes
  let customerCurrentOrder = (await firebase.database().ref(`/users/${uid}/state/currentOrder`).once('value')).val();

  if (customerCurrentOrder) {
    return {
      status: "Error",
      errorMessage: "Customer is already in another taxi"
    }
  }
  
  if (!data.from || !data.to || !data.distance || !data.duration 
    || !data.estimatedPrice || !data.paymentType) {
    return {
      status: "Error",
      errorMessage: "Required from, to, distance, duration, estimatedPrice and paymentType"
    }
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
    paymentType: data.paymentType
  }

  let orderRef = await firebase.database().ref(`/orders/taxi`).push(payload);
  firebase.database().ref(`/users/${uid}/orders/${orderRef.key}`).set({
    orderType: "taxi",
    status: "lookingForTaxi",
    orderTime: payload.orderTime,
    routeInformation: {
      duration: payload.duration,
      distance: payload.distance,
    },
    estimatedPrice: payload.estimatedPrice,
    paymentType: payload.paymentType,
    to: payload.to,
    from: payload.from,

  });
  firebase.database().ref(`/openOrders/taxi/${orderRef.key}`).set({
    from: payload.from,
    to: payload.to,
    customer: payload.customer,
    routeInformation: {
      duration: payload.duration,
      distance: payload.distance,
    },
    orderTime: payload.orderTime,
    estimatedPrice: payload.estimatedPrice,
    paymentType: payload.paymentType
  });
  firebase.database().ref(`/users/${uid}/state/currentOrder`).set(orderRef.key);
  let chat = {
    participants: {},
    chatType: "order",
    orderType: "taxi"
  }
  chat.participants[uid] = {
    name: user.displayName.split(' ')[0],
    image: user.photo,
    particpantType: "customer"
  }
  firebase.database().ref(`/chat/${orderRef.key}`).set(chat);
  notification.notifyDriversNewRequest(firebase);
  return {
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

  let order = (await firebase.database().ref(`/orders/taxi/${orderId}`).once('value')).val();
  if (order == null) {
    return {
      status: "Error",
      errorMessage: "System Error, customer's current order id does not match any order"
    }
  }

  if (order.status != "lookingForTaxi" && order.status != "onTheWay" && order.status != "inTransit") {
    return {
      status: "Error",
      errorMessage: "Ride status is not in lookingForTaxi or onTheWay or inTransit"
    }
  }

  await firebase.database().ref(`/users/${order.customer.id}/state/currentOrder`).remove()

  if(order.status == "lookingForTaxi" ) {
    firebase.database().ref(`/openOrders/taxi/${orderId}`).remove();
    firebase.database().ref(`/orders/taxi/${orderId}`).remove()
    firebase.database().ref(`/users/${order.customer.id}/orders/${orderId}`).remove();
  } else if (order.status == "onTheWay" || order.status == "inTransit") {
    let update = {
      status: "cancelled",
      rideFinishTime: (new Date()).toUTCString(),
      cancelledBy: "customer"
    }
    update.reason = (data.reason) ? data.reason : null
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
  if(data.createAnotherOrder) {
    let response = await request(firebase, uid, order)
    return response
  } else {
    return {
      status: "Success"
    };
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
  let response = await firebase.database().ref(`/orders/taxi/${data.orderId}`).transaction(function (order) {
    if (order != null) {
      if (order.status == "lookingForTaxi") {
        order.status = 'onTheWay';
        order.acceptRideTime = (new Date()).toUTCString()
        order.driver = {
          id: uid,
          name: driver.displayName.split(' ')[0],
          image: driver.photo
        }
        return order
      } else {
        console.log(`${data.orderId} status is not lookingForTaxi but ${order.status}`)
        return;
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
      status: order.status
    });
    firebase.database().ref(`/inProcessOrders/taxi/${data.orderId}`).set({driver: order.driver, customer: order.customer});
    firebase.database().ref(`/openOrders/taxi/${data.orderId}`).remove();
    firebase.database().ref(`/chat/${data.orderId}/participants/${uid}`).set({
      name: driver.displayName.split(' ')[0],
      image: driver.photo,
      particpantType: "taxi"
    });

    notification.push(firebase, order.customer.id, {
      notificationType: "orderStatusChange",
      orderId: data.orderId,
      orderType: order.orderType,
      status: order.status,
      driver: order.driver,
      time: order.acceptRideTime
    })
    return {
      status: "Success"
    };
  }
}

async function cancelTaxiFromDriver(firebase, uid, data) {
  let orderId = (await firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).once('value')).val();
  if (orderId == null) {
    return {
      status: "Error",
      errorMessage: "Driver has not accepted any ride"
    }
  }

  let order = (await firebase.database().ref(`/orders/taxi/${orderId}`).once('value')).val();
  if (order == null) {
    return {
      status: "Error",
      errorMessage: "System Error, customer's current order id does not match any order"
    }
  }

  if (order.status != "onTheWay" && order.status != "inTransit") {
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

  
  update.notificationType = "orderStatusChange"
  update.orderId = orderId
  update.orderType = "taxi"
  update.time = update.rideFinishTime
  delete update.rideFinishTime
  notification.push(firebase, order.customer.id, update)

  return {
    status: "Success"
  };

}

async function start(firebase, uid) {
  
  let orderId = (await firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).once('value')).val();
  if (orderId == null) {
    return {
      status: "Error",
      errorMessage: "Driver has not accepted any ride"
    }
  }

  let order = (await firebase.database().ref(`/orders/taxi/${orderId}`).once('value')).val();
  if (order == null) {
    return {
      status: "Error",
      errorMessage: "Order id does not match any order"
    }
  } 
 
  if (order.status != "onTheWay") {
    return {
      status: "Error",
      errorMessage: "Ride status is not onTheWay but " + order.status
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
  return {
    status: "Success"
  };
}

async function finish(firebase, orderId) {
  console.log(`/orders/taxi/${orderId}`)
  let order = (await firebase.database().ref(`/orders/taxi/${orderId}`).once('value')).val();
  if (order == null) {
    return {
      status: "Error",
      errorMessage: "Order id does not match any order"
    }
  }

  if (order.status != "inTransit") {
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
  update.notificationType = "orderStatusChange"
  update.orderId = orderId
  update.orderType = "taxi"
  update.time = update.rideFinishTime
  delete update.rideFinishTime
  notification.push(firebase, order.customer.id, update)
  return {
    status: "Success"
  };
}