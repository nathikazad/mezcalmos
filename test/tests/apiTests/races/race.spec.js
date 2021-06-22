const axios = require('axios');
const auth = require("../../../libraries/rest/auth")
const helper = require("../../../libraries/helpers")
const admin = require("firebase-admin");
const taxi = require('../../../../functions/helpers/taxi')
// const { acceptTaxiOrder } = require('../../../../functions');
jest.mock('../../../../functions/helpers/sender')
const sender = require('../../../../functions/helpers/sender')

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

let driverData = {
  "email":"driver@mezcalmos.com",
  "displayName":"Driver One",
  "password":"password",
  "photoURL": "https://randomuser.me/api/portraits/men/72.jpg",
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
let customer, driver
describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
    customer = await auth.signUp(admin, userData)
    driver = await auth.signUp(admin, driverData)
    await admin.database().ref(`/taxiDrivers/${driver.id}/state/authorizationStatus`).set('authorized')
  })
  it('Test race conditions', async () => {

  //       //create a request
  //   let response = await customer.callFunction("requestTaxi", tripData)
  //   let orderId = response.result.orderId
  //   expect(response.result.status).toBe('Success')
  //   let order = (await admin.database().ref(`users/${customer.id}/orders/${orderId}`).once('value')).val()

  //   //console.log(order);
  //   expect(order.status).toBe('lookingForTaxi')

  //   // FIRST RACE: accept and cancel and expire at the same time when STATUS IS LOOKING FOR TAXI
  //  let data ={
  //    orderId: orderId
  //  } 
  
  //    response = await admin.database().ref(`/orders/taxi/${data.orderId}/lock`).transaction(function (lock) {
  //     if (lock) {
  //       return 
  //     } else{
  //       return true
  //     }
  //     return lock
  //   })
  //   if (!response.committed) {
  //     //console.log(`lock is not available`)
  //     return {
  //       status: "Error",
  //       errorMessage: "lock is not available"
  //     };
  //   } 
  //   else{
  //     console.log(response);
  //   }
//     // request a ride --------> status:lookForTaxi TO BE:
//        //- accepted by driver ------------> onTheWay
//             //- get started: -----> inTransit
//             //- cancelled by driver ------> cancelled  
//             //- cancelled by customer-----> cancelled
//        //- cancelled by customer 
//        //- expired

//     //create a request
//     let response = await customer.callFunction("requestTaxi", tripData)
//     let orderId = response.result.orderId
//     expect(response.result.status).toBe('Success')
//     let order = (await admin.database().ref(`users/${customer.id}/orders/${orderId}`).once('value')).val()

//     //console.log(order);
//     expect(order.status).toBe('lookingForTaxi')

//     // FIRST RACE: accept and cancel and expire at the same time when STATUS IS LOOKING FOR TAXI
//    let data ={
//      orderId: orderId
//    } 
  
//    let acceptation = taxi.accept(admin, data, driver.id )

   //let cancelling = taxi.cancelTaxiFromCustomer(admin, customer.id)
   
  //  //let expiration = taxi.expireOrder(admin, orderId, customer.id)

  //  let promises = await Promise.all([acceptation, cancelling])
  //  console.log(promises);

    // let acceptedCounter = 0
    // let rejectedCounter = 0
    // let acceptedResponse =  []
    // let rejectedResponse =  []

    // promises.map(el => {
    //   switch(el.status){
    //     case 'Error':
    //       rejectedCounter++,
    //       rejectedResponse.push(el)
    //       break;

    //     case 'Success':
    //       acceptedCounter++,
    //       acceptedResponse.push(el)
    //       break ; 
    //   }
    // })
    // console.log(promises);
    // console.log(promises);
    // //expectations
    // expect(rejectedCounter).toEqual(2)
    // expect(acceptedCounter).toEqual(1)
    // expect(rejectedResponse.length).toEqual(2)
    // expect(acceptedResponse.length).toEqual(1)

    // let currentCustomerOrderState = (await admin.database().ref(`users/${customer.id}/state/currentOrder`).once('value')).val()
    // let customerOrder = (await admin.database().ref(`users/${customer.id}/orders/${orderId}`).once('value')).val()
    // let openOrder = (await admin.database().ref(`openOrders/taxi/${orderId}`).once('value')).val()
    // let orderChat = (await admin.database().ref(`chat/${orderId}`).once('value')).val()
    // let orderExpired = (await admin.database().ref(`orders/taxi/${orderId}`).once('value')).val()
    // let unfulfilledOrder = (await admin.database().ref(`unfulfilledOrders/${orderId}`).once('value')).val()
    // //verification:
    // expect(currentCustomerOrderState).toBeNull()
    // expect(customerOrder).toBeNull()
    // expect(openOrder).toBeNull()
    // expect(orderChat).toBeNull()
    // expect(orderExpired.status).toBe('expired')
    // expect(unfulfilledOrder.status).toBe('expired')
    // expect(unfulfilledOrder.reason).toBe('expired')
    
    // expect(rejectedResponse.result.status).toBe('Error')
    // expect(acceptedResponse.result.status).toBe('Success')
    // // expect(rejectedResponse.length).toEqual(1)
    // // expect(acceptedResponse.length).toEqual(1)
    

       
  })
})

afterAll(() => {
  admin.app().delete()
})