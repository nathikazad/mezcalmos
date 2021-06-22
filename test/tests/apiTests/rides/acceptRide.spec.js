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
    
  //   let response = await axios.post(`http://localhost:5001/mezcalmos-31f1c/us-central1/acceptTaxiOrder`, { data: "cats"})
  //   expect(response.data.result.status).toBe('Error')
  //   expect(response.data.result.errorMessage).toBe('User needs to be signed in')

  //   response = await customer.callFunction("requestTaxi", tripData)
  //  // console.log(response);
  //   expect(response.result.status).toBe('Success')
  //   let orderId = response.result.orderId

  //   response = await driver.callFunction("acceptTaxiOrder", "cats")
  //   expect(response.result.status).toBe('Error')
  //   expect(response.result.errorMessage).toBe('Required orderId')

  //   // Non taxi drivers cannot accept order
  //   response = await badUser.callFunction("acceptTaxiOrder", {orderId: orderId})
  //   expect(response.result.status).toBe('Error')
  //   expect(response.result.errorMessage).toBe('User is not an authorized driver')
    
  //   // //
  //   response = await driver.callFunction("acceptTaxiOrder", {orderId: orderId})
  //   expect(response.result.status).toBe('Success')

  //   //not able to accept a new ride when driver is already on the first ride
  //   let newRequest = await badUser.callFunction("requestTaxi", tripData)
  //   //console.log(newRequest);
  //   expect(newRequest.result.status).toBe('Success')
  //   let newOrderId = newRequest.result.orderId
  //   let newResponse = await driver.callFunction("acceptTaxiOrder", {orderId: newOrderId})
    
  //   expect(newResponse.result.status).toBe('Error')
  //   expect(newResponse.result.errorMessage).toBe("Driver is already in another taxi")


  //   // Driver has access to order and status changed
  //   let order = await driver.db.get(`orders/taxi/${orderId}`)
  //   expect(order.status).toBe('onTheWay')
  //   expect(order.customer.id).toBe(customer.id)

  //   // driver added to order, driver added to chat
  //   expect(order.driver.id).toBe(driver.id)
  //   expect(order.driver.image).toBe(driverData.photoURL)
  //   expect(order.driver.name).toBe(driverData.displayName.split(' ')[0])

  //   // added to taxi driver orders
  //   let driverOrder = await driver.db.get(`taxiDrivers/${driver.id}/orders/${orderId}`)
  //   expect(driverOrder).not.toBeNull()
  //   expect(driverOrder.routeInformation.duration).toBe(tripData.duration)
  //   expect(driverOrder.routeInformation.distance).toBe(tripData.distance)
  //   expect(driverOrder.to).toBe(tripData.to)
  //   expect(driverOrder.status).toBe("onTheWay")
  //   expect(driverOrder.customer.id).toBe(customer.id)
  //   expect(driverOrder.customer.image).toBe(userData.photoURL)
  //   expect(driverOrder.customer.name).toBe(userData.displayName.split(' ')[0])

  //   // taxi driver state changed to orderId
  //   let driverStatus = await driver.db.get(`taxiDrivers/${driver.id}/state/currentOrder`)
  //   expect(driverStatus).toBe(orderId)
  //   // verify order status change
  //   let orderStatus = (await admin.database().ref(`users/${order.customer.id}/orders/${orderId}`).once('value')).val()
  //   expect(orderStatus.driver.id).toBe(order.driver.id)
  //   expect(orderStatus.status).toBe(order.status)
  //   expect(orderStatus.acceptRideTime).toBe(order.acceptRideTime)
  //   // updated customer node
  //   let customerOrder = await customer.db.get(`orders/taxi/${orderId}`)
  //   expect(customerOrder.driver.id).toBe(driver.id)
  //   expect(customerOrder.driver.image).toBe(driverData.photoURL)
  //   expect(customerOrder.driver.name).toBe(driverData.displayName.split(' ')[0])
  //   expect(customerOrder.status).toBe("onTheWay")

  //   // removed from open orders, added to in process
  //   let openOrder = await driver.db.get(`openOrders/taxi/${orderId}`)
  //   expect(openOrder).toBeNull()
  //   let inProcessOrder = (await admin.database().ref(`inProcessOrders/taxi/${orderId}`).once('value')).val()
  //   expect(inProcessOrder.driver.id).toBe(driver.id)
  //   expect(inProcessOrder.customer.id).toBe(customer.id)

  //   // driver added to chat participants
  //   let chat = await driver.db.get(`chat/${orderId}`)
  //   expect(chat.participants[driver.id].image).toBe(driverData.photoURL)
  //   expect(chat.participants[driver.id].name).toBe(driverData.displayName.split(' ')[0])
  //   expect(chat.participants[driver.id].particpantType).toBe("taxi")

  //   // customer notified
  //   let customerNotifications = await customer.db.get(`notifications/customer/${customer.id}`)
  //   expect(customerNotifications).not.toBeNull()

  //   let customerNotification = customerNotifications[Object.keys(customerNotifications)[0]]
  //   expect(customerNotification.driver.id).toBe(driver.id)
  //   expect(customerNotification.driver.image).toBe(driverData.photoURL)
  //   expect(customerNotification.driver.name).toBe(driverData.displayName.split(' ')[0])
  //   expect(customerNotification.notificationType).toBe('orderStatusChange')
  //   expect(customerNotification.orderId).toBe(orderId)
  //   expect(customerNotification.orderType).toBe('taxi')
  //   expect(customerNotification.status).toBe('onTheWay')

  //   //cancelling the orders
   //   response = await customer.callFunction("cancelTaxiFromCustomer", {orderId: orderId})
   //   expect(response.result.status).toBe('Success')

   //   response = await badUser.callFunction("cancelTaxiFromCustomer", {orderId: newOrderId})



   //   expect(response.result.status).toBe('Success')

    //Test when three drivers are accepting one same ride
    response = await customer.callFunction("requestTaxi", tripData)
    expect(response.result.status).toBe('Success')
    orderId = response.result.orderId




    // //we have three accept requests



    // let driverResponse = driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    // let secondDriverResponse = secondDriver.callFunction("acceptTaxiOrder", {orderId: orderId})
    // let thirdDriverResponse = thirdDriver.callFunction("acceptTaxiOrder", {orderId : orderId})

    // let data = await Promise.all([driverResponse, secondDriverResponse, thirdDriverResponse])

    // // we have four accept requests

    
    let driverResponse = driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    let secondDriverResponse = driver.callFunction("acceptTaxiOrder", {orderId: orderId})
    let thirdDriverResponse = driver.callFunction("acceptTaxiOrder", {orderId : orderId})
    let fourthDriverResponse = driver.callFunction("acceptTaxiOrder", {orderId : orderId})
   
    let cancel = customer.callFunction('cancelTaxiFromCustomer', {})

    const expireOrder = require('../../../../functions/helpers/taxi/expire')
    let expireResponse =  new Promise(resolve => {
      console.log("start timeout", Date.now()%60000)
      setTimeout(resolve, 10000-Date.now()%10000);
     }).then(function() {
      console.log("end timeout", Date.now()%60000)
      return expireOrder(admin, orderId, customer.id) 
    });
    let data = await Promise.all([driverResponse, secondDriverResponse, thirdDriverResponse, fourthDriverResponse, cancel, expireResponse])


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

  
    console.log('acceptedCounter', acceptedCounter),
    console.log('rejectedCounter', rejectedCounter)
    console.log('accepted response', acceptedResponse);
    console.log('rejected responses',rejectedResponse)
   
    
    
    


    //console.log(cancel);

    

   
    // // let data = await Promise.all([driverResponse, secondDriverResponse, thirdDriverResponse]).then(results => {
    // //   results.forEach(el => console.log(el.result.status))
    // // })
    // // let firstPromise = data[0]
    // // let secondPromise = data[1]
    // // let thirdPromise = data[2]
    // // //console.log(data)
    // // //console.log(firstPromise);
   ;

    
    // // verify the number of rejected requests
    // expect(rejectedResponse).toHaveLength(2)

    // // verify rejected requests status and errorMessage
    // rejectedResponse.map(el => {
    //   expect(el.status).toBe('Error')
    //   expect(el.errorMessage).toBe('Ride is not available, please try accepting another ride')
    // })

    // //verify the number of accepted requests
    // expect(acceptedResponse).toHaveLength(1)
    
    // //verify accepted requests status
    // acceptedResponse.map(el => {
    //   expect(el.status).toBe('Success')
    // })

    // let taxiDrivers = (await admin.database().ref(`taxiDrivers/`).once('value')).val()
    // let drivers = Object.entries(taxiDrivers)
    // console.log(drivers[0][0]);
  //   let driversId = Object.keys(taxiDrivers)
  //   console.log(driversId);
  //   //console.log(drivers);
  //   let chargedDrivers = drivers.filter(el => el[1].state.currentOrder == orderId)
  //   console.log(chargedDrivers);
  //   length = chargedDrivers.length
  //   if(length >= 2){
  //       idToSave = (await firebase.database().ref(`orders/taxi/${data.orderId}/driver/id`).once('value')).val()
  //       idToDelete = driversId.filter(id => id != idToSave)
  //       idToDelete.map(id => {
  //         firebase.database().ref(`taxiDrivers/${id}/orders/${data.orderId}`).update({
  //           status: 'cancelled',
  //           reason: 'not available anymore. Please accept another ride'
  //         })
  //         notification.push(firebase, id, {
  //                 notificationType: "orderStatusChange",
  //                 orderId: data.orderId,
  //                 orderType: order.orderType,
  //                 status: 'cancelled',
  //                 reason: 'no longer available, accept another ride',
                  
  //               })
  //       })

  //Filter 
  // let taxiDrivers = (await firebase.database().ref(`taxiDrivers/`).once('value')).val()
  //   let drivers = Object.entries(taxiDrivers)
  //   let driversId = Object.keys(taxiDrivers)
  //   //console.log(driversId);
  //   //console.log(drivers);
  //   let chargedDrivers = drivers.filter(el => el[1].state.currentOrder == data.orderId)
  //   //console.log(chargedDrivers);
  //   let length = chargedDrivers.length
  //   if(length >= 2){
  //       idToSave = (await firebase.database().ref(`orders/taxi/${data.orderId}/driver/id`).once('value')).val()
  //       // idToSave = drivers[0]
  //       idToDelete = driversId.filter(id => id != idToSave)
  //       idToDelete.map(id => {
  //         firebase.database().ref(`taxiDrivers/${id}/orders/${data.orderId}`).update({
  //           status: 'cancelled',
  //           reason: 'not available anymore. Please accept another ride'
  //         })
  //         notification.push(firebase, id, {
  //                 notificationType: "orderStatusChange",
  //                 orderId: data.orderId,
  //                 orderType: order.orderType,
  //                 status: 'cancelled',
  //                 reason: 'no longer available, accept another ride',
                  
  //         })
  //       }) 
  //       if(uid != idToSave){
  //         return{
  //           status:'Error',
  //           errorMessage: 'Not available anymore.Please accept another ride'
  //         }
  //       } else {
  //         return {
  //           status: "Success"
  //         }
  //       }
  //   }

   })
  //
 
});

afterAll(() => {
  admin.app().delete()
});
