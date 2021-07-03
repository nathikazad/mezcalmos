const axios = require('axios');
const auth = require("../../../libraries/rest/auth")
const helper = require("../../../libraries/helpers")
const admin = require("firebase-admin");
const expireOrder = require('../../../../functions/helpers/taxi/expire')

jest.mock('../../../../functions/helpers/sender')
const sender = require('../../../../functions/helpers/sender');
//const { startTaxiRide } = require('../../../../functions');
jest.setTimeout(150000)

admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

function randomDelay(maxDelay, fn){
  let delay = Math.floor(Math.random() * maxDelay)
  return new Promise(resolve => {
    setTimeout(resolve, delay);
  }).then(()=>{
    return fn();
  });
}

function fixedAndRandomDelay(fixedDelay, maxDelay, fn){
  let delay = Math.floor(Math.random() * maxDelay)
  return new Promise(resolve => {
    setTimeout(resolve, fixedDelay + delay);
  }).then(()=>{
    return fn();
  });
}

let tripData = {
  'from': {
    'address': "Main street, first city"
  },
  'to': {
    'address': "Second Main street, third city"
  },
  'duration': 10,
  'distance': 5,
  'estimatedPrice': '2$',
  'paymentType': 'Paypal'
}
let userData = {
  "email":"customer@mezcalmos.com",
  "displayName":"Customer One",
  "photo": "https://randomuser.me/api/portraits/men/70.jpg",
  "photoURL": "https://randomuser.me/api/portraits/men/70.jpg",
  "password":"password",
  "returnSecureToken":true
}
let secondUserData = {
  "email":"customertwo@mezcalmos.com",
  "displayName":"Customer Two",
  "photo": "https://randomuser.me/api/portraits/men/72.jpg",
  "photoURL": "https://randomuser.me/api/portraits/men/72.jpg",
  "password":"password",
  "returnSecureToken":true
}
let thirdUserData = {
  "email":"customerthree@mezcalmos.com",
  "displayName":"Customer Three",
  "photo": "https://randomuser.me/api/portraits/men/73.jpg",
  "photoURL": "https://randomuser.me/api/portraits/men/73.jpg",
  "password":"password",
  "returnSecureToken":true
}

let driverData = {
  "email":"driver@mezcalmos.com",
  "displayName":"Driver One",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/74.jpg",
  "returnSecureToken":true
}
let secondDriverData = {
  "email":"secondDriver@mezcalmos.com",
  "displayName":"Driver Two",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/75.jpg",
  "returnSecureToken":true
}
let thirdDriverData = {
  "email":"thirdDriver@mezcalmos.com",
  "displayName":"Driver Three",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/76.jpg",
  "returnSecureToken":true
}

let customer, secondCustomer, thirdCustomer, driver, secondDriver, thirdDriver
describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
    customer = await auth.signUp(admin, userData)
    secondCustomer = await auth.signUp(admin, secondUserData)
    thirdCustomer = await auth.signUp(admin, thirdUserData)
    driver = await auth.signUp(admin, driverData)
    secondDriver = await auth.signUp(admin, secondDriverData)
    thirdDriver = await auth.signUp(admin, thirdDriverData)
    await admin.database().ref(`/taxiDrivers/${driver.id}/state/authorizationStatus`).set('authorized')
    await admin.database().ref(`/taxiDrivers/${secondDriver.id}/state/authorizationStatus`).set('authorized')
    await admin.database().ref(`/taxiDrivers/${thirdDriver.id}/state/authorizationStatus`).set('authorized')
  })

  

  it('Test accept race conditions', async () => {
    // create ride
     response = await secondCustomer.callFunction("requestTaxi", tripData)
     orderId = response.result.orderId
     order = (await admin.database().ref(`users/${secondCustomer.id}/orders/${orderId}`).once('value')).val()

    expect(response.result.status).toBe('Success')
    expect(order.status).toBe('lookingForTaxi')

    data = {
      orderId: orderId
    } 

    let promiseArray = []
    for (let i = 0; i < 10; i++) {
      promiseArray.push(randomDelay(100, () => driver.callFunction('acceptTaxiOrder', data)))
    }
    
    promises = await Promise.all(promiseArray)

    let acceptedCounter = 0
    let rejectedCounter = 0
    let acceptedResponse =  []
    let rejectedResponse =  []

    
    promises.map(el => {
      if(el.result){
        el.status = el.result.status
      }
      switch(el.status){
      case 'Error':
        rejectedCounter++,
        rejectedResponse.push(el)
        break;

      case 'Success':
        acceptedCounter++,
        acceptedResponse.push(el)
        break ; 
      }
    })

    acceptedResponse = acceptedResponse [0]
    let requestsNumber = promises.length

    // expect(acceptedCounter).toBeLessThanOrEqual(2)
    expect(acceptedCounter).toEqual(1)
    expect(rejectedCounter).toEqual(requestsNumber-acceptedCounter)
    
    let orderLock = (await admin.database().ref(`/orders/taxi/${orderId}/lock`).once('value')).val()
    expect(orderLock).toEqual(null)
  })
})

afterAll(() => {
  admin.app().delete()
})