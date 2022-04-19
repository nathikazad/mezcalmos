const { gql, GraphQLClient } = require('graphql-request')
const fs = require('fs');
const firebaseAdmin = require("firebase-admin");
// const firebase = firebaseAdmin.initializeApp({
//   databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
// }, "production");

// const firebase = firebaseAdmin.initializeApp({
//   databaseURL: "http://localhost:9000/?ns=mezcalmos-31f1c-default-rtdb"
// });

async function saveFile() {
  let db = (await firebase.database().ref(`/`).once('value')).val();
  console.log("finished downloading, starting write");

  let data = JSON.stringify(db, null, "\t");
  fs.writeFileSync('data/db-snapshot.json', data);
  console.log("Finished");
}

async function writeToDB() {

  let restaurants = JSON.parse(fs.readFileSync('data/db-snapshot.json'));

  // var count = 0;
  for (let restaurantId in restaurants) {
    let restaurant = restaurants[restaurantId]
    restaurants[restaurantId]["menu2"] = {
      noCategory: {
        items: restaurant["menu"]
      }
    }
    for (let itemId in restaurants) {
      delete restaurants[restaurantId]["menu2"]["noCategory"]["items"][itemId]["options"]
    }
    restaurant
  }


  fs.writeFileSync('data/new-db-snapshot.json', JSON.stringify(restaurants));
}


// saveFile()
writeToDB()

// *********** Options 2 ******************
  // var count = 0;
  // for (let restaurantId in restaurants) {
  //   let restaurant = restaurants[restaurantId]
  //   // console.log(restaurant.menu)

  //   for (let itemId in restaurant.menu) {
  //     let item = restaurant.menu[itemId]
  //     // console.log(item.options)
  //     let options2 = {}
  //     let order = 1;
  //     if (item.options.chooseOne) {
  //       for (let chooseOneItemId in item.options.chooseOne) {
  //         let chooseOneItem = item.options.chooseOne[chooseOneItemId]
  //         options2[chooseOneItemId] = {
  //           name: chooseOneItem.name,
  //           order: order,
  //           optionType: "chooseOne",
  //           choices: []
  //         }
  //         order++
  //         for (let chooseOneOptionId in chooseOneItem.options) {
  //           let chooseOneOption = chooseOneItem.options[chooseOneOptionId];
  //           // console.log(chooseOneOption)
  //           options2[chooseOneItemId].choices.push(chooseOneOption)
  //         }
  //       }
  //     }
  //     if (item.options.chooseMany) {
  //       options2["extras"] = {
  //         name: {
  //           "en": "Extras",
  //           "es": "Extras"
  //         },
  //         order: order,
  //         optionType: "chooseMany",
  //         choices: []
  //       }
  //       for (let chooseManyItemId in item.options.chooseMany) {
  //         let chooseManyItem = item.options.chooseMany[chooseManyItemId]
  //         options2["extras"].choices.push(chooseManyItem)
  //       }
  //     }
  //     // console.log(options2)
  //     restaurants[restaurantId].menu[itemId].options2 = options2
  //   }
  // }
  // firebase.database().ref(`/restaurants/info`).set(restaurants)
// *********** OLD transform ******************

  //   let user = users[userId]
  //   delete user.notificationInfo
  //   delete user.auth
  //   delete user.invite
  //   if (user.orders)
  //     newObj["customers"]["pastOrders"][userId] = {
  //       ...user.orders
  //     }

  //   delete user.orders

  //   if (user.savedLocations)
  //     newObj["customers"]["info"][userId] = {
  //       savedLocations: user.savedLocations
  //     }

  //   delete user.savedLocations

  //   if (user.info.taxiNumber) {
  //     newObj["taxis"]["info"][userId] = {
  //       "details": {
  //         "taxiNumber": user.info.taxiNumber
  //       }
  //     }
  //   }

  //   user.info = {
  //     ...user.info,
  //     "name": user.info.displayName,
  //     "image": user.info.photo
  //   }

  //   newObj["users"][userId] = {
  //     ...user
  //   }
  // }

  // for (let userId in taxis) {
  //   let driver = taxis[userId]

  //   newObj["taxis"]["info"][userId] = newObj["taxis"]["info"][userId] || {}
  //   if (driver.location) {
  //     newObj["taxis"]["info"][userId]["location"] = driver.location
  //   }

  //   if (driver.state) {
  //     newObj["taxis"]["info"][userId]["state"] = driver.state
  //   }

  //   if (driver.orders) {
  //     newObj["taxis"]["pastOrders"][userId] = driver.orders
  //   }

  //   if (driver.state)
  //     newObj["taxiDrivers"][userId] = {
  //       state: driver.state
  //     }
  // }

  // newObj["chat"] = data.chat
  // newObj["orders"] = data.orders
  // newObj["pricePolicy"] = data.pricePolicy
  // newObj["restaurants"] = data.restaurants
  // newObj["orders"]["past"] = Object.assign({}, data.orders, data.orders)
  // fs.writeFileSync('data/new-db-snapshot.json', JSON.stringify(newObj));