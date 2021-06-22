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

// const grocery = require("./helpers/grocery")
const taxi = require("./helpers/taxi")
const hasura = require("./helpers/hasura");
const message = require("./helpers/message");
const admin = require("./helpers/admin");
const auth = require("./helpers/auth");
const notifications = require("./helpers/notification");
const { user } = require("firebase-functions/lib/providers/auth");

// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
  hasura.setClaim(user.uid);
  let firebase = getFirebase();
  if(!user.photoURL)
    user.photoURL = 'none'

  await firebase.database().ref(`/users/${user.uid}/info`).update({
    displayName: user.displayName,
    photo: user.photoURL,
    email: user.email
  });
});

exports.changeName = functions.database.instance('mezcalmos-31f1c-default-rtdb').ref(
  '/users/{userId}/info/displayName').onUpdate(async (snap, context) => {
  let firebase = getFirebase();
  await firebase.auth().updateUser(context.params.userId, {displayName: snap.after.val()})
})

exports.changePhoto = functions.database.instance('mezcalmos-31f1c-default-rtdb').ref(
  '/users/{userId}/info/photo').onUpdate(async (snap, context) => {
  let firebase = getFirebase();
  await firebase.auth().updateUser(context.params.userId, {photoURL: snap.after.val()})
})

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
  let response = await taxi.request(firebase, context.auth.uid, data)
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
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let firebase = getFirebase(data.database);
  let response = await taxi.start(firebase, context.auth.uid)
  return response
});

exports.cancelTaxiFromCustomer = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let firebase = getFirebase(data.database);
  let response = await taxi.cancelTaxiFromCustomer(firebase, context.auth.uid, data)
  return response
});

exports.cancelTaxiFromDriver = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let firebase = getFirebase(data.database);
  let response = await taxi.cancelTaxiFromDriver(firebase, context.auth.uid, data)
  return response
});

exports.finishTaxiRide = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let firebase = getFirebase(data.database);
  let orderId
  if(data.fromAdmin) {
    let response = await admin.checkAdmin(firebase, {adminId:context.auth.uid})
    if (response) return response
    orderId = data.orderId
  } else {
    let driverId = context.auth.uid
    orderId = (await firebase.database().ref(`/taxiDrivers/${driverId}/state/currentOrder`).once('value')).val();
    if (orderId == null) {
      return { status: "Error", errorMessage: "Driver has not accepted any ride" }
    }
  }
  let response = await taxi.finish(firebase, orderId)
  return response
});


// exports.requestGrocery = functions.https.onCall(async (data, context) => {
//   if (!context.auth) {
//     return {
//       status: "Error",
//       errorMessage: "User needs to be signed in"
//     }
//   }
//   let firebase = getFirebase(data.database);
//   let response = await grocery.request(firebase, data, context.auth.uid)
//   return response
// });

// exports.acceptGroceryOrder = functions.https.onCall(async (data, context) => {
//   let firebase = getFirebase(data.database);
//   let response = await grocery.accept(firebase, data, context.auth.uid)
//   return response
// });

// exports.itemsPickedGroceryOrder = functions.https.onCall(async (data, context) => {
//   let firebase = getFirebase(data.database);
//   let response = await grocery.itemsPicked(firebase, data, context.auth.uid)
//   return response
// });

// exports.finishGroceryOrder = functions.https.onCall(async (data, context) => {
//   let firebase = getFirebase(data.database);
//   let response = await grocery.finish(firebase, data, context.auth.uid)
//   return response
// });

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

exports.notifyMessageFromAdminTest = functions.database.instance('mezcalmos-test').ref(
  'adminChat/{userType}/current/{userId}/{ticketId}/messages/{messageId}').onCreate((snap, context) => {
  let firebase = getFirebase('test');
  message.notifyUser(firebase, context.params, snap.val())
})

exports.notifyMessageFromAdmin = functions.database.instance('mezcalmos-31f1c-default-rtdb').ref(
  'adminChat/{userType}/current/{userId}/{ticketId}/messages/{messageId}').onCreate(async (snap, context) => {
  let firebase = getFirebase();
  message.notifyUser(firebase, context.params, snap.val())
})

exports.sendOTPForLogin = functions.https.onCall(async (data) => {
  let firebase = getFirebase(data.database);
  let response = await auth.sendOTPForLogin(firebase, data);
  return response;
});

exports.getAuthUsingOTP = functions.https.onCall(async (data) => {
  let firebase = getFirebase(data.database);
  let response = await auth.getAuthUsingOTP(firebase, data);
  return response;
});

exports.sendOTPForNumberChange = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let firebase = getFirebase(data.database);
  let response = await auth.sendOTPForNumberChange(firebase, data, context.auth.uid);
  return response;
});

exports.confirmNumberChangeUsingOTP = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let firebase = getFirebase(data.database);
  let response = await auth.confirmNumberChangeUsingOTP(firebase, data, context.auth.uid);
  return response;
});

exports.sendTestNotification = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  let response = await admin.checkAdmin(firebase, {adminId:context.auth.uid})
  if (response) 
    return response
  response = await notifications.sendTest(firebase, data)
  return response
});



exports.notifyPromoterFromTestCustomer = functions.database.instance('mezcalmos-test').ref(
  'users/{userId}/invite/code').onCreate(async (snap, context) => {
  let firebase = getFirebase('test');
  await notifications.notifyPromoterOfCustomerReferral(firebase, context.params, snap.val())
})


exports.notifyPromoterOfCustomer = functions.database.instance('mezcalmos-31f1c-default-rtdb').ref(
  'users/{userId}/invite/code').onCreate(async (snap, context) => {
  let firebase = getFirebase();
  await notifications.notifyPromoterOfCustomerReferral(firebase, context.params, snap.val())
})

exports.notifyPromoterFromTestDriver = functions.database.instance('mezcalmos-test').ref(
  'taxiDrivers/{userId}/invite/code').onCreate(async (snap, context) => {
  let firebase = getFirebase('test');
  await notifications.notifyPromoterOfDriverReferral(firebase, context.params, snap.val())
})

exports.notifyPromoterOfDriver = functions.database.instance('mezcalmos-31f1c-default-rtdb').ref(
  'taxiDrivers/{userId}/invite/code').onCreate(async (snap, context) => {
  let firebase = getFirebase();
  await notifications.notifyPromoterOfDriverReferral(firebase, context.params, snap.val())
})

