const functions = require("firebase-functions");
const admin = require("firebase-admin");


function initializeFirebase(database) {
  console.log("initializing db")
  if (!database || database == "production") {
    return admin.initializeApp({
      databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
    }, "production");
  } else {
    return admin.initializeApp({
      databaseURL: "https://mezcalmos-test.firebaseio.com"
    }, "test");
  }
}

const grocery = require ("./helpers/grocery")
const taxi = require ("./helpers/taxi")
const hasura = require ("./helpers/hasura");

// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
  let firebase = initializeFirebase();
  await firebase.database().ref(`/users/${user.uid}/info`).set(
    {displayName:user.displayName,
     photo:user.photoURL,
     email:user.email,
     fbuid:user.providerData[0].uid});
  return hasura.setClaim(user.uid);
});

exports.addHasuraClaims = functions.https.onCall(async (data, context) => {
  let firebase = initializeFirebase();
  return hasura.setClaim(firebase, context.auth.uid);
});


exports.requestTaxi = functions.https.onCall(async (data, context) => {
  if(!context.auth) {
    return { status:"Error", errorMessage: "User needs to be signed in"}
  }
  let firebase = initializeFirebase(data.database);
  let response = await taxi.request(firebase, data, context.auth.uid)
  return response
});

exports.acceptTaxiOrder = functions.https.onCall(async (data, context) => {
  let firebase = initializeFirebase(data.database);
  let response = await taxi.accept(firebase, data, context.auth.uid)
  return response
});

exports.startTaxiRide = functions.https.onCall(async (data, context) => {
  let firebase = initializeFirebase(data.database);
  let response = await taxi.start(firebase, data, context.auth.uid)
  return response
});

exports.finishTaxiRide = functions.https.onCall(async (data, context) => {
  let firebase = initializeFirebase(data.database);
  let response = await taxi.finish(firebase, data, context.auth.uid)
  return response
});


exports.requestGrocery = functions.https.onCall(async (data, context) => {
  if(!context.auth) {
    return { status:"Error", errorMessage: "User needs to be signed in"}
  }
  let firebase = initializeFirebase(data.database);
  let response = await grocery.request(firebase, data, context.auth.uid)
  return response
});

