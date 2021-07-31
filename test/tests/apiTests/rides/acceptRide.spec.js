const axios = require('axios');
const auth = require("../../../libraries/rest/auth")
const helper = require("../../../libraries/helpers")
const admin = require("firebase-admin");

jest.setTimeout(150000)

const sleep = ms => {
  console.log(`Sleeping for ${ms/1000} seconds`);
  return new Promise(resolve => {
      setTimeout(resolve, ms);
  })
}

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

let secondDriverData = {
  "email":"secondDriver@mezcalmos.com",
  "displayName":"Second Driver",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/73.jpg",
  "returnSecureToken":true
}

let thirdDriverData = {
  "email":"thirdDriver@mezcalmos.com",
  "displayName":"Third Driver",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/74.jpg",
  "returnSecureToken":true
}
let fourthDriverData = {
  "email":"fourthDriver@mezcalmos.com",
  "displayName":"Fourth Driver",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/75.jpg",
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

let customer, badUser, driver, secondDriver, thirdDriver, fourthDriver


describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
    customer = await auth.signUp(admin, userData)
    driver = await auth.signUp(admin, driverData)
    secondDriver = await auth.signUp(admin, secondDriverData)
    thirdDriver = await auth.signUp(admin, thirdDriverData)
    fourthDriver = await auth.signUp(admin, fourthDriverData)
    badUser = await auth.signUp(admin, badUserData)
    await admin.database().ref(`/taxiDrivers/${driver.id}/state/authorizationStatus`).set('authorized')
    await admin.database().ref(`/taxiDrivers/${secondDriver.id}/state/authorizationStatus`).set(`authorized`)
    await admin.database().ref(`/taxiDrivers/${thirdDriver.id}/state/authorizationStatus`).set(`authorized`)
    await admin.database().ref(`/taxiDrivers/${fourthDriver.id}/state/authorizationStatus`).set(`authorized`)
  });

  it('Accept ride test', async () => {
    
    let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/acceptTaxiOrder`, { data: "cats"})
    expect(response.data.result.status).toBe('Error')
    expect(response.data.result.errorMessage).toBe('User needs to be signed in')

    response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    let orderId = response.result.orderId
    console.log(orderId);

   
    response = await driver.callFunction("acceptTaxiOrder", "cats")
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe('Required orderId')

   // Non taxi drivers cannot accept order
    response = await badUser.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe('User is not an authorized driver')
    
    // accept order by driver
    response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Success')


    //not able to accept a new ride when driver is already on the first ride
    let newRequest = await badUser.callFunction("requestTaxi", tripData)
    expect(newRequest.result.status).toBe('Success')
    let newOrderId = newRequest.result.orderId

    let newResponse = await driver.callFunction("acceptTaxiOrder", {orderId: newOrderId})
    expect(newResponse.result.status).toBe('Error')
    expect(newResponse.result.errorMessage).toBe("Driver is already in another taxi")

    // Driver has access to order and status changed
    let order = await driver.db.get(`orders/taxi/${orderId}`)
    expect(order.status).toBe('onTheWay')
    expect(order.customer.id).toBe(customer.id)

    //driver added to order, driver added to chat
    expect(order.driver.id).toBe(driver.id)
    expect(order.driver.image).toBe(driverData.photoURL)
    expect(order.driver.name).toBe(driverData.displayName.split(' ')[0])

    // added to taxi driver orders
    let driverOrder = await driver.db.get(`taxiDrivers/${driver.id}/orders/${orderId}`)
    expect(driverOrder).not.toBeNull()
    expect(driverOrder.routeInformation.duration).toBe(tripData.duration)
    expect(driverOrder.routeInformation.distance).toBe(tripData.distance)
    expect(driverOrder.to).toBe(tripData.to)
    expect(driverOrder.status).toBe("onTheWay")
    expect(driverOrder.customer.id).toBe(customer.id)
    expect(driverOrder.customer.image).toBe(userData.photoURL)
    expect(driverOrder.customer.name).toBe(userData.displayName.split(' ')[0])

    // taxi driver state changed to orderId
    let driverStatus = await driver.db.get(`taxiDrivers/${driver.id}/state/currentOrder`)
    expect(driverStatus).toBe(orderId)

    // verify order status change
    let orderStatus = (await admin.database().ref(`users/${order.customer.id}/orders/${orderId}`).once('value')).val()
    expect(orderStatus.driver.id).toBe(order.driver.id)
    expect(orderStatus.status).toBe(order.status)
    expect(orderStatus.acceptRideTime).toBe(order.acceptRideTime)

    // updated customer node
    let customerOrder = await customer.db.get(`orders/taxi/${orderId}`)
    expect(customerOrder.driver.id).toBe(driver.id)
    expect(customerOrder.driver.image).toBe(driverData.photoURL)
    expect(customerOrder.driver.name).toBe(driverData.displayName.split(' ')[0])
    expect(customerOrder.status).toBe("onTheWay")

    // removed from open orders, added to in process
    let openOrder = await driver.db.get(`openOrders/taxi/${orderId}`)
    expect(openOrder).toBeNull()
    let inProcessOrder = (await admin.database().ref(`inProcessOrders/taxi/${orderId}`).once('value')).val()
    expect(inProcessOrder.driver.id).toBe(driver.id)
    expect(inProcessOrder.customer.id).toBe(customer.id)

    // driver added to chat participants
    let chat = await driver.db.get(`chat/${orderId}`)
    expect(chat.participants[driver.id].image).toBe(driverData.photoURL)
    expect(chat.participants[driver.id].name).toBe(driverData.displayName.split(' ')[0])
    expect(chat.participants[driver.id].particpantType).toBe("taxi")

    // customer notified
    let customerNotifications = await customer.db.get(`notifications/customer/${customer.id}`)
    expect(customerNotifications).not.toBeNull()

    let customerNotification = customerNotifications[Object.keys(customerNotifications)[0]]
    expect(customerNotification.driver.id).toBe(driver.id)
    expect(customerNotification.driver.image).toBe(driverData.photoURL)
    expect(customerNotification.driver.name).toBe(driverData.displayName.split(' ')[0])
    expect(customerNotification.notificationType).toBe('orderStatusChange')
    expect(customerNotification.orderId).toBe(orderId)
    expect(customerNotification.orderType).toBe('taxi')
    expect(customerNotification.status).toBe('onTheWay')

    //verify lock
    orderLock = (await admin.database().ref(`orders/taxi/${orderId}/lock`).once('value')).val()
    expect(orderLock).toBeNull()

    //cancelling the orders
     response = await customer.callFunction("cancelTaxiFromCustomer", {orderId: orderId})
     expect(response.result.status).toBe('Success')

     response = await badUser.callFunction("cancelTaxiFromCustomer", {orderId: newOrderId})
     expect(response.result.status).toBe('Success')

    //Test when different drivers are accepting one same ride:
    response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    orderId = response.result.orderId

    let firstDriverResponse = driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    let secondDriverResponse = secondDriver.callFunction("acceptTaxiOrder", {orderId: orderId})
    let thirdDriverResponse = thirdDriver.callFunction("acceptTaxiOrder", {orderId : orderId})

    data = await Promise.all([firstDriverResponse, secondDriverResponse, thirdDriverResponse])
    //console.log(data);
    let acceptedCounter = 0
    let rejectedCounter = 0
    let acceptedResponse = []
    let rejectedResponse = []

    data.map( el => {
      if(el.status)
        el.result = {status:el.status}
      if(el.errorMessage)
        el.result.errorMessage = el.errorMessage
      switch(el.result.status){
      case 'Error':
        rejectedCounter++ ;
        rejectedResponse.push(el.result)
         break;
       case 'Success':
         acceptedCounter++ ;
         
         acceptedResponse.push(el)
         break; 
       }
     })

    let length = data.length 
   
    expect(acceptedCounter).toEqual(1)
    expect(acceptedResponse).toHaveLength(1)
    expect(acceptedResponse[0].result.status).toBe('Success')

    expect(rejectedCounter).toEqual(2)
    expect(rejectedResponse).toHaveLength(2)
    expect(rejectedResponse[0].status).toBe('Error')
    expect(rejectedResponse[1].status).toBe('Error')
    
    //Test when one same ride is being accepted by the same driver several times:
    response = await customer.callFunction("cancelTaxiFromCustomer", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    orderId = response.result.orderId

    driverResponse = driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    secondDriverResponse = driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    thirdDriverResponse = driver.callFunction("acceptTaxiOrder", {orderId : orderId})

    data = await Promise.all([driverResponse, secondDriverResponse, thirdDriverResponse])
    //console.log(data);
    acceptedCounter = 0
    rejectedCounter = 0
    acceptedResponse = []
    rejectedResponse = []

    data.map( el => {
      if(el.status)
        el.result = {status:el.status}
      if(el.errorMessage)
        el.result.errorMessage = el.errorMessage
      switch(el.result.status){
      case 'Error':
        rejectedCounter++ ;
        rejectedResponse.push(el.result)
         break;
       case 'Success':
         acceptedCounter++ ;
         
         acceptedResponse.push(el)
         break; 
       }
     })

    expect(acceptedCounter).toEqual(1)
    expect(acceptedResponse).toHaveLength(1)
    expect(acceptedResponse[0].result.status).toBe('Success')

    expect(rejectedCounter).toEqual(2)
    expect(rejectedResponse).toHaveLength(2)
    expect(rejectedResponse[0].status).toBe('Error')
    expect(rejectedResponse[1].status).toBe('Error')
    
    orderLock = (await admin.database().ref(`orders/taxi/${orderId}/lock`).once('value')).val()
    expect(orderLock).toBeNull()


  })
  //
 
});

afterAll(() => {
  admin.app().delete()
});
