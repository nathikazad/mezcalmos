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
    it('Finish Ride Test', async () => {

     //user has to be signed in
     let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/finishTaxiRide`, { data: "cats"})
     expect(response.data.result.status).toBe('Error')
     expect(response.data.result.errorMessage).toBe('User needs to be signed in') 
     
     //let order = (await admin.database().ref(`orders/taxi`).once('value')).val()
     //test when no order is created yet 
     response = await driver.callFunction('finishTaxiRide', 'cats')
     expect(response.result.status).toBe('Error')
     expect(response.result.errorMessage).toBe("Driver has not accepted any ride")

     //test when an order is created but not yet accepted
     response = await customer.callFunction('requestTaxi', tripData)
     let orderId = response.result.orderId
     expect(response.result.status).toBe('Success')

     console.log(orderId);
     
     let order = await customer.db.get(`orders/taxi/${orderId}`)
     expect(order.status).toBe('lookingForTaxi')

     
     response = await driver.callFunction('finishTaxiRide', orderId)
     expect(response.result.status).toBe('Error')
     expect(response.result.errorMessage).toBe("Driver has not accepted any ride")

     
     //test when the order is accepted by a driver but not yet started
     response = await driver.callFunction('acceptTaxiOrder', {orderId: orderId})
     expect(response.result.status).toBe('Success')


     let orderBeforeStart = await driver.db.get(`taxiDrivers/${driver.id}/orders/${orderId}`)
     expect(orderBeforeStart.status).toBe('onTheWay') 
     
     response = await driver.callFunction('finishTaxiRide', orderId)
     expect(response.result.status).toBe('Error')
     expect(response.result.errorMessage).toBe("Ride status is not inTransit but onTheWay")

     //test when the order is starting
     response = await driver.callFunction('startTaxiRide', {orderId: orderId})
     expect(response.result.status).toBe('Success')

     order = await customer.db.get(`orders/taxi/${orderId}`)
     
     let orderAfterStart = await driver.db.get(`taxiDrivers/${driver.id}/orders/${orderId}`)
     expect(orderAfterStart.status).toBe('inTransit')

     let notifications = await customer.db.get(`notifications/customer/${order.customer.id}`)
     let arrayNotifications = Object.entries(notifications)
     let notification = (arrayNotifications[arrayNotifications.length-1])[1]
     expect(notification.status).toBe('inTransit')

     response = await driver.callFunction('finishTaxiRide', {orderId: orderId})
     expect(response.result.status).toBe('Success')

     let orderFinished = await customer.db.get(`orders/taxi/${orderId}`)
     expect(orderFinished.status).toBe('droppedOff')
     
     let customerOrderFinished = await customer.db.get(`users/${order.customer.id}/orders/${orderId}`)
     expect(customerOrderFinished.status).toBe('droppedOff') 

     let driverOrderFinished = await driver.db.get(`taxiDrivers/${order.driver.id}/orders/${orderId}`)
     expect(driverOrderFinished.status).toBe('droppedOff')

     let driverCurrentOrder = await driver.db.get(`taxiDrivers/${order.driver.id}/state/currentOrder`)
     expect(driverCurrentOrder).toBeNull()

     let customerCurrentOrder = await customer.db.get(`users/${order.customer.id}/state/currentOrder`)
     expect(customerCurrentOrder).toBeNull()

     let inProcessOrder = (await admin.database().ref(`inProcessOrder/taxi/${orderId}`).once('value')).val()
     expect(inProcessOrder).toBeNull() 


    //verify notification after finishing the ride
     notificationsAfterFinish = await customer.db.get(`notifications/customer/${order.customer.id}`)
     arrayNotifications = Object.entries(notificationsAfterFinish)
     notification = (arrayNotifications[arrayNotifications.length-1])[1]
     expect(notification.status).toBe('droppedOff')
     expect(notification.notificationType).toBe('orderStatusChange')

     orderLock = (await admin.database().ref(`orders/taxi/${orderId}/lock`).once('value')).val()
     expect(orderLock).toBeNull()
    })

    
})

afterAll(() => {
    admin.app().delete();
})
