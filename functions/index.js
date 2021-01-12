const functions = require("firebase-functions");
const admin = require("firebase-admin");


const productionFirebase = admin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

let testFirebase;

if (!process.env["FUNCTIONS_EMULATOR"]) {
  testFirebase = admin.initializeApp({
    databaseURL: "https://mezcalmos-test.firebaseio.com"
  });
}

function getFirebase(database = "production") {
  if(database == "production") {
    return productionFirebase
  } else {
    return testFirebase
  }
}

const grocery = require ("./helpers/grocery")
const taxi = require ("./helpers/taxi")
const hasura = require ("./helpers/hasura");

// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
  let firebase = getFirebase();
  await firebase.database().ref(`/users/${user.uid}/info`).set(
    {displayName:user.displayName,
     photo:user.photoURL,
     email:user.email});
    //  fbuid:user.providerData[0].uid});
    let response = hasura.setClaim(user.uid);
  return response
});

exports.addHasuraClaims = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase();
  let response = hasura.setClaim(firebase, context.auth.uid);
  return response
});


exports.requestTaxi = functions.https.onCall(async (data, context) => {
  if(!context.auth) {
    return { status:"Error", errorMessage: "User needs to be signed in"}
  }
  let firebase = getFirebase(data.database);
  let response = await taxi.request(firebase, data, context.auth.uid)
  return response
});

exports.acceptTaxiOrder = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  let response = await taxi.accept(firebase, data, context.auth.uid)
  return response
});

exports.startTaxiRide = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  let response = await taxi.start(firebase, data, context.auth.uid)
  return response
});

exports.finishTaxiRide = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  let response = await taxi.finish(firebase, data, context.auth.uid)
  return response
});


exports.requestGrocery = functions.https.onCall(async (data, context) => {
  if(!context.auth) {
    return { status:"Error", errorMessage: "User needs to be signed in"}
  }
  let firebase = getFirebase(data.database);
  let response = await grocery.request(firebase, data, context.auth.uid)
  return response
});

exports.acceptGroceryOrder = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  let response = await grocery.accept(firebase, data, context.auth.uid)
  return response
});

exports.finishGroceryOrder = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  let response = await grocery.finish(firebase, data, context.auth.uid)
  return response
}); 

// exports.notifyMessageParticpants = functions.database.instance('mezcalmos-test').ref(
//   '/chat/${orderId}/messages/${messageId}').onWrite((snap, context) => {
//   console.log(snap)
// })
