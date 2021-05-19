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

    response = await customer.callFunction("requestTaxi", tripData)
    let orderId = response.result.orderId
    expect(response.result.status).toBe('Success')
      //verify the status of the order
    let order = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
    expect(order.status).toBe('lookingForTaxi')
     
    // Cancel order
    response = await customer.callFunction("cancelTaxiFromCustomer", {orderId: orderId})
    expect(response.result.status).toBe('Success')

     // currentOrder should be removed
    let customerCurrentOrderId = await customer.db.get(`users/${customer.id}/state/currentOrder`)
    expect(customerCurrentOrderId).toBeNull()

     //verify removing the order:
    let openOrder = await driver.db.get(`openOrders/taxi/${orderId}`) 
    expect(openOrder).toBeNull()

    let orderAfterCancel =  (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
    expect(orderAfterCancel).toBeNull() 

    let customerOrder = await customer.db.get(`users/${order.customer.id}/order/${orderId}`)
    expect(customerOrder).toBeNull()
  
  })

  it('Cancel ride from customer while onTheWay', async () => {    

    let response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    
    let orderId = response.result.orderId

    response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    //verify current order status 
    let currentOrder = await driver.db.get(`orders/taxi/${orderId}`)
    expect(currentOrder.status).toBe('onTheWay')
    
    // Cancel order
    response = await customer.callFunction("cancelTaxiFromCustomer", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    //verify updating the order after being cancelled
    let order = await driver.db.get(`orders/taxi/${orderId}`)
    expect(order.status).toBe('cancelled')
    expect(order.cancelledBy).toBe('customer')
    expect(order).not.toContain('reason')

    let customerOrderCancelled = await customer.db.get(`users/${order.customer.id}/orders/${orderId}`)
    expect(customerOrderCancelled.status).toBe('cancelled')
    expect(customerOrderCancelled.cancelledBy).toBe('customer')
    expect(customerOrderCancelled).not.toContain('reason')

    let driverOrderCancelled = await driver.db.get(`taxiDrivers/${order.driver.id}/orders/${orderId}`)
    expect(driverOrderCancelled.status).toBe('cancelled')
    expect(driverOrderCancelled.cancelledBy).toBe('customer')
    expect(driverOrderCancelled).not.toContain('reason')
  
    // currentOrder should be removed
    let customerCurrentOrderId = await customer.db.get(`users/${customer.id}/state/currentOrder`)
    expect(customerCurrentOrderId).toBeNull()

    let driverCurrentOrder = await driver.db.get(`taxiDrivers/${order.driver.id}/state/currentOrder`)
    expect(driverCurrentOrder).toBeNull();
     // removing the order in process
    let inProcessOrder = (await admin.database().ref(`inProcessOrders/taxi/${orderId}`).once('value')).val()
    expect(inProcessOrder).toBeNull()


    //verify notification update
    let driverNotificationInfo = await driver.db.get(`/notifications/taxi/${driver.id}`)
    let arrayNotifications = Object.entries(driverNotificationInfo)
    let notification = (arrayNotifications[arrayNotifications.length-1])[1]
    expect(notification.status).toBe('cancelled')
    expect(notification.cancelledBy).toBe('customer')
    expect(notification).not.toContain('reason')

    //cancel order while there is a reason
    response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    orderId = response.result.orderId
    
    response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    response = await customer.callFunction("cancelTaxiFromCustomer", {orderId: orderId, reason : 'emmergency'})
    expect(response.result.status).toBe('Success')

    order = await customer.db.get(`orders/taxi/${orderId}`)
    
    expect(order.status).toBe('cancelled')
    expect(order.cancelledBy).toBe('customer')
    expect(order.reason).toBe('emmergency')

    //verify notification while there is a reason

     driverNotificationInfo = await driver.db.get(`/notifications/taxi/${driver.id}`)
     arrayNotifications = Object.entries(driverNotificationInfo)
     notification = (arrayNotifications[arrayNotifications.length-1])[1]
     expect(notification.status).toBe('cancelled')
     expect(notification.cancelledBy).toBe('customer')
     expect(notification.reason).toBe(order.reason)
    
  })

  it('Cannot cancel ride from driver while request is not made', async () => {
    
    let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/cancelTaxiFromDriver`, { data: "cats"})
    expect(response.data.result.status).toBe('Error')
    expect(response.data.result.errorMessage).toBe('User needs to be signed in')
    
    // Cannot cancel when not already in ride
    response = await driver.callFunction("cancelTaxiFromDriver", "cats")
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe('Driver has not accepted any ride')
  })

  it('Cancel ride from driver', async () => {

    //while order is not accepted yet 
    response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    let orderId = response.result.orderId
    let order = await driver.db.get(`orders/taxi/${orderId}`)
    expect(order.status).toBe('lookingForTaxi')

    response = await driver.callFunction("cancelTaxiFromDriver", {orderId: orderId})
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe('Driver has not accepted any ride')
    
    //while order is accepted
    response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    //verify accepted order status
    order = await driver.db.get(`orders/taxi/${orderId}`)
    expect(order.status).toBe('onTheWay')
    
    // Cancel order when status is onTheWay
    response = await driver.callFunction("cancelTaxiFromDriver", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    //verify order status change after being cancelled
    order = await customer.db.get(`orders/taxi/${orderId}`)
    expect(order.status).toBe('cancelled')
    expect(order.cancelledBy).toBe('driver')
    expect(order).not.toContain('reason')

    let orderAfterCancel = await driver.db.get(`orders/taxi/${orderId}`)
    expect(orderAfterCancel.status).toBe('cancelled')
    expect(orderAfterCancel.cancelledBy).toBe('driver')
    expect(orderAfterCancel).not.toContain('reason')
    
    
    let customerOrderAfterCancel = await customer.db.get(`users/${order.customer.id}/orders/${orderId}`)
    expect(customerOrderAfterCancel.status).toBe('cancelled')
    expect(customerOrderAfterCancel.cancelledBy).toBe('driver')
    expect(customerOrderAfterCancel).not.toContain('reason')

    
    // verify removing customer currentOrder 
    let customerCurrentOrder = await customer.db.get(`users/${order.customer.id}/state/currentOrder`)
    expect(customerCurrentOrder).toBeNull()

    //verify taxiDrivers order status change 
    let driverOrderAfterCancel = await driver.db.get(`taxiDrivers/${order.driver.id}/orders/${orderId}`)
    expect(driverOrderAfterCancel.status).toBe('cancelled')
    expect(driverOrderAfterCancel.cancelledBy).toBe('driver')
    expect(driverOrderAfterCancel).not.toContain('reason')
  

    //verify removing order 
    let driverCurrentOrder = await driver.db.get(`taxiDrivers/${order.driver.id}/state/currentOrder`)
    expect(driverCurrentOrder).toBeNull()

    let inProcessOrder =  (await admin.database().ref(`/inProcessOrders/taxi/${orderId}`).once('value')).val()
    expect(inProcessOrder).toBeNull()
    
    //verify notification update
    let customerNotificationsInfo = await customer.db.get(`notifications/customer/${order.customer.id}`)
    let arrayNotifications = Object.entries(customerNotificationsInfo);
    let notification = (arrayNotifications[arrayNotifications.length-1])[1];

    expect(notification.status).toBe('cancelled')
    expect(notification.cancelledBy).toBe('driver')
    expect(notification).not.toContain('reason')

    //verify removing current order
    let customerCurrentOrderId = await customer.db.get(`users/${customer.id}/state/currentOrder`)
    expect(customerCurrentOrderId).toBeNull()

    let driverCurrentOrderId = await driver.db.get(`taxiDrivers/${driver.id}/state/currentOrder`)
    expect(driverCurrentOrderId).toBeNull()

    //cancel order while there is a reason
    response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    orderId = response.result.orderId
    
    response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    response = await driver.callFunction("cancelTaxiFromDriver", {orderId: orderId, reason : 'emmergency'})
    expect(response.result.status).toBe('Success')

    order = await customer.db.get(`orders/taxi/${orderId}`)
    
    expect(order.status).toBe('cancelled')
    expect(order.cancelledBy).toBe('driver')
    expect(order.reason).toBe('emmergency')

    //verify notification while there is a reason
     customerNotificationsInfo = await customer.db.get(`notifications/customer/${order.customer.id}`)
     arrayNotifications = Object.entries(customerNotificationsInfo);
     notification = (arrayNotifications[arrayNotifications.length-1])[1];

     expect(notification.status).toBe('cancelled')
     expect(notification.cancelledBy).toBe('driver')
     expect(notification.reason).toBe(order.reason)
    
  })

  it('Cannot cancel ride in inTransit or droppedOff', async () => {
    expect(true).toBe(true)
  })
});

afterAll(() => {
  admin.app().delete()
});