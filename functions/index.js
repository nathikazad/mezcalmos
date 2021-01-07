const functions = require("firebase-functions");
const admin = require("firebase-admin");
// import { GraphQLClient } from 'graphql-request'

let databaseURL = "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
if(process.env.FUNCTIONS_EMULATOR == 'true'){
  databaseURL = "https://mezcalmos-test.firebaseio.com"
}

admin.initializeApp({
  databaseURL: databaseURL
});

const grocery = require ("./helpers/grocery")
const taxi = require ("./helpers/taxi")
const hasura = require ("./helpers/hasura");

// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
  await admin.database().ref(`/users/${user.uid}/info`).set(
    {displayName:user.displayName,
     photo:user.photoURL,
     email:user.email,
     fbuid:user.providerData[0].uid});
  return hasura.setClaim(user.uid);
});

exports.addHasuraClaims = functions.https.onCall(async (data, context) => {
  return hasura.setClaim(context.auth.uid);
});


exports.requestTaxi = functions.https.onCall(async (data, context) => {
  let response = await taxi.request(admin, data, context.auth.uid)
  return response
});

exports.acceptTaxiOrder = functions.https.onCall(async (data, context) => {
  let response = await taxi.accept(admin, data, context.auth.uid)
  return response
});

exports.startTaxiRide = functions.https.onCall(async (data, context) => {
  let response = await taxi.start(admin, data, context.auth.uid)
  return response
});

exports.finishTaxiRide = functions.https.onCall(async (data, context) => {
  let response = await taxi.finish(admin, data, context.auth.uid)
  return response
});


exports.requestGrocery = functions.https.onCall(async (data, context) => {
  let response = await grocery.request(admin, data, context.auth.uid)
  return response
});

