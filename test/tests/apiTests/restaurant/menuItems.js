const axios = require('axios');
const auth = require("../../../libraries/rest/auth")
const helper = require("../../../libraries/helpers")
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

let restaurantData = {
  "email": "burger_restaurant@gmail.com",
  "displayName": "Burger Burger",
  "password": "password",
  "photoURL": "https://randomuser.me/api/portraits/men/72.jpg",
  "returnSecureToken": true
}

let restaurantInfo = {
  state: {
    authorizationStatus: true,
    open: false,
  }
}

let item = {
  name: {
    en: "normal burger",
    es: "burgesa normal"
  },
  description: {
    en: "a normal burger with patty and cheese",
    es: "un burgesa normal con carne y queso"
  },
  available: true,
  images: ["img1", "img2", "img3"],
  options: {
    chooseOne: [
      {
        optionName: { en: "Meat", es: "Carne" },
        optionDialogText: { en: "Choose your patty type", es: "Elige el tipo de carne" },
        options: [
          { name: { en: "chicken", es: "pollo" }, extraCost: 0 },
          { name: { en: "beef", es: "res" }, extraCost: 0 },
          { name: { en: "fish", es: "pescado" }, extraCost: 1.00 },
        ]
      },
      {
        optionName: { en: "Cheese", es: "Queso" },
        optionDialogText: { en: "Choose your cheese", es: "Elige el tipo de queso" },
        options: [
          { name: { en: "Mozarella", es: "Mozarella" }, extraCost: 0 },
          { name: { en: "American", es: "Americano" }, extraCost: 0 },
          { name: { en: "Oaxacan", es: "Oaxaqueno" }, extraCost: 0 },
        ]
      }
    ],
    chooseMany: [
      {
        name: { en: "lettuce", es: "lechuga" },
        cost: 0,
      },
      {
        name: { en: "tomato", es: "tomate" },
        cost: 0,
      },
      {
        name: { en: "onion", es: "cebolla" },
        cost: 0,
      },
      {
        name: { en: "avocado", es: "avocado" },
        cost: 1.00,
      },
    ],
    sides: [
      {
        name: { en: "French fries", es: "Batatas fritas" },
        cost: 1.99,
      },
      {
        name: { en: "Nachos", es: "Nachos" },
        cost: 2.99,
      }
    ]
  }
}

// /restaurant/<restaurantId>

//{state:
//    authorizationStatus
//    open
// menu:
// orders:
//}

let customer, badUser, driver

describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
    customer = await auth.signUp(admin, userData)
    restaurantUser = await auth.signUp(admin, restaurantData)
    restaurant = new Restaurant(restaurantUser);
    await restaurant.setRestaurantInfo(admin, restaurantInfo);
  });

  it('Add items test', async () => {

    // Add an item
    let itemId = await restaurant.addItem(item);
    // make the customer retrieve the item
    let items = await customer.db.get(`resturants/${restaurantUser.id}/menu`);
    // items length, name, item description
    // items.length == 1
    // items[0].name.en == "normal burger"
    // items[0].description.en == "normal burger with bla"
    // items.images.length == 3

    let itemTwoId = await restaurant.addItem(item);
    items = await customer.db.get(`resturants/${restaurantUser.id}/menu`);
    // items.length == 2
  });

  it('Remove items test', async () => {

    // Add an item
    let itemId = await restaurant.addItem(item);
    await restaurant.removeItem(item);
    let items = await customer.db.get(`resturants/${restaurantUser.id}/menu`);
    // make the customer retrieve items
    // items.length == 0
    // item should not be there
  });

  it('Edit items test', async () => {

    // Add an item
    let itemId = await restaurant.addItem(item);
    itemModification = {
      description: {
        en: "a burger with patty",
        es: "un burgesa normal con carne"
      },
      images: ["img1", "img2", "img3", "img4"],
    }
    await restaurant.updateItem(itemId, itemModification);
    let items = await customer.db.get(`resturants/${restaurantUser.id}/menu`);
    // make the customer retrieve items
    // items.length == 1
    // items[id].description.en == "a burger with patty"
    // items.images.length == 4
  });

  it('Mark item as unavailable test test', async () => {

    // Add an item
    let itemId = await restaurant.addItem(item);
    itemModification = {
      available: false
    }
    await restaurant.updateItem(itemId, itemModification);
    // make the customer retrieve items
    // items.length == 1
    // items[id].available == false
  });

})

afterAll(() => {
  admin.app().delete()
});