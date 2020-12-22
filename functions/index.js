const functions = require("firebase-functions");
const admin = require("firebase-admin");
// import { GraphQLClient } from 'graphql-request'

admin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});


// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
  await admin.database().ref(`/users/${user.uid}`).set(
    {displayName:user.displayName,
     photo:user.photoURL,
     email:user.email,
     fbuid:user.providerData[0].uid});
  return setHasura(user.uid);
});

exports.addHasuraClaims = functions.https.onCall(async (data, context) => {
  return setHasura(context.auth.uid);
});

async function setHasura(uid) {
  try {
    const customClaims = {
      "https://hasura.io/jwt/claims": {
        "x-hasura-default-role": "user",
        "x-hasura-allowed-roles": ["user"], // add admin role for admin users
        "x-hasura-user-id": uid
      }
    };
    await admin.auth().setCustomUserClaims(uid, customClaims)
    return { status: "success", user: context.auth.uid }
  } catch (error) {
    console
    return { status: "failure", message: error }
  }
}

exports.requestTaxi = functions.https.onCall(async (data, context) => {
  let payload = {}
  if(!data.from) {
    return { status:"Error", errorMessage: "Required from location"}
  }
  // Check valid values for from
  payload.from = data.from;
  if(data.to) {
    // Check valid values for to
    payload.to = data.to;
  }
  payload.clientId = context.auth.uid;
  payload.orderType = "taxi";
  payload.status = "lookingForDriver";
  payload.orderTime = (new Date()).toUTCString();
  let orderRef = await admin.database().ref(`/orders`).push(payload);
  await admin.database().ref(`/users/${context.auth.uid}/orders/${orderRef.key}`).set({
    orderType: "taxi", status: "lookingForTaxi", orderTime: payload.orderTime
  });
  return { status:"Success", orderId: orderRef.key}
});

exports.requestGrocery = functions.https.onCall(async (data, context) => {
  console.log("Request Grocery cloud")
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
  payload.clientId = context.auth.uid;
  payload.orderType = "grocery";
  payload.status = "lookingForDriver";
  payload.orderTime = (new Date()).toUTCString();
  let orderRef = await admin.database().ref(`/orders`).push(payload);
  await admin.database().ref(`/users/${context.auth.uid}/orders/${orderRef.key}`).set({
    orderType: "grocery", status: "lookingForDeliverer", orderTime: payload.orderTime
  });
  return { status:"Success", orderId: orderRef.key}
});

exports.sendMessage = functions.https.onCall(async (data, context) => {
  let newMessage = {}
  if(!data.message || !data.orderId) {
    return { status:"Error", errorMessage: "Required message and orderId field"}
  }
  // TODO: Check if user has permission to write
  newMessage.senderId = context.auth.uid;
  newMessage.message = data.message;
  newMessage.time = (new Date()).toUTCString();
  let orderRef = await admin.database().ref(`/orders/${data.orderId}/messages`).push(newMessage);
  // TODO: add notification
  return { status:"Success", orderId: orderRef.key}
});

// // from https://github.com/leoalves/hasura-firebase-auth
// exports.authorizedHasuraOperation = functions.https.onCall(async (data, context) => {
//   export const query = `
//     query
//     `
//   try {
//     // set from cli using 
//     // firebase functions:config:set hasura.host="HOST ADDRESS" hasura.adminSecret="ADMIN SECRET"
//     const client = new GraphQLClient(functions.config().hasura.host, {
//       headers: { 'x-hasura-admin-secret': functions.config().hasura.adminSecret }
//     })
//     const result = await client.request(query, {
//       // query variables
//       uid: context.auth.uid,
//     })
//     if (hasuraUser) {
//       return { status: "success", result: result }
//     } else {
//       throw new Error('Error running query')
//     }

//   } catch (error) {
//     console
//     return { status: "failure", message: error }
//   }
// });