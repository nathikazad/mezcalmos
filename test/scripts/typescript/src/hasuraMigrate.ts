import * as firebaseAdmin from "firebase-admin";
import * as functions from "firebase-functions";

import * as fs from 'fs';
import { getHasura } from "../../../../functions/src/utilities/hasura";
import { insertRestaurants } from "../../../../functions/src/shared/graphql/restaurant/insertRestaurants";
import { insertRestaurantOrders } from "../../../../functions/src/shared/graphql/restaurant/order/insertRestaurantOrders"
import { insertRestaurantOperators } from "../../../../functions/src/shared/graphql/restaurant/operators/insertRestaurantOperators"
import { insertDeliveryDrivers } from "../../../../functions/src/shared/graphql/delivery/driver/insertDeliveryDrivers"
import { insertCustomers } from "../../../../functions/src/shared/graphql/user/customer/insertCustomers"
import { insertLaundryStores } from "../../../../functions/src/shared/graphql/laundry/insertLaundry"
import { insertLaundryOrders } from "../../../../functions/src/shared/graphql/laundry/order/insertLaundryOrders"
import { insertServiceLinks } from "../../../../functions/src/shared/graphql/insertServiceLinks"

import { insertUsers } from "../../../../functions/src/shared/graphql/user/insertUsers"
import { Language } from "../../../../functions/src/shared/models/Generic/Generic";

// process.env.FUNCTIONS_EMULATOR = "true";
var serviceAccount = require("./../../../../../../../../service_account_production.json");

const firebaseConfig = {
  apiKey: "AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0",
  authDomain: "mezcalmos-31f1c.firebaseapp.com",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
  projectId: "mezcalmos-31f1c",
  storageBucket: "mezcalmos-31f1c.appspot.com",
  messagingSenderId: "804036698204",
  appId: "1:804036698204:web:39b22436cbb4ef633f8699",
  measurementId: "G-5R20EL7CL9",
  credential: firebaseAdmin.credential.cert("/home/sanchit/Work/mezcalmos/service_account_production.json")
};

const firebase = firebaseAdmin.initializeApp(
  firebaseConfig
//   {
//   databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
//   credential: firebaseAdmin.credential.cert(serviceAccount),
// }
)
// , "production");

functions.config()

process.chdir('../')
console.log("Current working directory: ", process.cwd()); 


async function saveFile() {
  let db = (await firebase.database().ref(`/orders/past/restaurant`).once('value')).val();
  console.log("finished downloading, starting write");

  let data = JSON.stringify(db, null, "\t");
  fs.writeFileSync("./data/db-snapshot-restaurant-orders.json", data);
  console.log("Finished");
}
async function writeToDB() {

//   // await deleteUsers()
//   // await deleteDrivers()
//   // await deleteOrders()
//   // return
  let restaurants = JSON.parse(fs.readFileSync('./data/db-snapshot.json').toString());
  
  // let drivers = data.taxiDrivers
  // let users = data.users

  let array = []
  for(let restaurantFirebaseId in restaurants) {
    let restaurant = restaurants[restaurantFirebaseId]; 
    if(!restaurant)
      continue
    let categoryArray = [];
    if(restaurant.menu) {
      let categories = restaurant.menu.daily

      for(let categoryFirebaseId in categories) {
        let category = categories[categoryFirebaseId]; 
        if(!category || !(category.name))
          continue
        // if(!(category.items))
        //   console.log(restaurant, category);

        let itemArray = [];
        if(category.items) {
          let items = category.items
          for(let itemFirebaseId in items) {
            let item = items[itemFirebaseId];
            if(!item)
              continue
            
            let optionArray = [];
            // optionArray.map(())
            if(item.options) {
              let options = item.options
              if(options.chooseOne) {
                options = options.chooseOne
              }
              for(let optionName in options) {
                let option = options[optionName];
                if(!option)
                  continue

                let choiceArray = [];
                if(option.choices) {
                  let choices = option.choices
                  
                  for(let choiceName in choices) {
                    let choice = choices[choiceName];
                    if(!choice)
                      continue
                      
                    // if(!(choice.available))
                    //   console.log(choice.available);
                    let choiceObject = {
                      name: choice.name,
                      available: (choice.available == undefined) ? true : choice.available,
                      cost: choice.cost
                    }
                    choiceArray.push(choiceObject);
                  }
                }
                let optionObject = {
                  name: option.name,
                  optionType: option.optionType,
                  minimumChoice: option.minimumChoice,
                  maximumChoice: option.maximumChoice,
                  freeChoice: option.freeChoice,
                  costPerExtra: option.costPerExtra,
                  choices: (choiceArray.length) ? choiceArray : null
                }
                switch (option.optionType) {
                  case 'chooseOne':
                    optionObject.minimumChoice = 1;
                    optionObject.maximumChoice = 1;
                    break;
                  case 'chooseMany':
                    optionObject.minimumChoice = 0;
                    optionObject.maximumChoice = (option.choices) ? Object.keys(option.choices).length : 0;
                    break;
                  default: 
                    break;
                }
                optionArray.push(optionObject);
              }
            }

            let itemObject = {
              name: item.name,
              description: item.description,
              position: item.position,
              available: item.available,
              cost: item.cost,
              options: (optionArray.length) ? optionArray : null
            }
            itemArray.push(itemObject);
            // break;
          }
        }
        let categoryObject = {
          name: category.name,
          description: category.dialog,
          position: category.position ?? 1,
          items: (itemArray.length) ? itemArray : null
        }
        categoryArray.push(categoryObject);
        // break;
      }
    }
    let restaurantObject = {
      firebaseId: restaurantFirebaseId,
      name: restaurant.info.name,
      image: restaurant.info.image,
      location: restaurant.info.location, // address lat lng
      description: restaurant.details.description, //in 2 languages
      openStatus: (restaurant.state.open) ? "open" : "closed_indefinitely",
      // languageId: restaurant.details.language.primary,
      approved: restaurant.state.authorizationStatus == "authorized",
      schedule: JSON.stringify(restaurant.details.schedule),
      categories: (categoryArray.length) ? categoryArray : null,
      uniqueId: restaurant.info.name.split(" ").join("").slice(0, 8).toLowerCase()
    }
    array.push(restaurantObject);
    // break;
  }
  // console.log( JSON.stringify(array[0].categories![0].items[0].options![0]))
  insertRestaurants(array);



//   let driversArray = []
//   for (let driverId in drivers) {
//     let driver = drivers[driverId]
//     let location = null
//     let online = false
//     let taxiNumber = null

//     if (driver.location != null) {
//       let position = { ...driver.location }.position
//       location = {
//         type: "Point",
//         coordinates: [position.lat, position.lng]
//       }
//     }

//     if (driver.state != null) {
//       online = driver.state.isLooking || false;
//     }

//     let info = users[driverId]['info']
//     if (info != null && info.taxiNumber != null) {
//       taxiNumber = info.taxiNumber
//     }

//     let object = {
//       driverId: driverId,
//       taxiNumber: taxiNumber,
//       location: location,
//       online: online
//     }
//     driversArray.push(object)
//   }
//   await insertDriver({ objects: driversArray })

//   let orders = data.orders.taxi
//   let ordersArray = []
//   for (let orderId in orders) {
//     let order = orders[orderId]
//     if (!order || !order.customer || !order.orderTime)
//       continue
//     let object = {
//       customerId: order.customer.id,
//       orderId: orderId,
//       orderTime: (new Date(order.orderTime)).toISOString()
//     }
//     if (order.driver)
//       object.driverId = order.driver.id
//     if (order.acceptRideTime)
//       object.acceptRideTime = (new Date(order.acceptRideTime)).toISOString()
//     if (order.rideStartTime)
//       object.rideStartTime = (new Date(order.rideStartTime)).toISOString()
//     if (order.rideFinishTime)
//       object.rideFinishTime = (new Date(order.rideFinishTime)).toISOString()
//     if (order.status)
//       object.finalStatus = order.status
//     if (order.duration)
//       object.estimatedRideTime = order.duration.value
//     if (order.to && order.to.lat && order.to.lng)
//       object.dropOffLocation = {
//         type: "Point",
//         coordinates: [order.to.lat, order.to.lng]
//       }
//     if (order.from && order.from.lat && order.from.lng)
//       object.pickUpLocation = {
//         type: "Point",
//         coordinates: [order.from.lat, order.from.lng]
//       }
//     if (order.cancelledBy)
//       object.cancellationParty = order.cancelledBy
//     if (order.reason)
//       object.cancellationReason = order.reason
//     ordersArray.push(object)
//   }
//   await insertOrder({ objects: ordersArray })

//   let notifications = data.notificationStatus["taxi"]
//   let notificationsArray = []
//   for (let orderId in notifications) {
//     let order = notifications[orderId]
//     for (let driverId in order) {
//       let notification = order[driverId]
//       if (!notification.sentTime)
//         continue
//       let object = {
//         orderId: orderId,
//         driverId: driverId,
//         sentTime: (new Date(notification.sentTime)).toISOString()
//       }
//       if (notification.receievedTime)
//         object.receivedTime = (new Date(notification.receievedTime)).toISOString()
//       if (notification.readTime)
//         object.readTime = (new Date(notification.readTime)).toISOString()
//       notificationsArray.push(object)
//     }
//   }
//   await insertNotification({ objects: notificationsArray })
}
async function writeToDBUsers() {

  
  let users = JSON.parse(fs.readFileSync('./data/db-snapshot-restaurant-operators.json').toString());

  let array = []
  for (let userId in users) {
    let user = users[userId]['info']
    if (!user)
      continue

    // if(!(user.image) && user.bigImage)
    //   console.log(user)
    let userObject = {
      firebase_id: userId,
      name: user.name,
      image: user.image,
      big_image: user.bigImage ?? user.image,
      language_id: (user.language) ?? "en",
      // deleted: ,
      email: user.email,
      phone: user.phoneNumber
    }
    
    array.push(userObject)
  }
  await insertUsers(array)

}

async function writeToDBRestoOps() {
  let operators = JSON.parse(
    fs.readFileSync('./data/db-snapshot-restaurant-operators.json').toString()
  );
  
  let array = []
  for (let opId in operators) {
    let operator = operators[opId]
    if (!operator)
      continue

    // if(!(operator.state.restaurantId))
    //   console.log(operator.state)
    let operatorObject = {
      userFirebaseId: operator.info.id,
      restaurantFirebaseId: operator.state.restaurantId,
      status: "authorized",
      owner: true,
      appVersion: operator.versionNumber,
      notificationToken: (operator.notificationInfo) ? operator.notificationInfo.deviceNotificationToken : undefined
    }
    
    array.push(operatorObject)
    // break;
  }
  await insertRestaurantOperators(array)
}

async function writeToDBDeliDrivers() {
  let drivers = JSON.parse(
    fs.readFileSync('./data/db-snapshot-delivery-drivers.json').toString()
  );
  
  let array = []
  for (let driverId in drivers) {
    let driver = drivers[driverId]
    if (!driver || !(driver.info))
      continue

    // if(!(operator.state.restaurantId))
    //   console.log(operator.state)
    let driverObject = {
      userFirebaseId: driverId,
      status: (driver.state) ? driver.state.authorizationStatus : "awaiting_approval",
      appVersion: driver.versionNumber,
      currentLocation: JSON.stringify({
        "type": "point",
        "coordinates": [driver.location.position.lng, driver.location.position.lat]
      }),
      online: (driver.state) ? driver.state.isOnline : false,
      notificationToken: (driver.notificationInfo) ? driver.notificationInfo.deviceNotificationToken : undefined
    }
    
    array.push(driverObject)
    // break;
  }
  await insertDeliveryDrivers(array)
}

async function writeToDBRestoOrders() {
  let orders = JSON.parse(
    fs.readFileSync('./data/db-snapshot-restaurant-orders.json').toString()
  );
  let chain = getHasura();

  let response = await chain.query({
    restaurant_restaurant: [{}, {
        id: true,
        details: {
          firebase_id: true,
          location: {
            gps: true,
            address: true
          }
        },
        items: [{}, {
            id: true,
            name: {
                translations: [{
                    where: {
                        language_id: {
                            _eq: Language.EN
                        }
                    }
                }, {
                    value: true
                }]
            }
        }]
    }],
    user: [{}, {
        id: true,
        firebase_id: true,
    }],
    customer_customer: [{}, {
        user_id: true,
        user: {
            firebase_id: true
        }
    }]
});
  // for(let i=1400; i<3200; i+=200) {
  //   console.log(i)
    let array = []
    for (let orderId of Object.keys(orders)/*.slice(3200, 3338)*/) {
      let order = orders[orderId]
      if (!order)
        continue
  
      let itemArray = [];
      let orderItems = order.items
      for(let itemFirebaseId in orderItems) {
        let orderItem = orderItems[itemFirebaseId];
        if(!orderItem)
          continue
  
        let orderItemObject = {
          itemName: orderItem.name.en,
          inJSON: JSON.stringify({
            name: orderItem.name,
            selected_options: orderItem.chosenChoices
          }),
          notes: orderItem.notes,
          unavailable: orderItem.unavailable,
          quantity: orderItem.quantity,
          costPerOne: orderItem.costPerOne
        }
        itemArray.push(orderItemObject)
      }
  
      let orderObject = {
        customerFirebaseId: order.customer.id,
        restaurantFirebaseId: order.restaurant.id,
        paymentType: order.PaymentType,
        toLocationGps: (order.to) ? JSON.stringify({
          "type": "Point",
          "coordinates": [order.to.lng, order.to.lat]
        }) : undefined,
        toLocationAddress: (order.to) ? order.to.address : undefined,
        estimatedFoodReadyTime: order.estimatedFoodReadyTime,
        // stripePaymentId: (order.stripePaymentInfo) ? order.stripePaymentInfo.id : undefined,
        status: order.status,
        orderTime: order.orderTime,
        firebaseId: orderId,
        notes: order.notes,
        deliveryCost: order.shippingCost,
        refundAmount: order.refundAmount,
        stripeInfo: order.stripePaymentInfo,
        stripeFees: (order.stripePaymentInfo) ? order.stripePaymentInfo.stripeFees : order.stripeFees,
        items: itemArray,
        itemsCost: order.itemsCost,
        review: (order.review) ? {
          rating: order.review.rating,
          note: order.review.comment,
          createdAt: order.review.reviewTime
        }: undefined
      }
      
      array.push(orderObject)
      // break;
    }
    console.log(array.length)
    await insertRestaurantOrders(array, response)
  // }
 
}

async function writeToDBLaundry() {
  let laundries = JSON.parse(
    fs.readFileSync('./data/db-snapshot-laundry.json').toString()
  );
 
  insertLaundryStores(laundries)
}

async function writeToDBLaundryOrders() {
  let orders = JSON.parse(
    fs.readFileSync('./data/db-snapshot-laundry-orders.json').toString()
  );
  let chain = getHasura();

  let response = await chain.query({
    laundry_store: [{}, {
        id: true,
        details: {
          firebase_id: true,
        },
    }],
    user: [{}, {
        id: true,
        firebase_id: true,
    }],
    customer_customer: [{}, {
        user_id: true,
        user: {
            firebase_id: true
        }
    }]
  });
  // for(let i=0; i<3200; i+=200) {
  //   console.log(i)
    let array = []
    for (let orderId of Object.keys(orders)/*.slice(i, i+200)*/) {
      let order = orders[orderId]
      if (!order)
        continue
  
      // let itemArray = [];
      // let orderItems = order.items
      // for(let itemFirebaseId in orderItems) {
      //   let orderItem = orderItems[itemFirebaseId];
      //   if(!orderItem)
      //     continue
  
      //   let orderItemObject = {
      //     itemName: orderItem.name.en,
      //     inJSON: JSON.stringify({
      //       name: orderItem.name,
      //       selected_options: orderItem.chosenChoices
      //     }),
      //     notes: orderItem.notes,
      //     unavailable: orderItem.unavailable,
      //     quantity: orderItem.quantity,
      //     costPerOne: orderItem.costPerOne
      //   }
      //   itemArray.push(orderItemObject)
      // }
      if(order.customer && order.laundry) {
        let orderObject = {
          customerFirebaseId: order.customer.id,
          storeFirebaseId: order.laundry.id,
          status: order.status,
          orderTime: order.orderTime,
          deliveryCost: order.shippingCost,
          firebaseId: orderId,
          itemsCost: order.cost
        }
        array.push(orderObject)
      }
      // break;
    // }
    
  }
  console.log(array.length)
  await insertLaundryOrders(array, response)
}

async function writeToDBCustomers() {
  let customers = JSON.parse(
    fs.readFileSync('./data/db-snapshot-customers.json').toString()
  );
  // let c: Record<string, number> = {}
  // for (let customerId in customers) {
  //     c[customerId] = 1;
  // }
  // // console.log(c)
  // for(const key in c) {
  //   let customerObject = {
  //     userFirebaseId: key
  //   }
  //   array.push(customerObject)
  // }
  // for(let i=0; i<1100; i+=100) {
  //   console.log(i)
    let array = []

    for (let customerId of Object.keys(customers).slice(1100, 1163)) {
      let customer = customers[customerId]
      if (!customer)
        continue

      let cardArray = [];
      let idsWithServiceProviderObject: Record<any, any> = 
        (customer.stripe 
          && customer.stripe.idsWithServiceProvider 
          && customer.stripe.idsWithServiceProvider.restaurant
        )
        ? customer.stripe.idsWithServiceProvider.restaurant
        : undefined;

      if(customer.stripe && customer.stripe.cards) {
        let cards = customer.stripe.cards      
          for (let cardId in cards) {
            let card = cards[cardId]
            if (!card)
              continue
    
            // let cardIdsWithServiceProviderObject: Record<any, any> = {};
            // if(card.idsWithServiceProvider) {
            //   let idsWithServiceProvider = card.idsWithServiceProvider
            //   for (let id in idsWithServiceProvider) {
            //     let idWithServiceProvider = idsWithServiceProvider[id];
    
            //     cardIdsWithServiceProviderObject[id] = idWithServiceProvider.restaurant;
            //   }
            // }
            // let cardObject = {
            //   brand: "visa",
            //   expMonth: 7,
            //   expYear: 2025,
            //   id: "pm_1MbbFQDV5wKm9SNKSbkC1sBR",
            //   last4: "8620",
            //   idsWithServiceProvider: cardIdsWithServiceProviderObject
            // }
            cardArray.push(card)
          }
      }

      let customerObject = {
        userFirebaseId: customerId,
        // stripeInfo: customer.stripe,
        stripeId: (customer.stripe) ? customer.stripe.id: undefined,
        cards: cardArray,
        stripeSPIds: idsWithServiceProviderObject
      }
      // console.log(customerObject)

      array.push(customerObject)
    }
    console.log(array.length)
    await insertCustomers(array)
  // }
}

// insertDeliveryPartners()
  // saveFile()
  // writeToDB()  
  // writeToDBUsers()
  // writeToDBRestoOps()
// writeToDBDeliDrivers()
// writeToDBCustomers()
// writeToDBRestoOrders()
// writeToDBLaundry()
// writeToDBLaundryOrders()
insertServiceLinks()