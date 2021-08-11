const functions = require("firebase-functions");
const firebaseAdmin = require("firebase-admin");

const firebase = firebaseAdmin.initializeApp();

const keys = require("./helpers/keys").keys()
const hasura = require("./helpers/hasura");

let hasuraKeys;
if (process.env.FUNCTIONS_EMULATOR == "true") {
  hasuraKeys = keys.hasuraTest
} else {
  hasuraKeys = keys.hasura
}
const hasuraClient = new hasura.Hasura(keys.hasura)



// const grocery = require("./helpers/grocery")
const message = require("./helpers/message");
const admin = require("./helpers/admin");
const auth = require("./helpers/auth");
const notifications = require("./helpers/notification");
const { user } = require("firebase-functions/lib/providers/auth");

// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async user => {
 
  await hasura.setClaim(user.uid);
  if (!user.photoURL)
    user.photoURL = 'https://www.mezcalmos.com/img/logo.71b44398.svg'
  
  await firebase.database().ref(`/users/${user.uid}/info`).update({
    displayName: user.displayName,
    photo: user.photoURL,
    email: user.email
  });

  await hasuraDb.insertUser({ 
    user: {
        uid: user.uid,
        displayName: user.displayName,
        photo: user.photoURL,
      }
  })
  

});

exports.changeName = functions.database.ref(
  '/users/{userId}/info/displayName').onUpdate(async (snap, context) => {
    let firebase = getFirebase();
    let hasura = getHasura()
    await firebase.auth().updateUser(context.params.userId, { displayName: snap.after.val() })
    // 
      await hasura.updateUser({
         uid: context.params.userId,
         changes:{
           displayName: snap.after.val()
         } 
       }) 
     
    console.log('name changed');
  })

exports.changePhoto = functions.database.ref(
  '/users/{userId}/info/photo').onUpdate(async (snap, context) => {
    let firebase = getFirebase();
    let hasura = getHasura();
    await firebase.auth().updateUser(context.params.userId, { photo: snap.after.val() })
   
      await hasura.updateUser({
         uid: context.params.userId,
         changes:{
           photo: snap.after.val()
         } 
      }) 
  })

exports.createTaxiNumber = functions.database.ref(
  'users/{userId}/info/taxiNumber').onCreate(async (snap, context) => {
    let hasura = getHasura();
    await hasura.updateUser({
      uid: context.params.userId,
      changes: {
        taxiNumber: snap.val()
      }
    })
  })

exports.updateTaxiNumber = functions.database.ref(
  'users/{userId}/info/taxiNumber').onUpdate(async (snap, context) => {
    let hasura = getHasura();
    await hasura.updateUser({
      uid: context.params.userId,
      changes: {
        taxiNumber: snap.after.val()
      }
    })
  })
  

exports.addHasuraClaims = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase();
  let hasura = getHasura();
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
  let hasura = getHasura(data.database);
  const request = require("./helpers/taxi/request")
  let response = await request(firebase, context.auth.uid, data, hasura)
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
  let hasura = getHasura(data.database)
  const accept = require("./helpers/taxi/accept")
  let response = await accept(firebase, context.auth.uid, data, hasura)
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
  let hasura = getHasura(data.database)
  const start = require("./helpers/taxi/start")
  let response = await start(firebase, context.auth.uid, hasura)
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
  let hasura = getHasura(data.database)
  const cancelTaxiFromCustomer = require("./helpers/taxi/cancelTaxiFromCustomer")
  let response = await cancelTaxiFromCustomer(firebase, context.auth.uid, data, hasura)
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
  let hasura = getHasura(data.database)
  const cancelTaxiFromDriver = require("./helpers/taxi/cancelTaxiFromDriver")
  let response = await cancelTaxiFromDriver(firebase, context.auth.uid, data, hasura)
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
  let hasura = getHasura(data.database)
  const finish = require('./helpers/taxi/finish')
  let response = await finish(firebase, context.auth.uid, hasura)
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
  let hasura = getHasura(data.database)
  data.userId = context.auth.uid
  let response = await admin.submitAuthorizationRequest(firebase, data, hasura)
  return response
});

exports.approveAuthorizationRequest = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  let hasura = getHasura(data.database)
  data.adminId = context.auth.uid
  let response = await admin.approveAuthorizationRequest(firebase, data, hasura)
  return response
});

exports.createAdminChat = functions.https.onCall(async (data, context) => {
  let firebase = getFirebase(data.database);
  
  if (data.fromAdmin) {
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

exports.notifyMessageParticipants = functions.database.ref(
  '/chat/{chatId}/messages/{messageId}').onCreate(async (snap, context) => {
    let firebase = getFirebase();
    message.notifyOthers(firebase, context.params, snap.val())
  })

exports.notifyMessageFromAdmin = functions.database.ref(
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
  let response = await admin.checkAdmin(firebase, { adminId: context.auth.uid })
  if (response)
    return response
  response = await notifications.sendTest(firebase, data)
  return response
});

exports.notifyPromoterOfCustomer = functions.database.ref(
  'users/{userId}/invite/code').onCreate(async (snap, context) => {
    let firebase = getFirebase();
    await notifications.notifyPromoterOfCustomerReferral(firebase, context.params, snap.val())
  })



exports.notifyPromoterOfDriver = functions.database.ref(
  'taxiDrivers/{userId}/invite/code').onCreate(async (snap, context) => {
    let firebase = getFirebase();
    await notifications.notifyPromoterOfDriverReferral(firebase, context.params, snap.val())
  })

exports.notifyPromoterOfSignUp = functions.database.ref(
  'promoters/{inviteCode}').onCreate(async (snap, context) => {
    let firebase = getFirebase();
    await notifications.notifyPromoterOfSignup(firebase, context.params, snap.val())
  })