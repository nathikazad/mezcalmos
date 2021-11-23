const logger = require("firebase-functions/lib/logger")
const notification = require("../notification");

const functions = require("firebase-functions");
const firebase = require("firebase-admin");


const keys = require("../keys").keys()
const hasuraModule = require("../hasura");

const hasura = new hasuraModule.Hasura(keys.hasura);

module.exports = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let response = await accept(firebase, context.auth.uid, data, hasura)
  return response
});


async function accept(firebase, uid, data, hasura) {
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

  driver = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();

  let response = await firebase.database().ref(`/openOrders/taxi/${data.orderId}`).transaction(function (order) {
    if (order != null) {
      if (order.lock == true) {
        return
      } else {
        order.lock = true
        return order
      }
    }
    return order
  })

  try {
    if (!response.committed) {
      return {
        status: "Error",
        errorMessage: "Order is locked in another request"
      };
    }
    let order = response.snapshot.val();

    if (!order) {
      return {
        status: "Error",
        errorMessage: "Order is is not available anymore"
      };
    }

    if (order.customer.id == uid) {
      firebase.database().ref(`/openOrders/taxi/${data.orderId}/lock`).remove()
      return {
        status: "Error",
        errorMessage: "Driver and Customer cannot have same id"
      }
    }

    if (order.status != "lookingForTaxi") {
      firebase.database().ref(`openOrders/taxi/${data.orderId}/lock`).remove()
      return {
        status: "Error",
        errorMessage: `${data.orderId} status is not lookingForTaxi but ${order.status}`
      };
    }

    order.status = 'onTheWay';
    order.acceptRideTime = (new Date()).toISOString()
    order.driver = {
      id: uid,
      name: driver.displayName.split(' ')[0],
      image: driver.photo,
      taxiNumber: (driver.taxiNumber) ? driver.taxiNumber : null,
    }

    // firebase.database().ref(`/orders/taxi/${data.orderId}`).update(order);
    firebase.database().ref(`/taxiDrivers/${uid}/orders/${data.orderId}`).set(order);
    firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).set(data.orderId)
    firebase.database().ref(`/customers/inProcessOrders/${order.customer.id}/${data.orderId}`).update({
      driver: order.driver,
      acceptRideTime: order.acceptRideTime,
      status: order.status,
      taxiNumber: (driver.taxiNumber) ? driver.taxiNumber : null
    });
    firebase.database().ref(`/inProcessOrders/taxi/${data.orderId}`).set(order);
    firebase.database().ref(`/openOrders/taxi/${data.orderId}`).remove();
    notification.cancelNotificationsForOrderId(firebase, data.orderId);
    // let chat: Chat = await buildChat(uid, customerInfo, cart.serviceProviderId, restaurant.details.info, orderRef.key!);
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
    // cancel notification on all drivers who recieved order

    await hasura.updateOrder({
      orderId: data.orderId,
      changes: {
        finalStatus: order.status,
        acceptRideTime: order.acceptRideTime,
        driverId: order.driver.id,
        finalPrice: order.estimatedPrice
      }
    })
  } catch (e) {
    logger.error(e)
  }
  return {
    status: "Success",
    func: "accepted"
  };
}
  