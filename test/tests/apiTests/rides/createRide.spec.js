const axios = require('axios');
const auth = require("../../../libraries/rest/auth")
const helper = require("../../../libraries/helpers")
const admin = require("firebase-admin");


jest.setTimeout(50000)

admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

let adminData = {
  "email":"admin@mezcalmos.com",
  "displayName":"ADMIN",
  "photo": "https://randomuser.me/api/portraits/men/77.jpg",
  "photoURL": "https://randomuser.me/api/portraits/men/77.jpg",
  "password":"password",
  "returnSecureToken":true
}

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
    //newAdmin = await auth.signUp(admin, adminData)
    customer = await auth.signUp(admin, userData)
    driver = await auth.signUp(admin, driverData)
    badUser = await auth.signUp(admin, badUserData)
    await admin.database().ref(`/taxiDrivers/${driver.id}/state/authorizationStatus`).set('authorized')
   // await admin.database().ref(`admins/${newAdmin.id}/authorized`).set('authorized')
  });

  it('Create ride test', async () => {

   
    // approve authorization for driver
  //   let params = {
  //     adminId: newAdmin.id,
  //     userId: driver.id,
  //     userType: 'driver'
  //   }
  //   // let isAdmin = (await admin.database().ref(`admins/${params.adminId}/authorized`).once('value')).val();
  //   // isAdmin = isAdmin != null && isAdmin == true 
  
  //   let request  = await driver.callFunction('approveAuthorizationRequest', params)
    
    // change user's name and photo
    
  //  let changeRequest = await admin.database().ref(`users/${customer.id}/info`).update({
  //    displayName:'helena',
  //    photo: "https://randomuser.me/api/portraits/men/78.jpg"
  //   })

    //Only authorized users can request ride
    let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/requestTaxi`, { data: "cats"})
    expect(response.data.result.status).toBe('Error')
    expect(response.data.result.errorMessage).toBe('User needs to be signed in')
    
    
    //Required information
    response = await customer.callFunction("requestTaxi", "cats")
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe("Required from, to, distance, duration, estimatedPrice and paymentType")
    
    //Request a ride
    response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    
    //test preventing customer from creating another ride before this finishes
    newRequest = await customer.callFunction("requestTaxi", tripData)
    expect(newRequest.result.status).toBe('Error')
    expect(newRequest.result.errorMessage).toBe("Customer is already in another taxi")
    response = await customer.callFunction("cancelTaxiFromCustomer", {})
    
    // ORDER TESTING
    response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    let orderId = response.result.orderId
    let order = await customer.db.get(`orders/taxi/${orderId}`)
    expect(order.customer.id).toBe(customer.id)
    expect(order.customer.image).toBe(userData.photo)
    expect(order.customer.name).toBe(userData.displayName.split(' ')[0])
    expect(order.duration).toBe(tripData.duration)
    expect(order.distance).toBe(tripData.distance)
    expect(order.from).toBe(tripData.from)
    expect(order.to).toBe(tripData.to)
    expect(order.orderType).toBe('taxi')
    expect(order.status).toBe('lookingForTaxi')

    
    let customerOrder = await customer.db.get(`users/${customer.id}/orders/${orderId}`)
    expect(customerOrder).not.toBeNull()
    expect(customerOrder.routeInformation.duration).toBe(tripData.duration)
    expect(customerOrder.routeInformation.distance).toBe(tripData.distance)
    expect(customerOrder.orderType).toBe('taxi')
    expect(customerOrder.status).toBe('lookingForTaxi')
    expect(customerOrder.from).toBe(tripData.from)
    expect(customerOrder.to).toBe(tripData.to)
    
    let customerCurrentOrderId = await customer.db.get(`users/${customer.id}/state/currentOrder`)
    expect(customerCurrentOrderId).not.toBeNull()
    expect(customerCurrentOrderId).toBe(orderId)
    

    // Bad user should not be able to access other customer's order 
    await helper.expectUnauthorized(async () => {
      await badUser.db.get(`orders/taxi/${orderId}`)
    })

    // CHAT TESTING
    let chat = await customer.db.get(`chat/${orderId}`)
    expect(chat).not.toBeNull()
    expect(chat.chatType).toBe("order")
    expect(chat.orderType).toBe("taxi")
    expect(chat.participants[customer.id].image).toBe(userData.photo)
    expect(chat.participants[customer.id].name).toBe(userData.displayName.split(' ')[0])
    expect(chat.participants[customer.id].particpantType).toBe("customer")

    // Bad user should not be able to access other customer's order's chat
    await helper.expectUnauthorized(async () => {
      await badUser.db.get(`chat/${orderId}`)
    })

    // OPEN ORDER TESTING
    let openOrder = await driver.db.get(`openOrders/taxi/${orderId}`)
    expect(openOrder).not.toBeNull()
    expect(openOrder.customer.id).toBe(customer.id)
    expect(openOrder.customer.image).toBe(userData.photo)
    expect(openOrder.customer.name).toBe(userData.displayName.split(' ')[0])
    expect(openOrder.routeInformation.duration).toBe(tripData.duration)
    expect(openOrder.routeInformation.distance).toBe(tripData.distance)
    expect(openOrder.from).toBe(tripData.from)
    expect(openOrder.to).toBe(tripData.to)

    //verify lock order
    orderLock = (await admin.database().ref(`orders/taxi/${orderId}/lock`).once('value')).val()
    expect(orderLock).toBeNull()

    await helper.expectUnauthorized(async () => {
      await customer.db.get(`openOrders/taxi/${orderId}`)
    })

    await helper.expectUnauthorized(async () => {
      await badUser.db.get(`openOrders/taxi/${orderId}`)
    })
   });
})

afterAll(() => {
  admin.app().delete()
});

// Create a ride for Customer
// Customer should be able to read his ride in order's node
// Customer should not be able to modify his ride in order's node
// Customer should not be able to read or write to openOrders
// BadUser should not be able to read or write Customer's order

// Create driver
// Authorize driver
// Driver should be able to read and write location
// Driver should only be able to read orders and state, not modify them
// Driver should be able to read all open orders
// Driver should not be able to write to any open orders

// Let driver accept order
// Driver should be able to read his ride in order's node
// Driver should not be able to modify his ride in order's node except for driver position
// BadUser should not be able to read or write driver's order

// Customer should be able to read his notifications
// Customer should be able to delete his notifications
// BadUser should not be able to read or write customer's notifications

// Let driver send message
// Customer & Driver should be able to read his chat in chat node of that order id
// Customer & Driver should not be able to modify his chat except for messages
// Customer & Driver should only be able to write to messages but not be able to modify or delete
// BadUser should not be able to read or write Customer's chat
