const { gql, GraphQLClient } = require('graphql-request')
const fs = require('fs');
const firebaseAdmin = require("firebase-admin");
const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");



async function saveFile() {
  let db = (await firebase.database().ref(`/`).once('value')).val();
  console.log("finished downloading, starting write");

  let data = JSON.stringify(db, null, "\t");
  fs.writeFileSync('data/db-snapshot.json', data);
  console.log("Finished");
}

async function writeToDB() {

  // await deleteUsers()
  // await deleteDrivers()
  // await deleteOrders()
  // return
  let data = JSON.parse(fs.readFileSync('data/db-snapshot.json'));
  let drivers = data.taxiDrivers
  let users = data.users
  let taxis = data.taxiDrivers
  let newObj = {
    "users": {},
    "customers": { "pastOrders": {}, "info": {} },
    "taxis": {
      "pastOrders": {}, "info": {}
    },
    "taxiDrivers": {}
  };
  var count = 0;
  for (let userId in users) {
    let user = users[userId]
    delete user.notificationInfo
    delete user.auth
    delete user.invite
    if (user.orders)
      newObj["customers"]["pastOrders"][userId] = {
        ...user.orders
      }

    delete user.orders

    if (user.savedLocations)
      newObj["customers"]["info"][userId] = {
        savedLocations: user.savedLocations
      }

    delete user.savedLocations

    if (user.info.taxiNumber) {
      newObj["taxis"]["info"][userId] = {
        "details": {
          "taxiNumber": user.info.taxiNumber
        }
      }
    }

    user.info = {
      ...user.info,
      "name": user.info.displayName,
      "image": user.info.photo
    }

    newObj["users"][userId] = {
      ...user
    }
  }

  for (let userId in taxis) {
    let driver = taxis[userId]

    newObj["taxis"]["info"][userId] = newObj["taxis"]["info"][userId] || {}
    if (driver.location) {
      newObj["taxis"]["info"][userId]["location"] = driver.location
    }

    if (driver.state) {
      newObj["taxis"]["info"][userId]["state"] = driver.state
    }

    if (driver.orders) {
      newObj["taxis"]["pastOrders"][userId] = driver.orders
    }

    if (driver.state)
      newObj["taxiDrivers"][userId] = {
        state: driver.state
      }
  }

  newObj["chat"] = data.chat
  newObj["orders"] = data.orders
  newObj["pricePolicy"] = data.pricePolicy
  newObj["restaurants"] = data.restaurants
  newObj["orders"]["past"] = Object.assign({}, data.orders, data.orders)
  fs.writeFileSync('data/new-db-snapshot.json', JSON.stringify(newObj));
}


// saveFile()
writeToDB()