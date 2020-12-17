const functions = require("firebase-functions");
const admin = require("firebase-admin");
// import { GraphQLClient } from 'graphql-request'

admin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});


// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
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
  payload.status = "lookingForTaxi";
  payload.orderTime = (new Date()).toUTCString();
  let orderRef = await admin.database().ref(`/orders`).push(payload);
  await admin.database().ref(`/users/${context.auth.uid}/orders/${orderRef.key}`).set({
    orderType: "taxi", status: "lookingForTaxi", orderTime: payload.orderTime
  });
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