const axios = require('axios');
const auth = require("../../../libraries/rest/auth")
const restaurantLib = require("../../../libraries/rest/restaurant")
const helper = require("../../../libraries/helpers")
const fakeRestaurantData = require("../../data/restaurant")
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

let restaurantData = fakeRestaurantData.restaurantData
let restaurantInfo = fakeRestaurantData.restaurantInfo
let item = fakeRestaurantData.item

let customer, restaurantUser, restaurant
describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
    customer = await auth.signUp(admin, userData)
    restaurantUser = await auth.signUp(admin, restaurantData)
    restaurant = new restaurantLib.Restaurant(restaurantUser);
    await restaurant.setRestaurantInfo(admin, restaurantInfo);
  });


  it('Add items test', async () => {

    // Add an item
    await restaurant.addItem(item);
    // make the customer retrieve the item
    let items = await customer.db.get(`restaurants/info/${restaurantUser.id}/menu`);
    expect(Object.keys(items).length).toBe(1)
    let retrievedItem = items[Object.keys(items)[0]]
    expect(retrievedItem).toStrictEqual(item)


    await restaurant.addItem(item);
    items = await customer.db.get(`restaurants/info/${restaurantUser.id}/menu`);
    expect(Object.keys(items).length).toBe(2)
  });

  it('Remove items test', async () => {

    // Add an item
    await admin.database().ref(`restaurants/info/${restaurantUser.id}/menu`).remove()
    let itemId = await restaurant.addItem(item);
    await restaurant.removeItem(itemId);
    let items = await customer.db.get(`restaurants/info/${restaurantUser.id}/menu`);
    // make the customer retrieve items
    expect(Object.keys(items || {}).length).toBe(0)
    // item should not be there
  });

  it('Edit items test', async () => {

    // Add an item
    let itemId = await restaurant.addItem(item);
    itemModification = item
    itemModification.description = {
      en: "a burger with patty",
      es: "un burgesa normal con carne"
    }

    itemModification.image = "img3",
      itemModification.options.chooseMany.onion = null
    itemModification.options.chooseMany.jalapeno = {
      name: { en: "jalapeno", es: "jalapeno" },
      cost: 0,
    }

    await restaurant.updateItem(itemId, itemModification);
    let items = await customer.db.get(`restaurants/info/${restaurantUser.id}/menu`);
    expect(Object.keys(items).length).toBe(1)
    let retrievedItem = items[Object.keys(items)[0]]
    expect(retrievedItem.description).toStrictEqual(itemModification.description)
    expect(retrievedItem.image).toStrictEqual(itemModification.image)
    expect(retrievedItem.options.chooseMany.onion).toBe(undefined)
    expect(retrievedItem.options.chooseMany.jalapeno).toStrictEqual(itemModification.options.chooseMany.jalapeno)
    expect(retrievedItem.name).toStrictEqual(item.name)
    expect(retrievedItem.available).toStrictEqual(true)
  });

  it('Mark item as unavailable test', async () => {

    // Add an item
    let itemId = await restaurant.addItem(item);
    itemModification = {
      available: false
    }
    let items = await customer.db.get(`restaurants/info/${restaurantUser.id}/menu`);
    expect(items[itemId].available).toBe(true)
    await restaurant.updateItem(itemId, itemModification);
    items = await customer.db.get(`restaurants/info/${restaurantUser.id}/menu`);
    expect(items[itemId].available).toBe(false)
  });

//   // it('Remove Item', async () => {
})

afterAll(() => {
  admin.app().delete()
});