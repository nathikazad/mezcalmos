const functions = require("firebase-functions");
const firebaseAdmin = require("firebase-admin");


const productionFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
}, "production");
const testFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-test.firebaseio.com"
}, "test")

function getFirebase(database = "production") {
  if (database == "production") {
    return productionFirebase
  } else {
    return testFirebase
  }
}

const grocery = require("./helpers/grocery")
const taxi = require("./helpers/taxi")
const hasura = require("./helpers/hasura");
const message = require("./helpers/message");
const admin = require("./helpers/admin");

// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
  let firebase = getFirebase();
  await firebase.database().ref(`/users/${user.uid}/info`).set({
    displayName: user.displayName,
    photo: user.photoURL,
    email: user.email
  });
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
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let firebase = getFirebase(data.database);
  let response = await taxi.request(firebase, data, context.auth.uid)
  return response
});

exports.acceptTaxiOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
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
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
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

exports.itemsPickedGroceryOrder = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  let response = await grocery.itemsPicked(firebase, data, context.auth.uid)
  return response
});

exports.finishGroceryOrder = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  let response = await grocery.finish(firebase, data, context.auth.uid)
  return response
});


exports.submitAuthorizationRequest = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  data.userId = context.auth.uid
  let response = await admin.submitAuthorizationRequest(firebase, data)
  return response
});

exports.approveAuthorizationRequest = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  data.adminId = context.auth.uid
  let response = await admin.approveAuthorizationRequest(firebase, data)
  return response
});

exports.createAdminChat = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  if(data.fromAdmin){
    data.adminId = context.auth.uid
  } else {
    data.userId = context.auth.uid
  }
  let response = await admin.createChat(firebase, data)
  return response
});

exports.resolveAdminChat = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  data.adminId = context.auth.uid
  let response = await admin.resolve(firebase, data)
  return response
});

exports.notifyMessageParticipantsTest = functions.database.instance('mezcalmos-test').ref(
  '/chat/{chatId}/messages/{messageId}').onCreate((snap, context) => {
  let firebase = getFirebase('test');
  message.notifyOthers(firebase, context.params, snap.val())
})

exports.notifyMessageParticipants = functions.database.instance('mezcalmos-31f1c-default-rtdb').ref(
  '/chat/{chatId}/messages/{messageId}').onCreate(async (snap, context) => {
  let firebase = getFirebase();
  message.notifyOthers(firebase, context.params, snap.val())
})

exports.notifyMessageFromAdminTes = functions.database.instance('mezcalmos-test').ref(
  'adminChat/{userType}/current/{userId}/{ticketId}/messages/{messageId}').onCreate((snap, context) => {
  let firebase = getFirebase('test');
  message.notifyUser(firebase, context.params, snap.val())
})

exports.notifyMessageFromAdmi = functions.database.instance('mezcalmos-31f1c-default-rtdb').ref(
  'adminChat/{userType}/current/{userId}/{ticketId}/messages/{messageId}').onCreate(async (snap, context) => {
  let firebase = getFirebase();
  message.notifyUser(firebase, context.params, snap.val())
})