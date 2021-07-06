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

let driverData = {
  "email":"driver@mezcalmos.com",
  "displayName":"Driver One",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/74.jpg",
  "returnSecureToken":true
}


let customer, driver

describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
    customer = await auth.signUp(admin, userData)
    driver = await auth.signUp(admin, driverData)
    await admin.database().ref(`/taxiDrivers/${driver.id}/state/authorizationStatus`).set('authorized')
  })

  it('Test race conditions while order-status is ON THE WAY', async () => {
    
      let response = await customer.callFunction("requestTaxi", tripData)
      //console.log('response',response);
      let  orderId = response.result.orderId
      let order = (await admin.database().ref(`users/${customer.id}/orders/${orderId}`).once('value')).val()

      expect(response.result.status).toBe('Success')
      expect(order.status).toBe('lookingForTaxi')

      let data = {
        orderId: orderId
      } 
      // accept ride
      accept = await driver.callFunction('acceptTaxiOrder', data)
      expect(accept.result.status).toBe('Success')

      order = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
      expect(order.status).toBe('onTheWay')

      let promiseArray = [] 

      for (let i = 0; i < 5; i++) {
        promiseArray.push(randomDelay(250, () => driver.callFunction('cancelTaxiFromDriver', data)))
        promiseArray.push(randomDelay(250, () => customer.callFunction('cancelTaxiFromCustomer', {})))
        promiseArray.push(randomDelay(250, () => driver.callFunction('startTaxiRide', {})))
      }
      
      promises = await Promise.all(promiseArray)
     // console.log('promises', promises);

      let acceptedCounter = 0
      let rejectedCounter = 0
      let acceptedResponse =  []
      let rejectedResponse =  []

      promises.map(el => {
        if(el.result){
          el.status = el.result.status
        }
        //console.log(el)
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

      let requestsNumber = promises.length      
      expect(acceptedCounter).toBeGreaterThanOrEqual(1)
      expect(acceptedCounter).toBeLessThanOrEqual(2)
      expect(rejectedCounter).toEqual(requestsNumber-acceptedCounter)

      order= (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
      if(acceptedCounter == 1){
        //verify that the ride has been cancelled before getting started
        expect(order).not.toHaveProperty('rideStartTime')
        expect(order.status).toBe('cancelled')
      }
      if(acceptedCounter == 2){
        //Verify that the order has started, then has been cancelled
        expect(order).toHaveProperty('rideStartTime')
        expect(order).toHaveProperty('rideFinishTime')
        expect(order.status).toBe('cancelled') 
      }
      acceptedResponse.map(el => {
        expect(el.status).toBe('Success')
      })
      rejectedResponse.map( el => {
        expect(el.status).toBe('Error')
      })

      orderLock = (await admin.database().ref(`orders/taxi/${orderId}/lock`).once('value')).val()
      expect(orderLock).toBeNull()

  })
})

afterAll(() => {
  admin.app().delete()
})