const functions = require("firebase-functions");
const firebaseAdmin = require("firebase-admin");

const firebase = firebaseAdmin.initializeApp();

const keys = require("./helpers/keys").keys()
const hasuraModule = require("./helpers/hasura");

const hasura = new hasuraModule.Hasura(keys.hasura)



// const grocery = require("./helpers/grocery")
const message = require("./helpers/message");
const admin = require("./helpers/admin");
const auth = require("./helpers/auth");
const notifications = require("./helpers/notification");
const { user } = require("firebase-functions/lib/providers/auth");

// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
  await hasuraModule.setClaim(user.uid);
  if (!user.photoURL)
    user.photoURL = 'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d'
  
  await firebase.database().ref(`/users/${user.uid}/info`).update({
    displayName: user.displayName,
    photo: user.photoURL,
    email: user.email
  });

  await hasura.insertUser({
    user: {
        uid: user.uid,
        displayName: user.displayName,
        photo: user.photoURL,
      }
  })
});

exports.addName = functions.database.ref(
  '/users/{userId}/info/displayName').onCreate(async (snap, context) => {
  await firebase.auth().updateUser(context.params.userId, { displayName: snap.after.val() })
  await hasura.updateUser({
    uid: context.params.userId,
    changes: {
      displayName: snap.val()
    }
  })
})

exports.changeName = functions.database.ref(
  '/users/{userId}/info/displayName').onUpdate(async (snap, context) => {
    let hasura = getHasura()
    await firebase.auth().updateUser(context.params.userId, { displayName: snap.after.val() })
    await hasura.updateUser({
      uid: context.params.userId,
      changes: {
        displayName: snap.after.val()
      }
    })
  })

exports.addPhoto = functions.database.ref(
  '/users/{userId}/info/photo').onCreate(async (snap, context) => {
  await firebase.auth().updateUser(context.params.userId, { photoURL: snap.after.val() })
  await hasura.updateUser({
    uid: context.params.userId,
    changes: {
      photo: snap.val()
    }
  })
})

exports.changePhoto = functions.database.ref(
  '/users/{userId}/info/photo').onUpdate(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { photoURL: snap.after.val() })
    await hasura.updateUser({
      uid: context.params.userId,
      changes: {
        photo: snap.after.val()
      }
    })
  })

exports.createTaxiNumber = functions.database.ref(
  'users/{userId}/info/taxiNumber').onCreate(async (snap, context) => {
    await hasura.updateUser({
      uid: context.params.userId,
      changes: {
        taxiNumber: snap.val()
      }
    })
  })

exports.updateTaxiNumber = functions.database.ref(
  'users/{userId}/info/taxiNumber').onUpdate(async (snap, context) => {
    await hasura.updateUser({
      uid: context.params.userId,
      changes: {
        taxiNumber: snap.after.val()
      }
    })
  })

exports.addHasuraClaims = functions.https.onCall(async (data, context) => {
  let response = hasuraModule.setClaim(firebase, context.auth.uid);
  return response
});

const notSignedInMessage = {
  status: "Error",
  errorMessage: "User needs to be signed in"
}

exports.requestTaxi = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  const request = require("./helpers/taxi/request")
  let response = await request(firebase, context.auth.uid, data, hasura)
  return response
});

exports.acceptTaxiOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth)
    return notSignedInMessage
  const accept = require("./helpers/taxi/accept")
  let response = await accept(firebase, context.auth.uid, data, hasura)
  return response
});

exports.startTaxiRide = functions.https.onCall(async (data, context) => {
  if (!context.auth)
    return notSignedInMessage
  const start = require("./helpers/taxi/start")
  let response = await start(firebase, context.auth.uid, hasura)
  return response
});

exports.cancelTaxiFromCustomer = functions.https.onCall(async (data, context) => {
  if (!context.auth)
    return notSignedInMessage;
  const cancelTaxiFromCustomer = require("./helpers/taxi/cancelTaxiFromCustomer")
  let response = await cancelTaxiFromCustomer(firebase, context.auth.uid, data, hasura)
  return response
});

exports.cancelTaxiFromDriver = functions.https.onCall(async (data, context) => {
  if (!context.auth)
    return notSignedInMessage
  const cancelTaxiFromDriver = require("./helpers/taxi/cancelTaxiFromDriver")
  let response = await cancelTaxiFromDriver(firebase, context.auth.uid, data, hasura)
  return response
});

exports.finishTaxiRide = functions.https.onCall(async (data, context) => {
  if (!context.auth)
    return notSignedInMessage
  const finish = require('./helpers/taxi/finish')
  let response = await finish(firebase, context.auth.uid, hasura)
  return response
});

exports.submitAuthorizationRequest = functions.https.onCall(async (data, context) => {
  data.userId = context.auth.uid
  let response = await admin.submitAuthorizationRequest(firebase, data, hasura)
  return response
});

exports.approveAuthorizationRequest = functions.https.onCall(async (data, context) => {
  data.adminId = context.auth.uid
  let response = await admin.approveAuthorizationRequest(firebase, data, hasura)
  return response
});

exports.createAdminChat = functions.https.onCall(async (data, context) => {
  if (data.fromAdmin) {
    data.adminId = context.auth.uid
  } else {
    data.userId = context.auth.uid
  }
  let response = await admin.createChat(firebase, data)
  return response
});

exports.resolveAdminChat = functions.https.onCall(async (data, context) => {
  data.adminId = context.auth.uid
  let response = await admin.resolve(firebase, data)
  return response
});

exports.notifyMessageParticipants = functions.database.ref(
  '/chat/{chatId}/messages/{messageId}').onCreate(async (snap, context) => {
    message.notifyOthers(firebase, context.params, snap.val())
  })

exports.notifyMessageFromAdmin = functions.database.ref(
  'adminChat/{userType}/current/{userId}/{ticketId}/messages/{messageId}').onCreate(async (snap, context) => {
    message.notifyUser(firebase, context.params, snap.val())
  })

exports.sendOTPForLogin = functions.https.onCall(async (data) => {
  let response = await auth.sendOTPForLogin(firebase, data);
  return response;
});

exports.getAuthUsingOTP = functions.https.onCall(async (data) => {
  let response = await auth.getAuthUsingOTP(firebase, data);
  return response;
});

exports.sendOTPForNumberChange = functions.https.onCall(async (data, context) => {
  if (!context.auth)
    return notSignedInMessage
  let response = await auth.sendOTPForNumberChange(firebase, data, context.auth.uid);
  return response;
});

exports.confirmNumberChangeUsingOTP = functions.https.onCall(async (data, context) => {
  if (!context.auth)
    return notSignedInMessage
  let response = await auth.confirmNumberChangeUsingOTP(firebase, data, context.auth.uid);
  return response;
});

exports.sendTestNotification = functions.https.onCall(async (data, context) => {
  let response = await admin.checkAdmin(firebase, { adminId: context.auth.uid })
  if (response)
    return response
  response = await notifications.sendTest(firebase, data)
  return response
});