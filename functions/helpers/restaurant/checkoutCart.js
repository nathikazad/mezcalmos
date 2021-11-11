
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
  if (!data.to || !data.paymentType) {
    return {
      status: "Error",
      errorMessage: `No to address or payment type`,
      errorCode: "invalidParams"
    }
  }

  // TODO limit number of active orders
  // let customerCurrentOrder = (await firebase.database().ref(`/customers/${uid}/state/currentOrders`).once('value')).val();
  // if (customerCurrentOrder && Object.keys(customerCurrentOrder).length >= 3) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in three orders",
  //     errorCode: "inMoreThanThreeOrders"
  //   }
  // }

  let restaurant = (await firebase.database().ref(`/restaurants/info/${data.serviceProviderId}`).once('value')).val();
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
    ...data,
    customer: {
      id: uid,
      name: user.displayName.split(' ')[0],
      image: user.photo
    },
    restaurant: {
      id: data.serviceProviderId,
      name: restaurant.details.name,
      image: restaurant.details.photo
    },
    orderType: "restaurant",
    status: "orderReceieved",
    orderTime: (new Date()).toISOString(),
  }

  let orderRef = await firebase.database().ref(`/orders/restaurant`).push(payload);
  await firebase.database().ref(`/customers/inProcessOrders/${uid}/${orderRef.key}`).set(payload);
  firebase.database().ref(`/restaurants/inProcessOrders/${data.serviceProviderId}/${orderRef.key}`).set(payload);
  firebase.database().ref(`/inProcessOrders/restaurant/${orderRef.key}`).set(payload);
  await firebase.database().ref(`/customers/info/${uid}/cart`).remove();

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
  chat.participants[data.serviceProviderId] = {
    name: restaurant.details.name,
    image: restaurant.details.photo,
    particpantType: "restaurant",
    phoneNumber: (restaurant.details.phoneNumber) ? restaurant.details.phoneNumber : null
  }
  firebase.database().ref(`/deliveryAdmins`).once('value', (snapshot) => {
    const deliveryAdmins = snapshot.val();
    for (var deliveryAdminId in deliveryAdmins) {
      chat.participants[deliveryAdminId] = {
        name: deliveryAdmins[deliveryAdminId].info.name,
        image: deliveryAdmins[deliveryAdminId].info.photo,
        particpantType: "deliveryAdmin",
      }
    }
    firebase.database().ref(`/chat/${orderRef.key}`).set(chat);
    notifyAdminsNewOrder(deliveryAdmins, firebase, orderRef.key, restaurant)
  });

  let response = { status: "Success", orderId: orderRef.key }
  return response
}

async function notifyAdminsNewOrder(admins, firebase, orderId, restaurant) {
  let message = {
    time: (new Date()).toISOString(),
    notificationType: "newOrder",
    orderType: "restaurant",
    orderId: orderId,
    restaurant: {
      name: restaurant.details.name,
      image: restaurant.details.photo
    }
  }
  for (let adminId in admins) {
    firebase.database().ref(`/notifications/deliveryAdmin/${adminId}`).push(message)
    let admin = admins[adminId]
    if (admin.notificationInfo) {
      let payload = {
        notification: {
          title: "Nueva Pedido",
          body: `Hay una nueva orden de alimento`,
          tag: "newOrder"
        }
      };
      let options = {
        collapse_key: "newOrder",
        priority: "high"
      }
      await firebase.messaging().sendToDevice(admin.notificationInfo.deviceNotificationToken, payload, options)
    }
  }
}