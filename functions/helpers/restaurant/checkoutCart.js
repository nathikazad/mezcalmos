
const functions = require("firebase-functions");
const firebase = require("firebase-admin");


const keys = require("../keys").keys()
const hasuraModule = require("../hasura");

const hasura = new hasuraModule.Hasura(keys.hasura)
module.exports = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  let response = await checkoutCart(context.auth.uid, data)
  return response
});


async function checkoutCart(uid, data) {

  if (!data.from || !data.paymentType) {
    return {
      status: "Error",
      errorMessage: `No from address or payment type`,
      errorCode: "invalidParams"
    }
  }

  // TODO
  // let customerCurrentOrder = (await firebase.database().ref(`/customers/${uid}/state/currentOrders`).once('value')).val();
  // if (customerCurrentOrder && Object.keys(customerCurrentOrder).length >= 3) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in three orders",
  //     errorCode: "inMoreThanThreeOrders"
  //   }
  // }

  let cart = (await firebase.database().ref(`/customers/info/${uid}/cart`).once('value')).val();
  if (cart == null) {
    return {
      status: "Error",
      errorMessage: `Cart does not exist`,
      errorCode: "cartDontExist"
    }
  }

  let restaurant = (await firebase.database().ref(`/restaurants/info/${cart.serviceProviderId}`).once('value')).val();
  if (restaurant == null) {
    return {
      status: "Error",
      errorMessage: `Invalid restaurant id`,
      errorCode: "invalidRestaurantId"
    }
  }

  if (restaurant.state.open == false) {
    return {
      status: "Error",
      errorMessage: `Restaurant is closed`,
      errorCode: "restaurantClosed"
    }
  }

  let user = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();

  let payload = {
    from: data.from,
    customer: {
      id: uid,
      name: user.displayName.split(' ')[0],
      image: user.photo
    },
    orderType: "restaurant",
    status: "preparingOrder",
    orderTime: (new Date()).toISOString(),
    paymentType: data.paymentType,
    ...cart
  }
  console.log(payload)
  let orderRef = await firebase.database().ref(`/orders/restaurant`).push(payload);
  firebase.database().ref(`/customers/orders/${uid}/${orderRef.key}`).set(payload);
  firebase.database().ref(`/restaurants/orders/${cart.serviceProviderId}/${orderRef.key}`).set(payload);
  firebase.database().ref(`/openOrders/restaurant/${orderRef.key}`).set(payload);

  let chat = {
    participants: {},
    chatType: "order",
    orderType: "restaurant"
  }
  chat.participants[uid] = {
    name: user.displayName.split(' ')[0],
    image: user.photo,
    particpantType: "customer",
    phoneNumber: (user.phoneNumber) ? user.phoneNumber : null
  }
  chat.participants[cart.serviceProviderId] = {
    name: restaurant.details.name,
    image: (restaurant.details.photo) ? restaurant.details.photo : null,
    particpantType: "restaurant",
    phoneNumber: (restaurant.details.phoneNumber) ? restaurant.details.phoneNumber : null
  }
  firebase.database().ref(`/chat/${orderRef.key}`).set(chat);
  await firebase.database().ref(`/customers/info/${uid}/cart`).remove();
  let response = { status: "Success", orderId: orderRef.key }
  return response
}