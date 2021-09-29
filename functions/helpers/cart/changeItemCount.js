const functions = require("firebase-functions");
const firebase = require("firebase-admin");


const keys = require("../keys").keys()
const hasuraModule = require("../hasura");

module.exports = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  let response = await changeItemCount(context.auth.uid, data)
  return response
})

async function changeItemCount(uid, data) {
  if (!data.itemId || !data.countChange) {
    return {
      status: "Error",
      errorMessage: "Required itemId and countChange",
      errorCode: 1001
    }
  }

  let cart = (await firebase.database().ref(`/users/${uid}/cart`).once('value')).val();
  if (cart == null) {
    return {
      status: "Error",
      errorMessage: `Cart does not exist`,
      errorCode: 1002
    }
  } else if (cart.items[data.itemId] == null) {
    return {
      status: "Error",
      errorMessage: `Cart does not have itemId ${data.itemId}`,
      errorCode: 1003
    }
  }
  cart.items[data.itemId].quantity += parseInt(data.countChange)
  cart.items[data.itemId].totalCost += cart.items[data.itemId].costPerOne * parseInt(data.countChange)
  cart.total += cart.items[data.itemId].costPerOne * parseInt(data.countChange)

  if (cart.items[data.itemId].quantity <= 0) {
    delete cart.items[data.itemId]
  }
  await firebase.database().ref(`/users/${uid}/cart`).update(cart);

  let response = { status: "Success" }
  return response
}