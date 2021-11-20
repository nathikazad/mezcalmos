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
let itemOne = fakeRestaurantData.item
let cart = fakeRestaurantData.sampleCart

let customer, restaurantUser, restaurant, itemOneId
describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
    customer = await auth.signUp(admin, userData)
    restaurantUser = await auth.signUp(admin, restaurantData)
    restaurant = new restaurantLib.Restaurant(restaurantUser);
    await restaurant.setRestaurantInfo(admin, restaurantInfo);
    itemOneId = await restaurant.addItem(itemOne);
  });

  it('Should not allow checkout', async () => {
    // if no from provided
    let response = await customer.callFunction("restaurant-checkoutCart");
    expect(response.result.status).toBe("Error");
    expect(response.result.errorMessage).toBe("No to address or payment type");

    // // if cart is empty
    // response = await customer.callFunction("restaurant-checkoutCart", {
    //   to: "fromAddress",
    //   paymentType: "cash"
    // });
    // expect(response.result.status).toBe("Error");
    // expect(response.result.errorMessage).toBe("Cart does not exist");
    // restaurantId is invalid
    cart.serviceProviderId = restaurantUser.id;
    cart.items["BCQWR"].id = itemOneId;
    await customer.db.set(`customers/info/${customer.id}/cart`, cart)
    await admin.database().ref(`customers/info/${customer.id}/cart/serviceProviderId`).set("invalid");
    response = await customer.callFunction("restaurant-checkoutCart", {
      to: "fromAddress",
      paymentType: "cash"
    });
    expect(response.result.status).toBe("Error");
    expect(response.result.errorMessage).toBe("Invalid restaurant id");
    // restaurant is closed
    await admin.database()
      .ref(`customers/info/${customer.id}/cart/serviceProviderId`).set(restaurantUser.id);
    response = await customer.callFunction("restaurant-checkoutCart", {
      to: "fromAddress",
      paymentType: "cash",
      serviceProviderId: restaurantUser.id
    });
    console.log(response)
    expect(response.result.status).toBe("Error");
    expect(response.result.errorMessage).toBe("Restaurant is closed");

  })

  // it('Should allow checkout', async () => {
  //   await admin.database()
  //     .ref(`/restaurants/info/${restaurantUser.id}/state/open`).set(true);
  //   response = await customer.callFunction("restaurant-checkoutCart", {
  //     to: "fromAddress",
  //     paymentType: "cash"
  //   });
  //   console.log(response);
  //   expect(response.result.status).toBe("Success");

  //   cart = await customer.db.get(`customers/info/${customer.id}/cart`);
  //   expect(cart).toBeNull()
  // })
  afterAll(() => {
    admin.app().delete()
  });
})