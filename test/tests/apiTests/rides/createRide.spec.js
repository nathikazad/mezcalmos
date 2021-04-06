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
  "photo": "https://randomuser.me/api/portraits/men/71.jpg",
  "returnSecureToken":true
}

let driverData = {
  "email":"driver@mezcalmos.com",
  "displayName":"Driver One",
  "password":"password",
  "photo": "https://randomuser.me/api/portraits/men/72.jpg",
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

  it('Create ride test', async () => {

    // Only authorized users can request ride
    let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/requestTaxi`, { data: "cats"})
    expect(response.data.result.status).toBe('Error')
    expect(response.data.result.errorMessage).toBe('User needs to be signed in')
    
    
    // Required from address
    response = await customer.callFunction("requestTaxi",  "cats")
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe('Required from location')


    let data = {
      from: "home"
    }
    response = await customer.callFunction("requestTaxi", data)
    expect(response.result.status).toBe('Success')
    
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
    
    // Bad user should not be able to access other customer's order 
    await helper.expectUnauthorized(async () => {
      await badUser.db.get(`orders/taxi/${orderId}`)
    })

    // CHAT TESTING
    let chat = await customer.db.get(`chat/${orderId}`)
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

    expect(openOrder.customer.id).toBe(customer.id)
    expect(openOrder.customer.image).toBe(userData.photo)
    expect(openOrder.customer.name).toBe(userData.displayName.split(' ')[0])
    expect(openOrder.routeInformation.duration).toBe(tripData.duration)
    expect(openOrder.routeInformation.distance).toBe(tripData.distance)
    expect(openOrder.from).toBe(tripData.from)
    expect(openOrder.to).toBe(tripData.to)

    await helper.expectUnauthorized(async () => {
      await customer.db.get(`openOrders/taxi/${orderId}`)
    })

    await helper.expectUnauthorized(async () => {
      await badUser.db.get(`openOrders/taxi/${orderId}`)
    })
  });

  it('Accept ride test', async () => {
    
    let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/acceptTaxiOrder`, { data: "cats"})
    expect(response.data.result.status).toBe('Error')
    expect(response.data.result.errorMessage).toBe('User needs to be signed in')


    response = await customer.callFunction("requestTaxi", tripData)
    let orderId = response.result.orderId

    response = await driver.callFunction("acceptTaxiOrder", "cats")
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe('Required orderId')

    // Non taxi drivers cannot accept order
    response = await badUser.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Error')
    expect(response.result.errorMessage).toBe('User is not an authorized driver')
    
    //
    response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    expect(response.result.status).toBe('Success')

    // Driver has access to order and status changed
    let order = await driver.db.get(`orders/taxi/${orderId}`)
    expect(order.status).toBe('onTheWay')

    // driver added to order, driver added to chat
    expect(order.driver.id).toBe(driver.id)
    expect(order.driver.image).toBe(driverData.photo)
    expect(order.driver.name).toBe(driverData.displayName.split(' ')[0])


    // added to taxi driver orders
    let driverOrder = await driver.db.get(`taxiDrivers/${driver.id}/orders/${orderId}`)
    expect(driverOrder).not.toBeNull()
    expect(driverOrder.routeInformation.duration).toBe(tripData.duration)
    expect(driverOrder.routeInformation.distance).toBe(tripData.distance)
    expect(driverOrder.to).toBe(tripData.to)
    expect(driverOrder.status).toBe("onTheWay")
    expect(driverOrder.customer.id).toBe(customer.id)
    expect(driverOrder.customer.image).toBe(userData.photo)
    expect(driverOrder.customer.name).toBe(userData.displayName.split(' ')[0])

    // taxi driver state changed to orderId
    let driverStatus = await driver.db.get(`taxiDrivers/${driver.id}/state/inTaxi`)
    expect(driverStatus).toBe(orderId)

    // updated customer node
    let customerOrder = await customer.db.get(`orders/taxi/${orderId}`)
    expect(customerOrder.driver.id).toBe(driver.id)
    expect(customerOrder.driver.image).toBe(driverData.photo)
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
    expect(chat.participants[driver.id].image).toBe(driverData.photo)
    expect(chat.participants[driver.id].name).toBe(driverData.displayName.split(' ')[0])
    expect(chat.participants[driver.id].particpantType).toBe("taxi")

    // customer notified
    let customerNotifications = await customer.db.get(`notifications/customer/${customer.id}`)
    expect(customerNotifications).not.toBeNull()

    let customerNotification = customerNotifications[Object.keys(customerNotifications)[0]]
    expect(customerNotification.driver.id).toBe(driver.id)
    expect(customerNotification.driver.image).toBe(driverData.photo)
    expect(customerNotification.driver.name).toBe(driverData.displayName.split(' ')[0])
    expect(customerNotification.notificationType).toBe('orderStatusChange')
    expect(customerNotification.orderId).toBe(orderId)
    expect(customerNotification.orderType).toBe('taxi')
    expect(customerNotification.status).toBe('onTheWay')
  })
});

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