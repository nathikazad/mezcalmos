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

let itemOne = {
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
  cost: 5.99,
  options: {
    chooseOne: {
      meat: {
        optionName: { en: "Meat", es: "Carne" },
        optionDialogText: { en: "Choose your patty type", es: "Elige el tipo de carne" },
        options: {
          chicken: { name: { en: "chicken", es: "pollo" }, extraCost: 0 },
          beef: { name: { en: "beef", es: "res" }, extraCost: 0 },
          fish: { name: { en: "fish", es: "pescado" }, extraCost: 1.00 },
        }
      },
      cheese: {
        optionName: { en: "Cheese", es: "Queso" },
        optionDialogText: { en: "Choose your cheese", es: "Elige el tipo de queso" },
        options: {
          mozarella: { name: { en: "Mozarella", es: "Mozarella" }, extraCost: 0 },
          american: { name: { en: "American", es: "Americano" }, extraCost: 0 },
          oaxacan: { name: { en: "Oaxacan", es: "Oaxaqueno" }, extraCost: 0 },
        }
      }
    },
    chooseMany: {
      lettuce: {
        name: { en: "lettuce", es: "lechuga" },
        cost: 0,
      },
      tomato: {
        name: { en: "tomato", es: "tomate" },
        cost: 0,
      },
      onion: {
        name: { en: "onion", es: "cebolla" },
        cost: 0,
      },
      avocado: {
        name: { en: "avocado", es: "avocado" },
        cost: 1.00,
      },
    },
    sides: {
      frenchFries: {
        name: { en: "French fries", es: "Batatas fritas" },
        cost: 1.99,
      },
      nachos: {
        name: { en: "Nachos", es: "Nachos" },
        cost: 2.99,
      }
    }
  }
}

// let itemTwo = {}
// let itemThree = {}

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
    await restaurant.addItem(itemOne);
    await restaurant.addItem(itemTwo);
    await restaurant.addItem(itemThree);
  });

  it('Add items to cart', async () => {


    let items = await customer.db.get(`resturants/${restaurantUser.id}/menu`);
    let itemToAdd = {
      orderType: "restaurant",
      serviceProviderId: "<restaurantId>",
      itemId: "<id>",
      options: {
        meat: "chicken",
        cheese: "mozarella",
        lettuce: true,
        tomato: true,
        sides: {
          frenchFries: true
        }
      }
    }
    await customer.callFunction("addToCart", itemToAdd);

    let cart = await customer.db.get(`customer/${customer.id}/cart`);

    // cart length, name, item description
    // cart.orderType == "Restaurant"
    // cart.serviceProviderId == "RestaurantId"
    // cart.totalCost == 7.98
    // cart.length == 1
    // items[0].name.en == "normal burger"
    // items[0].description.en == "normal burger with bla"
    // items.images.length == 3

    let itemTwoId = await restaurant.addItem(item);
    items = await customer.db.get(`resturants/${restaurantUser.id}/menu`);
    // items.length == 2
  });

  it('Increase item count in cart', async () => { })
  it('Decrease item count in cart', async () => { })

  it('Delete item count in cart', async () => { })
})

afterAll(() => {
  admin.app().delete()
});