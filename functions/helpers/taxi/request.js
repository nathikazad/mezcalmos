

const notification = require("../notification");

module.exports = ( firebase, uid, data ) => { return request(firebase, uid, data) }

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
  // add try
  let request
  try{
    //request = await notification.notifyDriversNewRequest(firebase, data.from.address.split(',')[0]);
    request = await notification.notifyDriversNewRequest(firebase, data.from.split(',')[0]);
  }
  catch(e){
    console.log(e)
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
   // status: 'lookingForTaxi',
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
    particpantType: "customer",
    phoneNumber: (user.phoneNumber) ? user.phoneNumber : null
  }
  firebase.database().ref(`/chat/${orderRef.key}`).set(chat);
  return {
    status: "Success",
    orderId: orderRef.key
  }
}