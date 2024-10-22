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
    // thirdCustomer = await auth.signUp(admin, thirdUserData)
    driver = await auth.signUp(admin, driverData)
    // secondDriver = await auth.signUp(admin, secondDriverData)
    // thirdDriver = await auth.signUp(admin, thirdDriverData)
    await admin.database().ref(`/taxiDrivers/${driver.id}/state/authorizationStatus`).set('authorized')
    // await admin.database().ref(`/taxiDrivers/${secondDriver.id}/state/authorizationStatus`).set('authorized')
    // await admin.database().ref(`/taxiDrivers/${thirdDriver.id}/state/authorizationStatus`).set('authorized')
  })

  it('Test multiple requests', async () => {
    
    let promiseArray = []
    for (let i = 0; i < 10; i++) {
      promiseArray.push(randomDelay(100, () => customer.callFunction('requestTaxi', tripData)))
    }
    promises = await Promise.all(promiseArray)
    //console.log(promises);

    let acceptedCounter = 0
    let rejectedCounter = 0
    let acceptedResponse =  []
    let rejectedResponse =  []

    promises.map(el => {
      // if(el.result){
      //   el.status = el.result.status
      // }
      switch(el.result.status){
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
    
    let requestsNumber = promises.length
    expect(acceptedCounter).toEqual(1)
    expect(rejectedCounter).toEqual(requestsNumber-1)

    acceptedResponse = acceptedResponse[0]
    expect(acceptedResponse.result.status).toBe('Success')
    rejectedResponse.map(el => expect(el.result.status).toBe('Error'))

    // when setting locks have to make sure lock is always returned(meaning: removed) otherwise no future requests will work and user will get locked out forever, this is the big risk of using locks. Have to be 100% certain that its not possible.
    let customerLock = (await admin.database().ref(`/users/${customer.id}/lock`).once('value')).val()
    expect(customerLock).toEqual(null)
  })
})

afterAll(() => {
  admin.app().delete()
})