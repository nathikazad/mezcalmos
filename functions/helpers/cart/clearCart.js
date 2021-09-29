const functions = require("firebase-functions");
const firebase = require("firebase-admin");


const keys = require("../keys").keys()
const hasuraModule = require("../hasura");

module.exports = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  let response = await clearCart(context.auth.uid, data)
  return response
});



async function clearCart(uid, data) {

  let cart = (await firebase.database().ref(`/users/${uid}/cart`).once('value')).val();
  if (cart == null) {
    return {
      status: "Error",
      errorMessage: `Cart does not exist`,
      errorCode: 1002
    }
  }

  await firebase.database().ref(`/users/${uid}/cart`).remove();

  let response = { status: "Success" }
  return response
}