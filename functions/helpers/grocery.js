module.exports = { request }

//possible statuses: lookingForDeliverer, onTheWay, droppedOff
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
  payload.status = "lookingForDeliverer";
  payload.orderTime = (new Date()).toUTCString();
  let orderRef = await firebase.database().ref(`/orders/grocery`).push(payload);
  firebase.database().ref(`/users/${uid}/orders/${orderRef.key}`).set({
    orderType: "grocery", status: "lookingForDeliverer", orderTime: payload.orderTime
  });
  firebase.database().ref(`/openOrders/delivery/${orderRef.key}`).set({from:payload.from, to:payload.to, deliveryType: "grocery"})
  firebase.database().ref(`/chat/${orderRef.key}/participants/${uid}`).set({
    name: user.displayName.split(' ')[0],
    image: user.photo
  });
  firebase.database().ref(`/chat/${orderRef.key}/orderType`).set("grocery");
  return { status:"Success", orderId: orderRef.key}
}