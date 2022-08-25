import * as firebaseAdmin from "firebase-admin"
// const firebase = firebaseAdmin.initializeApp({
//   databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
//   credential: firebaseAdmin.credential.cert("/Users/nathikazad/Projects/mezcalmos/service_account_production.json")

// }, "production");

const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-staging-default-rtdb.firebaseio.com",
  credential: firebaseAdmin.credential.cert("/Users/nathikazad/Projects/mezcalmos/service_account_staging.json")

}, "staging");

async function main() {
  console.log("restaurants")
  let restaurants = (await firebase.database().ref(`/restaurants/info`).once('value')).val();
  for (let restaurantId in restaurants) {
    console.log(restaurantId)
    let restaurant = restaurants[restaurantId]
    let newMenu = {
      daily: restaurant.menu2
    }
    await firebase.database().ref(`restaurants/info/${restaurantId}/menu`).set(newMenu);
  }
}
main()





