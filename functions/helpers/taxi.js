module.exports = {
  request,
  accept,
  start,
  finish
}

const notification = require("./notification");

//possible statuses: lookingForTaxi, onTheWay, inTransit, droppedOff
async function request(firebase, data, uid) {
  let payload = {}
  if (!data.from) {
    return {
      status: "Error",
      errorMessage: "Required from location"
    }
  }
  // Check valid values for from
  payload.from = data.from;
  if (data.to) {
    // Check valid values for to
    payload.to = data.to;
  }
  if (data.distance) {
    // Check valid values for to
    payload.distance = data.distance;
  }
  if (data.duration) {
    // Check valid values for to
    payload.duration = data.duration;
  }
  let user = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();
  payload.customer = {
    id: uid,
    name: user.displayName.split(' ')[0],
    image: user.photo
  }
  payload.orderType = "taxi";
  payload.status = "lookingForTaxi";
  payload.orderTime = (new Date()).toUTCString();
  let orderRef = await firebase.database().ref(`/orders/taxi`).push(payload);
  firebase.database().ref(`/users/${uid}/orders/${orderRef.key}`).set({
    orderType: "taxi",
    status: "lookingForTaxi",
    orderTime: payload.orderTime
  });
  firebase.database().ref(`/openOrders/taxi/${orderRef.key}`).set({
    from: payload.from,
    to: payload.to,
    customer: payload.customer,
    routeInformation: {
      duration: payload.duration,
      distance: payload.distance
    }
  });
  let chat = {
    participants: {},
    chatType: "order",
    orderType: "taxi"
  }
  chat.participants[uid] = {
    name: user.displayName.split(' ')[0],
    image: user.photo
  }
  firebase.database().ref(`/chat/${orderRef.key}`).set(chat);
  return {
    status: "Success",
    orderId: orderRef.key
  }
}

async function accept(firebase, data, uid) {
  if(!data.orderId) {
    return { status:"Error", errorMessage: "Required orderId"}
  }

  let driverState = (await firebase.database().ref(`/taxiDrivers/${uid}/state`).once('value')).val();
  if(!driverState.authorized) {
    return { status:"Error", errorMessage: "User is not an authorized driver"}
  }

  if(driverState.inTaxi) {
    return { status:"Error", errorMessage: "Driver is already in another taxi"}
  }

  let order = (await firebase.database().ref(`/orders/taxi/${data.orderId}`).once('value')).val();
  if(!order) {
    return { status:"Error", errorMessage: "Order does not exist"}
  }

  

  driver = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();
  let response = await firebase.database().ref(`/orders/taxi/${data.orderId}`).transaction(function(order) {
    console.log(order)
    if (order != null) {
      console.log(order.status)
      if (order.status == "lookingForTaxi") {
        console.log(`${data.orderId} lookingForTaxi`)
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
    console.log(`${data.orderId} taxi request failure`)
    return {
      status: "Error",
      reason: "Ride is not available, please try accepting another ride"
    };
  } else {
    let order = response.snapshot.val()
    console.log(`${data.orderId} taxi request success`)
    firebase.database().ref(`/taxiDrivers/${uid}/orders/${data.orderId}`).set({
      customer: order.customer,
      acceptRideTime: order.acceptRideTime,
      status: order.status
    });
    firebase.database().ref(`/taxiDrivers/${uid}/state/inTaxi`).set(data.orderId)
    firebase.database().ref(`/users/${order.customer.id}/orders/${data.orderId}`).update({
      driver: order.driver,
      acceptRideTime: order.acceptRideTime,
      status: order.status
    });
    firebase.database().ref(`/openOrders/taxi/${data.orderId}`).remove();
    firebase.database().ref(`/chat/${data.orderId}/participants/${uid}`).set({
      name: driver.displayName.split(' ')[0],
      image: driver.photo
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

async function start(firebase, data, uid) {
  if (!data.orderId) {
    return {
      status: "Error",
      errorMessage: "Required orderId"
    }
  }

  let order = (await firebase.database().ref(`/orders/taxi/${data.orderId}`).once('value')).val();
  if (order.driver.id != uid) {
    return {
      status: "Error",
      errorMessage: "Driver id is not " + order.driver.id
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
  firebase.database().ref(`/orders/taxi/${data.orderId}`).update(update)
  firebase.database().ref(`/users/${order.customer.id}/orders/${data.orderId}`).update(update);
  firebase.database().ref(`/taxiDrivers/${order.driver.id}/orders/${data.orderId}`).update(update);

  update.notificationType = "orderStatusChange"
  update.orderType = "taxi"
  update.orderId = data.orderId
  update.time = update.rideStartTime
  delete update.rideStartTime
  notification.push(firebase, order.customer.id, update)
  return {
    status: "Success"
  };
}

async function finish(firebase, data, uid) {
  if (!data.orderId) {
    return {
      status: "Error",
      errorMessage: "Required orderId"
    }
  }

  let order = (await firebase.database().ref(`/orders/taxi/${data.orderId}`).once('value')).val();
  if (order.driver.id != uid) {
    return {
      status: "Error",
      errorMessage: "Driver id is not " + order.driver.id
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
  firebase.database().ref(`/orders/taxi/${data.orderId}`).update(update)
  firebase.database().ref(`/users/${order.customer.id}/orders/${data.orderId}`).update(update);
  firebase.database().ref(`/taxiDrivers/${order.driver.id}/orders/${data.orderId}`).update(update);
  firebase.database().ref(`/taxiDrivers/${order.driver.id}/state/inTaxi`).remove()
  update.notificationType = "orderStatusChange"
  update.orderId = data.orderId
  update.orderType = "taxi"
  update.time = update.rideFinishTime
  delete update.rideFinishTime
  notification.push(firebase, order.customer.id, update)
  return {
    status: "Success"
  };
}