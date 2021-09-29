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
let itemOne = fakeRestaurantData.item

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

  it('Add invalid items to cart ', async () => {
    items = await customer.db.get(`restaurants/${restaurantUser.id}/menu`);
    let response = await customer.callFunction("addRestaurantItemToCart", {});
    expect(response.result.status).toBe("Error");
    expect(response.result.errorMessage).toBe("Required itemId and restaurantId");

    response = await customer.callFunction("addRestaurantItemToCart", {
      restaurantId: restaurantUser.id,
      itemId: "itemOneId"
    });
    expect(response.result.status).toBe("Error");
    expect(response.result.errorMessage).toBe("Invalid itemId");

    response = await customer.callFunction("addRestaurantItemToCart", {
      restaurantId: restaurantUser.id,
      itemId: itemOneId,
      options: {
        chooseOne: {
          fake: "chicken",
          cheese: "mozarella"
        }
      }
    });
    expect(response.result.status).toBe("Error");
    expect(response.result.errorMessage).toBe("Choose one option meat not set");


    response = await customer.callFunction("addRestaurantItemToCart", {
      restaurantId: restaurantUser.id,
      itemId: itemOneId,
      options: {
        chooseOne: {
          meat: "fake",
          cheese: "mozarella"
        }
      }
    });
    expect(response.result.status).toBe("Error");
    expect(response.result.errorMessage).toBe("Choose one option meat cannot be fake");
  });

  it('Add valid items to cart ', async () => {
    let itemToAdd = {
      restaurantId: restaurantUser.id,
      itemId: itemOneId,
      options: {
        chooseOne: {
          meat: "fish",
          cheese: "mozarella"
        },
        chooseMany: {
          lettuce: true,
          tomato: true,
          avocado: false
        },
        sides: {
          frenchFries: true
        }
      }
    }
    response = await customer.callFunction("addRestaurantItemToCart", itemToAdd)
    expect(response.result.status).toBe("Success");
    let cart = await customer.db.get(`users/${customer.id}/cart`);
    expect(cart).not.toBeNull();
    expect(Object.keys(cart.items).length).toBe(1)
    expect(cart.orderType).toBe("restaurant")
    expect(cart.serviceProviderId).toBe(restaurantUser.id)
    expect(cart.total).toBe(9.97)

    let secondItemToAdd = {
      restaurantId: restaurantUser.id,
      itemId: itemOneId,
      options: {
        chooseOne: {
          meat: "beef",
          cheese: "oaxacan"
        },
        chooseMany: {
          lettuce: true,
          tomato: true,
          onion: true,
          avocado: true
        },
      }
    }
    response = await customer.callFunction("addRestaurantItemToCart", secondItemToAdd)
    expect(response.result.status).toBe("Success");
    cart = await customer.db.get(`users/${customer.id}/cart`);
    expect(Object.keys(cart.items).length).toBe(2)
    expect(cart.total).toBe(16.96)

    let thirdItemToAdd = {
      restaurantId: restaurantUser.id,
      itemId: itemOneId,
      options: {
        chooseOne: {
          meat: "chicken",
          cheese: "oaxacan"
        }
      },
      quantity: 5
    }
    response = await customer.callFunction("addRestaurantItemToCart", thirdItemToAdd)
    expect(response.result.status).toBe("Success");
    cart = await customer.db.get(`users/${customer.id}/cart`);
    expect(Object.keys(cart.items).length).toBe(3)
    expect(cart.total).toBe(46.910000000000004)

  })

  it('Add item to cart when cart is filled with items from different restaurant', async () => {
    response = await customer.callFunction("addRestaurantItemToCart", {
      restaurantId: "blah",
      itemId: itemOneId,
      options: {
        chooseOne: {
          fake: "chicken",
          cheese: "mozarella"
        }
      }
    });
    expect(response.result.status).toBe("Error");
    expect(response.result.errorMessage).toBe(`Cart already has items from restaurant ${restaurantUser.id}`);
  })

  it('Increase item count in cart', async () => {
    cart = await customer.db.get(`users/${customer.id}/cart`);
    let itemId = Object.keys(cart.items)[0]
    response = await customer.callFunction("changeItemCountInCart", {
      itemId: itemId,
      countChange: 1
    })
    cart = await customer.db.get(`users/${customer.id}/cart`);
    expect(cart.items[itemId].quantity).toBe(2)
    expect(cart.items[itemId].totalCost).toBe(19.94)
    expect(cart.total).toBe(56.88)
    response = await customer.callFunction("changeItemCountInCart", {
      itemId: itemId,
      countChange: 2
    })
    cart = await customer.db.get(`users/${customer.id}/cart`);
    expect(cart.items[itemId].quantity).toBe(4)
    expect(cart.items[itemId].totalCost).toBe(39.88)
    expect(cart.total).toBe(76.82000000000001)


    // const util = require('util')
    // console.log(util.inspect(cart, false, null, true /* enable colors */))
  })
  it('Decrease item count in cart', async () => {
    cart = await customer.db.get(`users/${customer.id}/cart`);
    let itemId = Object.keys(cart.items)[0]
    response = await customer.callFunction("changeItemCountInCart", {
      itemId: itemId,
      countChange: -1
    })
    cart = await customer.db.get(`users/${customer.id}/cart`);
    expect(cart.items[itemId].quantity).toBe(3)
    expect(cart.items[itemId].totalCost).toBe(29.910000000000004)
    expect(cart.total).toBe(66.85000000000001)
    response = await customer.callFunction("changeItemCountInCart", {
      itemId: itemId,
      countChange: -3
    })
    cart = await customer.db.get(`users/${customer.id}/cart`);
    expect(cart.items[itemId]).toBe(undefined)
    expect(cart.total).toBe(36.940000000000005)
  })


  it('Clear cart', async () => {
    response = await customer.callFunction("clearCart");
    cart = await customer.db.get(`users/${customer.id}/cart`);
    expect(cart).toBeNull()
  })

  it('Cant add unavailable items', async () => {
    await restaurant.updateItem(itemOneId, { available: false })
    response = await customer.callFunction("addRestaurantItemToCart", {
      restaurantId: restaurantUser.id,
      itemId: itemOneId,
      options: {
        chooseOne: {
          fake: "chicken",
          cheese: "mozarella"
        }
      }
    });
    expect(response.result.status).toBe("Error");
    expect(response.result.errorMessage).toBe(`Item not available`);
  })
})

afterAll(() => {
  admin.app().delete()
});