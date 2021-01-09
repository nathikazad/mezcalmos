module.exports = { request, accept, finish }

//possible statuses: lookingForDriver, onTheWay, droppedOff
async function request(firebase, data, uid) {
	let payload = {}
  if(!data.to || !data.items) {
    return { status:"Error", errorMessage: "Required to, items location"}
  }
  // Check valid values for to
  payload.to = data.to;
  if(data.from) {
    // Check valid values for from
    payload.from = data.from;
  }
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
    orderType: "grocery", status: "lookingForDriver", orderTime: payload.orderTime
  });
  firebase.database().ref(`/openOrders/delivery/${orderRef.key}`).set({from:payload.from, to:payload.to, deliveryType: "grocery"})
  firebase.database().ref(`/chat/${orderRef.key}/participants/${uid}`).set({
    name: user.displayName.split(' ')[0],
    image: user.photo
  });
  firebase.database().ref(`/chat/${orderRef.key}/orderType`).set("grocery");
  return { status:"Success", orderId: orderRef.key}
}

async function accept(firebase, data, uid) {
  // TODO: dont let user accept second delivery order
  if(!data.orderId) {
    return { status:"Error", errorMessage: "Required orderId"}
  }

  let authorizedDeliveryDriver = (await firebase.database().ref(`/deliveryDrivers/${uid}/authorized`).once('value')).val();
  if(!authorizedDeliveryDriver) {
    return { status:"Error", errorMessage: "User is not an authorized"}
  }

  let driver = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();
  let response = await firebase.database().ref(`/orders/grocery/${data.orderId}`).transaction(function(order) {
    console.log(order)
    if (order != null) {
      console.log(order.status)
			if (order.status == "lookingForDriver"){ 
				console.log(`${data.orderId} lookingForDriver`)        
        order.status = 'onTheWay';
        order.acceptRideTime = (new Date()).toUTCString()
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
		return { status:"Error", reason:"Ride is not available, please try accepting another ride" };  
	} else {
    console.log(`${data.orderId} grocery request success`)
    firebase.database().ref(`/deliveryDrivers/${uid}/orders/${data.orderId}`).set(true);
    firebase.database().ref(`/openOrders/delivery/${data.orderId}`).remove();
    firebase.database().ref(`/chat/${data.orderId}/participants/${uid}`).set({
      name: driver.displayName.split(' ')[0],
      image: driver.photo
    });
		return { status:"Success" }; 
	}
}


async function finish(firebase, data, uid) {
  if(!data.orderId) {
    return { status:"Error", errorMessage: "Required orderId"}
  }
  
  let order = (await firebase.database().ref(`/orders/grocery/${data.orderId}`).once('value')).val();
  if (order.driver.id != uid) {
    return { status:"Error", errorMessage: "Driver id is not "+order.driver.id}
  }

  if (order.status != "onTheWay") {
    return { status:"Error", errorMessage: "Ride status is not inTransit but "+order.status}
  }

  firebase.database().ref(`/orders/grocery/${data.orderId}`).update({
    status: "droppedOff",
    rideFinishTime: (new Date()).toUTCString()
  })
}