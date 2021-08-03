const axios = require('axios');
const auth = require("../../../libraries/rest/auth");
const helper = require("../../../libraries/helpers");
const admin = require("firebase-admin");

jest.setTimeout(30000)

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

let customer, driver, badUser

describe('Mezcalmos', () => {
     beforeAll( async () => {
        await helper.clearDatabase(admin)
        customer = await auth.signUp(admin, userData)
        driver = await auth.signUp(admin, driverData)
        badUser = await auth.signUp(admin, badUserData)
        await admin.database().ref(`/taxiDrivers/${driver.id}/state/authorizationStatus`).set('authorized')
     });

    it ('Start Ride test ', async () => {

     //user has to be signed in
     let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/startTaxiRide`, { data: "cats"})
     expect(response.data.result.status).toBe('Error')
     expect(response.data.result.errorMessage).toBe('User needs to be signed in') 

     //test when there is no order yet
     response = await driver.callFunction('startTaxiRide', 'cats')
     expect(response.result.status).toBe('Error')
     expect(response.result.errorMessage).toBe('Driver has not accepted any ride')
    
    // test when there is an order which is not accepted yet
     response = await customer.callFunction('requestTaxi', tripData);
     expect(response.result.status).toBe('Success')

     let orderId = response.result.orderId
     let order = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
     expect(order.status).toBe('lookingForTaxi')
   
     response = await driver.callFunction('startTaxiRide', {orderId: orderId})
     expect(response.result.status).toBe('Error')
     expect(response.result.errorMessage).toBe('Driver has not accepted any ride')

     //test when the order is accepted
     response = await driver.callFunction('acceptTaxiOrder', {orderId: orderId})
     expect(response.result.status).toBe('Success')
   

     let orderBeforeStart = await driver.db.get(`taxiDrivers/${driver.id}/orders/${orderId}`)
     expect(orderBeforeStart.status).toBe('onTheWay')

     let notificationsBeforeStart = await customer.db.get(`notifications/customer/${order.customer.id}`)
     let arrayNotifications = Object.entries(notificationsBeforeStart)
     let notification = (arrayNotifications[arrayNotifications.length-1])[1]
     expect(notification.status).toBe('onTheWay')
     
     response = await driver.callFunction('startTaxiRide', {orderId: orderId})
     expect(response.result.status).toBe('Success')

     //verify the status change after start 
     let orderAfterStart = await driver.db.get(`taxiDrivers/${driver.id}/orders/${orderId}`)
     expect(orderAfterStart.status).toBe('inTransit')

     let customerOrder = await customer.db.get(`users/${order.customer.id}/orders/${orderId}`)
     expect(customerOrder.status).toBe('inTransit')

     order = await driver.db.get(`orders/taxi/${orderId}`)
     expect(order.status).toBe('inTransit')

     //verify notification after start
     let notificationsAfterStart = await customer.db.get(`notifications/customer/${order.customer.id}`)
     arrayNotifications = Object.entries(notificationsAfterStart)
     notification = (arrayNotifications[arrayNotifications.length-1])[1]

     expect(notification.status).toBe('inTransit')
     expect(notification.notificationType).toBe('orderStatusChange')

     orderLock = (await admin.database().ref(`orders/taxi/${orderId}/lock`).once('value')).val()
     expect(orderLock).toBeNull()
    
    })
  
   
});

afterAll(() => {
    admin.app().delete()
})
