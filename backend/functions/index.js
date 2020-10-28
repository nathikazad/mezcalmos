const functions = require("firebase-functions");
const admin = require("firebase-admin");
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
  console.log(context)
  try {
    const customClaims = {
      "https://hasura.io/jwt/claims": {
        "x-hasura-default-role": "user",
        "x-hasura-allowed-roles": ["user"],
        "x-hasura-user-id": context.auth.uid
      }
    };
    await admin.auth().setCustomUserClaims(context.auth.uid, customClaims)
    return { status: "success", user:context.auth.uid }
  } catch (error) {
    console
    return { status: "failure", message: error }
  }
});