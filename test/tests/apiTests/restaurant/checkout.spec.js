// cant checkout if restaurant is closed

const axios = require('axios');
const auth = require("../../../libraries/rest/auth")
const helper = require("../../../libraries/helpers")
const restaurantLib = require("../../../libraries/rest/restaurant")
const admin = require("firebase-admin");


jest.setTimeout(50000)

admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});


let userData = {
  "email": "customer@mezcalmos.com",
  "displayName": "Customer One",
  "photo": "https://randomuser.me/api/portraits/men/70.jpg",
  "photoURL": "https://randomuser.me/api/portraits/men/70.jpg",
  "password": "password",
  "returnSecureToken": true
}

const fakeRestaurantData = require("../../data/restaurant")
let restaurantData = fakeRestaurantData.restaurantData
let restaurantInfo = fakeRestaurantData.restaurantInfo
let item = fakeRestaurantData.item

describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
    customer = await auth.signUp(admin, userData)
    restaurantUser = await auth.signUp(admin, restaurantData)
    restaurant = new restaurantLib.Restaurant(restaurantUser);
    await restaurant.setRestaurantInfo(admin, restaurantInfo);
    itemOneId = await restaurant.addItem(itemOne);
    await restaurant.addItem(itemOne);
    await restaurant.addItem(itemOne);
  });

  it('Should not allow checkout', async () => {
    // if cart is empty
    // restaurantId is invalid
    // restaurant is closed

  })
})