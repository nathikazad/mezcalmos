module.exports = {
  request,
  accept,
  itemsPicked,
  finish
}

//possible statuses: lookingForDriver, onTheWayToStore, itemsPickedUp, droppedOff
async function request(firebase, data, uid) {
  let payload = {}
  if (!data.to || !data.items) {
    return {
      status: "Error",
      errorMessage: "Required to, items location"
    }
  }
  // Check valid values for to
  payload.to = data.to;

  // Check valid values for from
  payload.from = data.from || null;

  payload.items = data.items
  payload.notes = data.notes
  let user = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();
  payload.customer = {
    id: uid,
    name: user.displayName.split(' ')[0],
    image: user.photo
  }
  payload.orderType = "grocery";
  payload.status = "lookingForDriver";
  payload.orderTime = (new Date()).toUTCString();
  let orderRef = await firebase.database().ref(`/orders/grocery`).push(payload);
  firebase.database().ref(`/users/${uid}/orders/${orderRef.key}`).set({
    orderType: "grocery",
    status: "lookingForDriver",
    orderTime: payload.orderTime
  });
  firebase.database().ref(`/openOrders/delivery/${orderRef.key}`).set({
    from: payload.from,
    to: payload.to,
    customer: payload.customer,
    deliveryType: "grocery"
  })
  let chat = {
    participants: {},
    orderType: "grocery"
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
  // TODO: dont let user accept second delivery order
  if (!data.orderId) {
    return {
      status: "Error",
      errorMessage: "Required orderId"
    }
  }

  let authorizedDeliveryDriver = (await firebase.database().ref(`/deliveryDrivers/${uid}/authorized`).once('value')).val();
  if (!authorizedDeliveryDriver) {
    return {
      status: "Error",
      errorMessage: "User is not an authorized"
    }
  }

  let driver = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();
  let response = await firebase.database().ref(`/orders/grocery/${data.orderId}`).transaction(function (order) {
    console.log(order)
    if (order != null) {
      console.log(order.status)
      if (order.status == "lookingForDriver") {
        console.log(`${data.orderId} lookingForDriver`)
        order.status = 'onTheWayToStore';
        order.acceptOrderTime = (new Date()).toUTCString()
        order.driver = {
          id: uid,
          name: driver.displayName.split(' ')[0],
          image: driver.photo
        }
        return order
      } else {
        console.log(`${data.orderId} status is not lookingForDriver but ${order.status}`)
        return;
      }
    }
    return order;
  })

  if (!response.committed) {
    console.log(`${data.orderId} grocery request failure`)
    return {
      status: "Error",
      reason: "Ride is not available, please try accepting another ride"
    };
  } else {
    let order = response.snapshot.val()
    firebase.database().ref(`/deliveryDrivers/${uid}/orders/grocery/${data.orderId}`).set({
      customer: order.customer,
      acceptOrderTime: order.acceptOrderTime,
      status: order.status,
      deliveryType: "grocery"
    });
    firebase.database().ref(`/users/${order.customer.id}/orders/${data.orderId}`).update({
      driver: order.driver,
      acceptOrderTime: order.acceptOrderTime,
      status: order.status
    });

    firebase.database().ref(`/openOrders/delivery/${data.orderId}`).remove();
    firebase.database().ref(`/chat/${data.orderId}/participants/${uid}`).set({
      name: driver.displayName.split(' ')[0],
      image: driver.photo
    });

    firebase.database().ref(`/notifications/${order.customer.id}`).push({
      notificationType: "orderStatusChange",
      orderId: data.orderId,
      status: order.status,
      driver: order.driver,
      time: order.acceptOrderTime,
    })
    return {
      status: "Success"
    };
  }
}

async function itemsPicked(firebase, data, uid) {
  // TODO: Get total item cost and the items that were picked
  if (!data.orderId) {
    return {
      status: "Error",
      errorMessage: "Required orderId"
    }
  }

  let order = (await firebase.database().ref(`/orders/grocery/${data.orderId}`).once('value')).val();
  if (order.driver.id != uid) {
    return {
      status: "Error",
      errorMessage: "Driver id is not " + order.driver.id
    }
  }

  if (order.status != "onTheWayToStore") {
    return {
      status: "Error",
      errorMessage: "Ride status is not onTheWayToStore but " + order.status
    }
  }

  let update = {
    status: "itemsPickedUp",
    itemsPickedTime: (new Date()).toUTCString()
  }
  firebase.database().ref(`/orders/grocery/${data.orderId}`).update(update)
  firebase.database().ref(`/users/${order.customer.id}/orders/${data.orderId}`).update(update);
  firebase.database().ref(`/deliveryDrivers/${order.driver.id}/orders/grocery/${data.orderId}`).update(update);

  update.notificationType = "orderStatusChange"
  update.orderId = data.orderId
  update.time = update.itemsPickedTime
  delete update.itemsPickedTime
  firebase.database().ref(`/notifications/${order.customer.id}`).push(update)
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

  let order = (await firebase.database().ref(`/orders/grocery/${data.orderId}`).once('value')).val();
  if (order.driver.id != uid) {
    return {
      status: "Error",
      errorMessage: "Driver id is not " + order.driver.id
    }
  }

  if (order.status != "itemsPickedUp") {
    return {
      status: "Error",
      errorMessage: "Ride status is not itemsPickedUp but " + order.status
    }
  }

  let update = {
    status: "droppedOff",
    deliveryTime: (new Date()).toUTCString()
  }
  firebase.database().ref(`/orders/grocery/${data.orderId}`).update(update)
  firebase.database().ref(`/users/${order.customer.id}/orders/${data.orderId}`).update(update);
  firebase.database().ref(`/deliveryDrivers/${order.driver.id}/orders/grocery/${data.orderId}`).update(update);

  update.notificationType = "orderStatusChange"
  update.orderId = data.orderId
  update.time = update.deliveryTime
  delete update.deliveryTime
  firebase.database().ref(`/notifications/${order.customer.id}`).push(update)

  return {
    status: "Success"
  };
}