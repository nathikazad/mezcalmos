module.exports = {
  request
}

//possible statuses: lookingForDeliverer, onTheWay, droppedOff
async function request(admin, data, uid) {
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
  let user = (await admin.database().ref(`/users/${uid}/info`).once('value')).val();
  payload.customer = {
    id: uid,
    name: user.displayName.split(' ')[0],
    image: user.photo
  }
  payload.orderType = "grocery";
  payload.status = "lookingForDeliverer";
  payload.orderTime = (new Date()).toUTCString();
  let orderRef = await admin.database().ref(`/orders/grocery`).push(payload);
  admin.database().ref(`/users/${uid}/orders/${orderRef.key}`).set({
    orderType: "grocery",
    status: "lookingForDeliverer",
    orderTime: payload.orderTime
  });
  admin.database().ref(`/openOrders/delivery/${orderRef.key}`).set({
    from: payload.from,
    to: payload.to,
    deliveryType: "grocery"
  })
  admin.database().ref(`/chat/${orderRef.key}/participants/${uid}`).set({
    name: user.displayName.split(' ')[0],
    image: user.photo
  });
  admin.database().ref(`/chat/${orderRef.key}/orderType`).set("grocery");
  return {
    status: "Success",
    orderId: orderRef.key
  }
}