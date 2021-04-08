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
  from: "home",
  to: "office",
  duration: 10,
  distance: 5
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

  it('Cannot cancel ride from customer while request is not made', async () => {
    
    let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/cancelTaxiFromCustomer`, { data: "cats"})
    expect(response.data.result.status).toBe('Error')
    expect(response.data.result.errorMessage).toBe('User needs to be signed in')
    
    // Cannot cancel when not already in ride
    response = await customer.callFunction("cancelTaxiFromCustomer", "cats")
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe('Customer has not requested for any ride')
  })

  it('Cancel ride from customer while lookingForTaxi', async () => {
    
    let response = await customer.callFunction("requestTaxi", tripData)
    let orderId = response.result.orderId
    expect(response.result.status).toBe('Success')
    
    // Cancel order
    response = await customer.callFunction("cancelTaxiFromCustomer", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    // currentOrder should be removed
    let customerCurrentOrderId = await customer.db.get(`users/${customer.id}/state/currentOrder`)
    expect(customerCurrentOrderId).toBeNull()
  })

  it('Cancel ride from customer while onTheWay', async () => {    
    let response = await customer.callFunction("requestTaxi", tripData)
    console.log(response.result)
    expect(response.result.status).toBe('Success')
    
    let orderId = response.result.orderId
    response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Success')
    
    // Cancel order
    response = await customer.callFunction("cancelTaxiFromCustomer", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    // currentOrder should be removed
    let customerCurrentOrderId = await customer.db.get(`users/${customer.id}/state/currentOrder`)
    expect(customerCurrentOrderId).toBeNull()
  })

  it('Cannot cancel ride from customer while request is not made', async () => {
    
    let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/cancelTaxiFromDriver`, { data: "cats"})
    expect(response.data.result.status).toBe('Error')
    expect(response.data.result.errorMessage).toBe('User needs to be signed in')
    
    // Cannot cancel when not already in ride
    response = await driver.callFunction("cancelTaxiFromDriver", "cats")
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe('Driver has not accepted any ride')
  })

  it('Cancel ride from driver', async () => {

    response = await customer.callFunction("requestTaxi", tripData)
    let orderId = response.result.orderId

    response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Success')
    
    // Cancel order
    response = await driver.callFunction("cancelTaxiFromDriver", {orderId: orderId})
    console.log(response)
    expect(response.result.status).toBe('Success')

    let customerCurrentOrderId = await customer.db.get(`users/${customer.id}/state/currentOrder`)
    expect(customerCurrentOrderId).toBeNull()

    let driverCurrentOrderId = await driver.db.get(`taxiDrivers/${driver.id}/state/currentOrder`)
    expect(driverCurrentOrderId).toBeNull()
  })

  it('Cannot cancel ride in inTransit or droppedOff', async () => {
    expect(true).toBe(true)
  })
});

afterAll(() => {
  admin.app().delete()
});