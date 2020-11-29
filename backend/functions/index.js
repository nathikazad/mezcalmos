const functions = require("firebase-functions");
const admin = require("firebase-admin");
import { GraphQLClient } from 'graphql-request'

admin.initializeApp(functions.config().firebase);

// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
  const customClaims = {
    "https://hasura.io/jwt/claims": {
      "x-hasura-default-role": "user",
      "x-hasura-allowed-roles": ["user"],
      "x-hasura-user-id": user.uid
    }
  };
  try {
    let auth = await admin.auth()
    await auth.setCustomUserClaims(user.uid, customClaims)
    return { status: "success" }
  } catch (error) {
    return { status: "failure", message: error }
  }

});

exports.addHasuraClaims = functions.https.onCall(async (data, context) => {
  try {
    const customClaims = {
      "https://hasura.io/jwt/claims": {
        "x-hasura-default-role": "user",
        "x-hasura-allowed-roles": ["user"], // add admin role for admin users
        "x-hasura-user-id": context.auth.uid
      }
    };
    await admin.auth().setCustomUserClaims(context.auth.uid, customClaims)
    return { status: "success", user: context.auth.uid }
  } catch (error) {
    console
    return { status: "failure", message: error }
  }
});

// from https://github.com/leoalves/hasura-firebase-auth
exports.authorizedHasuraOperation = functions.https.onCall(async (data, context) => {
  export const query = `
    query
    `
  try {
    // set from cli using 
    // firebase functions:config:set hasura.host="HOST ADDRESS" hasura.adminSecret="ADMIN SECRET"
    const client = new GraphQLClient(functions.config().hasura.host, {
      headers: { 'x-hasura-admin-secret': functions.config().hasura.adminSecret }
    })
    const result = await client.request(query, {
      // query variables
      uid: context.auth.uid,
    })
    if (hasuraUser) {
      return { status: "success", result: result }
    } else {
      throw new Error('Error running query')
    }

  } catch (error) {
    console
    return { status: "failure", message: error }
  }
});