const axios = require('axios');
const auth = require("../../../libraries/rest/auth")
const helper = require("../../../libraries/helpers")
const admin = require("firebase-admin");
const expireOrder = require('../../../../functions/helpers/taxi/expire');
const { expectUnauthorized } = require('../../../libraries/helpers');

admin.initializeApp({
    projectId: "mezcalmos-31f1c",
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
  });
  
  let tripData = {
    'from': "home",
    'to': "office",
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
    "photoURL": "https://randomuser.me/api/portraits/men/72.jpg",
    "returnSecureToken":true
  }

  let customer, driver

  describe('Mezcalmos' , () => {

      beforeAll(async () => {
        await helper.clearDatabase(admin)
        customer = await auth.signUp(admin, userData)
        driver = await auth.signUp(admin, driverData)
        await admin.database().ref(`/taxiDrivers/${driver.id}/state/authorizationStatus`).set('authorized')
      })

      it('Test expire when there is no order', async () => {
         let orderId = 'cats'
         response = await expireOrder(admin, orderId, customer.id)
         expect(response.status).toBe('Error')
         expect(response.errorMessage).toBe('Order id does not match any order')
        
      })

      it('Test expire when ride status is LookingForTaxi', async () => {
          // create ride
         let response = await customer.callFunction('requestTaxi', tripData)
         expect(response.result.status).toBe('Success')

         let orderId = response.result.orderId
         let order = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
         expect(order.status).toBe('lookingForTaxi')

         // send expiration
         response = await expireOrder(admin, orderId, customer.id)
         expect(response.status).toBe('Success')

         // verify removing order
         customerCurrentOrder = (await admin.database().ref(`users/${customer.id}/state/currentOrder`).once('value')).val()
         expect(customerCurrentOrder).toBeNull()

         customerOrder = (await admin.database().ref(`users/${customer.id}/orders/${orderId}`).once('value')).val()
         expect(customerOrder).toBeNull()

         openOrder = (await admin.database().ref(`openOrders/taxi/${orderId}`).once('value')).val()
         expect(openOrder).toBeNull()

         chat = (await admin.database().ref(`chat/${orderId}`).once('value')).val()
         expect(chat).toBeNull()

         //verify updates
         orderExpired = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
      
         expect(orderExpired.customer.id).toBe(order.customer.id)
         expect(orderExpired.customer.image).toBe(order.customer.image) 
         expect(orderExpired.distance).toBe(order.distance)
         expect(orderExpired.duration).toBe(order.duration)
         expect(orderExpired.estimatedPrice).toBe(order.estimatedPrice)
         expect(orderExpired.from).toBe(order.from)
         expect(orderExpired.orderType).toBe(order.orderType)
         expect(orderExpired.paymentType).toBe(order.paymentType)
         expect(orderExpired.to).toBe(order.to)
         expect(orderExpired.status).toBe('expired')
         expect(orderExpired).toHaveProperty('rideFinishTime')
         expect(orderExpired.rideFinishTime).not.toBeNull()

         unfulfilledOrder = (await admin.database().ref(`unfulfilledOrders/${orderId}`).once('value')).val()
         expect(unfulfilledOrder.reason).toBe('expired')
         expect(unfulfilledOrder.status).toBe(orderExpired.status)
         expect(unfulfilledOrder.rideFinishTime).toBe(orderExpired.rideFinishTime)


         //verify notification
         notification = (await admin.database().ref(`notifications/customer/${customer.id}`).once('value')).val()
         //console.log(Object.values(notification));
         long = Object.values(notification).length
         customerNotification = (Object.values(notification))[long-1]
         
         expect(customerNotification.notificationType).toBe('orderStatusChange')
         expect(customerNotification.orderId).toBe(orderId)
         expect(customerNotification.orderType).toBe(order.orderType)
         expect(customerNotification.rideFinishTime).toBe(orderExpired.rideFinishTime)
         expect(customerNotification.status).toBe(orderExpired.status)

       })

       it('Test expire when ride status is onTHeWay', async () => {
        // create ride
       let response = await customer.callFunction('requestTaxi', tripData)
       console.log(response);
       expect(response.result.status).toBe('Success')
        // accept ride
       let orderId = response.result.orderId
       response = await driver.callFunction('acceptTaxiOrder', {orderId: orderId})
       
       expect(response.result.status).toBe('Success')
       let order = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
       expect(order.status).toBe('onTheWay')

       // send expiration
       response = await expireOrder(admin, orderId, customer.id)
       expect(response.status).toBe('Success')

       // verify removing order
       driverOrder = (await admin.database().ref(`/taxiDrivers/${driver.id}/orders/${orderId}`).once('value')).val()
       expect(driverOrder).toBeNull()
       
       driverCurrentOrder = (await admin.database().ref(`/taxiDrivers/${driver.id}/state/currentOrder`).once('value')).val()
       expect(driverCurrentOrder).toBeNull()

       customerCurrentOrder = (await admin.database().ref(`users/${customer.id}/state/currentOrder`).once('value')).val()
       expect(customerCurrentOrder).toBeNull()

       customerOrder = (await admin.database().ref(`users/${customer.id}/orders/${orderId}`).once('value')).val()
       expect(customerOrder).toBeNull()

       openOrder = (await admin.database().ref(`openOrders/taxi/${orderId}`).once('value')).val()
       expect(openOrder).toBeNull()
     
       chat = (await admin.database().ref(`chat/${orderId}`).once('value')).val()
       expect(chat).toBeNull()

       //verify updates
       orderExpired = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
    
       expect(orderExpired.customer.id).toBe(order.customer.id)
       expect(orderExpired.customer.image).toBe(order.customer.image) 
       expect(orderExpired.distance).toBe(order.distance)
       expect(orderExpired.duration).toBe(order.duration)
       expect(orderExpired.estimatedPrice).toBe(order.estimatedPrice)
       expect(orderExpired.from).toBe(order.from)
       expect(orderExpired.orderType).toBe(order.orderType)
       expect(orderExpired.paymentType).toBe(order.paymentType)
       expect(orderExpired.to).toBe(order.to)
       expect(orderExpired.status).toBe('expired')
       expect(orderExpired).toHaveProperty('rideFinishTime')
       expect(orderExpired.rideFinishTime).not.toBeNull()

       unfulfilledOrder = (await admin.database().ref(`unfulfilledOrders/${orderId}`).once('value')).val()
       expect(unfulfilledOrder.reason).toBe('expired')
       expect(unfulfilledOrder.status).toBe(orderExpired.status)
       expect(unfulfilledOrder.rideFinishTime).toBe(orderExpired.rideFinishTime)


       //verify notification
       notification = (await admin.database().ref(`notifications/customer/${customer.id}`).once('value')).val()
       //console.log(Object.values(notification));
       long = Object.values(notification).length
       customerNotification = (Object.values(notification))[long-1]
       
       expect(customerNotification.notificationType).toBe('orderStatusChange')
       expect(customerNotification.orderId).toBe(orderId)
       expect(customerNotification.orderType).toBe(order.orderType)
       expect(customerNotification.rideFinishTime).toBe(orderExpired.rideFinishTime)
       expect(customerNotification.status).toBe(orderExpired.status)


    })


     it('Test expire when ride status is inTransit', async () => {
        // create ride
       let response = await customer.callFunction('requestTaxi', tripData)
       console.log(response);
       expect(response.result.status).toBe('Success')
        // accept ride
       orderId = response.result.orderId
       response = await driver.callFunction('acceptTaxiOrder', {orderId: orderId})
       console.log('accept', response);
       expect(response.result.status).toBe('Success')
       //start ride
       response = await driver.callFunction('startTaxiRide', {})  
       console.log(response);
       expect(response.result.status).toBe('Success')
       let order = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
       expect(order.status).toBe('inTransit')

       // send expiration
       response = await expireOrder(admin, orderId, customer.id)
       expect(response.status).toBe('Success')

       // verify removing order
       driverOrder = (await admin.database().ref(`/taxiDrivers/${driver.id}/orders/${orderId}`).once('value')).val()
       expect(driverOrder).toBeNull()
       
       driverCurrentOrder = (await admin.database().ref(`/taxiDrivers/${driver.id}/state/currentOrder`).once('value')).val()
       expect(driverCurrentOrder).toBeNull()

       customerCurrentOrder = (await admin.database().ref(`users/${customer.id}/state/currentOrder`).once('value')).val()
       expect(customerCurrentOrder).toBeNull()

       customerOrder = (await admin.database().ref(`users/${customer.id}/orders/${orderId}`).once('value')).val()
       expect(customerOrder).toBeNull()

       openOrder = (await admin.database().ref(`openOrders/taxi/${orderId}`).once('value')).val()
       expect(openOrder).toBeNull()

       chat = (await admin.database().ref(`chat/${orderId}`).once('value')).val()
       expect(chat).toBeNull()

       //verify updates
       orderExpired = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
    
       expect(orderExpired.customer.id).toBe(order.customer.id)
       expect(orderExpired.customer.image).toBe(order.customer.image) 
       expect(orderExpired.distance).toBe(order.distance)
       expect(orderExpired.duration).toBe(order.duration)
       expect(orderExpired.estimatedPrice).toBe(order.estimatedPrice)
       expect(orderExpired.from).toBe(order.from)
       expect(orderExpired.orderType).toBe(order.orderType)
       expect(orderExpired.paymentType).toBe(order.paymentType)
       expect(orderExpired.to).toBe(order.to)
       expect(orderExpired.status).toBe('expired')
       expect(orderExpired).toHaveProperty('rideFinishTime')
       expect(orderExpired.rideFinishTime).not.toBeNull()

       unfulfilledOrder = (await admin.database().ref(`unfulfilledOrders/${orderId}`).once('value')).val()
       expect(unfulfilledOrder.reason).toBe('expired')
       expect(unfulfilledOrder.status).toBe(orderExpired.status)
       expect(unfulfilledOrder.rideFinishTime).toBe(orderExpired.rideFinishTime)


       //verify notification
       notification = (await admin.database().ref(`notifications/customer/${customer.id}`).once('value')).val()
       //console.log(Object.values(notification));
       long = Object.values(notification).length
       customerNotification = (Object.values(notification))[long-1]
       
       expect(customerNotification.notificationType).toBe('orderStatusChange')
       expect(customerNotification.orderId).toBe(orderId)
       expect(customerNotification.orderType).toBe(order.orderType)
       expect(customerNotification.rideFinishTime).toBe(orderExpired.rideFinishTime)
       expect(customerNotification.status).toBe(orderExpired.status)

    })
    it('Test expire when ride status is inTransit', async () => {
        // create ride
       let response = await customer.callFunction('requestTaxi', tripData)
       expect(response.result.status).toBe('Success')

        // accept ride
       orderId = response.result.orderId
       response = await driver.callFunction('acceptTaxiOrder', {orderId: orderId})
       expect(response.result.status).toBe('Success')

       //start ride
       response = await driver.callFunction('startTaxiRide', {})  
       expect(response.result.status).toBe('Success')

       //finish ride
       response = await driver.callFunction('finishTaxiRide', {})  
       expect(response.result.status).toBe('Success')

       let order = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
       expect(order.status).toBe('droppedOff')

       // send expiration
    //    response = await expireOrder(admin, orderId, customer.id)
    //    expect(response.status).toBe('Success')

    //    // verify removing order
    //    driverOrder = (await admin.database().ref(`/taxiDrivers/${driver.id}/orders/${orderId}`).once('value')).val()
    //    expect(driverOrder).toBeNull()
       
    //    driverCurrentOrder = (await admin.database().ref(`/taxiDrivers/${driver.id}/state/currentOrder`).once('value')).val()
    //    expect(driverCurrentOrder).toBeNull()

    //    customerCurrentOrder = (await admin.database().ref(`users/${customer.id}/state/currentOrder`).once('value')).val()
    //    expect(customerCurrentOrder).toBeNull()

    //    customerOrder = (await admin.database().ref(`users/${customer.id}/orders/${orderId}`).once('value')).val()
    //    expect(customerOrder).toBeNull()

    //    openOrder = (await admin.database().ref(`openOrders/taxi/${orderId}`).once('value')).val()
    //    expect(openOrder).toBeNull()

    //    chat = (await admin.database().ref(`chat/${orderId}`).once('value')).val()
    //    expect(chat).toBeNull()

    //    //verify updates
    //    orderExpired = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
    
    //    expect(orderExpired.customer.id).toBe(order.customer.id)
    //    expect(orderExpired.customer.image).toBe(order.customer.image) 
    //    expect(orderExpired.distance).toBe(order.distance)
    //    expect(orderExpired.duration).toBe(order.duration)
    //    expect(orderExpired.estimatedPrice).toBe(order.estimatedPrice)
    //    expect(orderExpired.from).toBe(order.from)
    //    expect(orderExpired.orderType).toBe(order.orderType)
    //    expect(orderExpired.paymentType).toBe(order.paymentType)
    //    expect(orderExpired.to).toBe(order.to)
    //    expect(orderExpired.status).toBe('expired')
    //    expect(orderExpired).toHaveProperty('rideFinishTime')
    //    expect(orderExpired.rideFinishTime).not.toBeNull()

    //    unfulfilledOrder = (await admin.database().ref(`unfulfilledOrders/${orderId}`).once('value')).val()
    //    expect(unfulfilledOrder.reason).toBe('expired')
    //    expect(unfulfilledOrder.status).toBe(orderExpired.status)
    //    expect(unfulfilledOrder.rideFinishTime).toBe(orderExpired.rideFinishTime)


    //    //verify notification
    //    notification = (await admin.database().ref(`notifications/customer/${customer.id}`).once('value')).val()
    //    //console.log(Object.values(notification));
    //    long = Object.values(notification).length
    //    customerNotification = (Object.values(notification))[long-1]
       
    //    expect(customerNotification.notificationType).toBe('orderStatusChange')
    //    expect(customerNotification.orderId).toBe(orderId)
    //    expect(customerNotification.orderType).toBe(order.orderType)
    //    expect(customerNotification.rideFinishTime).toBe(orderExpired.rideFinishTime)
    //    expect(customerNotification.status).toBe(orderExpired.status)

    })
 })

  afterAll(() => {
    admin.app().delete()
  })