const axios = require('axios');
const auth = require("../../../libraries/rest/auth")
const helper = require("../../../libraries/helpers")
const admin = require("firebase-admin");

// jest.setTimeout(30000)

admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

let userData = {
  "email":"customer@mezcalmos.com",
  "displayName":"Customer One",
  "photo": "https://randomuser.me/api/portraits/men/70.jpg",
  "photoURL": "https://randomuser.me/api/portraits/men/70.jpg",
  "password":"password",
  "returnSecureToken":true
}

let badUserData = {
  "email":"baduser@mezcalmos.com",
  "displayName":"Bad User",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/71.jpg",
  "returnSecureToken":true
}

let driverData = {
  "email":"driver@mezcalmos.com",
  "displayName":"Driver One",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/72.jpg",
  "returnSecureToken":true
}

let tripData = {
  'from': "home",
  'to': "office",
  'duration': 10,
  'distance': 5,
  'estimatedPrice': '2$',
  'paymentType': 'Paypal'
}

let customer, badUser, driver


describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
    customer = await auth.signUp(admin, userData)
    driver = await auth.signUp(admin, driverData)
    badUser = await auth.signUp(admin, badUserData)
    await admin.database().ref(`/taxiDrivers/${driver.id}/state/authorizationStatus`).set('authorized')
  });

  it('Send message test', async () => {
    
    // request taxi
    let response = await customer.callFunction("requestTaxi", tripData)
    let orderId = response.result.orderId
    
    // accept taxi
    response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Success')
    let newMessage = {
      orderId: orderId,
      message: "Hey",
      userId: customer.id,
      timestamp: (new Date()).toUTCString()
    }

    response = await customer.sendMessage(orderId, newMessage)
    console.log(response.result);
    await new Promise(res => setTimeout(() => {
      res()
    }, 200))
    let driverNotifications = await driver.db.get(`notifications/taxi/${driver.id}`)
    expect(driverNotifications).not.toBeNull()

    let driverNotification = driverNotifications[Object.keys(driverNotifications)[0]]
    expect(driverNotification.chatType).toBe("order")
    expect(driverNotification.message).toBe(newMessage.message)
    expect(driverNotification.notificationType).toBe('newMessage')
    expect(driverNotification.orderId).toBe(orderId)
    expect(driverNotification.sender.id).toBe(customer.id)
    expect(driverNotification.sender.image).toBe(userData.photo)
    expect(driverNotification.sender.name).toBe(userData.displayName.split(' ')[0])
    
  })
});

afterAll(() => {
  admin.app().delete()
});
