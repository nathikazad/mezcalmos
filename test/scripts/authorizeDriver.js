const auth = require("../libraries/rest/auth")
const helper = require("../libraries/helpers")
const admin = require("firebase-admin");

const { GraphQLClient } = require('graphql-request')
const keys = require("../../functions/helpers/keys").keys()

admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

let adminData = {
  "email": "admin@mezcalmos.com",
  "displayName": "ADMIN",
  "photo": "https://randomuser.me/api/portraits/men/77.jpg",
  "photoURL": "https://randomuser.me/api/portraits/men/77.jpg",
  "password": "password",
  "returnSecureToken": true
}


let driverData = {
  "email": "driver@mezcalmos.com",
  "displayName": "Driver One",
  "password": "password",
  "photoURL": "https://randomuser.me/api/portraits/men/72.jpg",
  "returnSecureToken": true
}


async function main() {
  let client = new GraphQLClient(
    keys.hasuraTest.url,
    {
      headers: {
        'x-hasura-admin-secret': keys.hasuraTest.key
      }
    });
  await helper.clearDatabase(admin, client)
  newAdmin = await auth.signUp(admin, adminData)
  driver = await auth.signUp(admin, driverData)
  await admin.database().ref(`admins/${newAdmin.id}/authorized`).set(true)

  let params = {
    userType: 'driver'
  }

  let request = await driver.callFunction('submitAuthorizationRequest', params)
  params = {
    adminId: newAdmin.id,
    userId: driver.id,
    userType: 'driver'
  }

  request = await newAdmin.callFunction('approveAuthorizationRequest', params)
  process.exit()
}

main();