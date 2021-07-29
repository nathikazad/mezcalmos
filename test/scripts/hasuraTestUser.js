const {gql, GraphQLClient} = require('graphql-request')
const {deepfind} = require('deepfind')
const fs = require('fs');
const firebaseAdmin = require("firebase-admin");
const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");

// const query = gql`
// query MyQuery {
//   orders {
//     driverId
//     customerId
//     orderId
//   }
// }`

// const orderMutationQuery = gql`
// mutation AddOrder($objects: [orders_insert_input!]!){
//   insert_orders(objects: $objects) {
//     returning {
//       customerId
//       driverId
//       orderId
//     }
//   }
// }`

const userMutationQuery = gql`
mutation AddUser($objects: [users_insert_input!]!){
  insert_users(objects: $objects) {
    returning {
      uid
    }
  }
}`

  // const variables = {objects:[{
  //   "customerId": "customer1",
  //   "driverId": "driver1",
  //   "orderId": "order1",
  //   "orderTime": "2016-07-20T17:30:15+05:30"
  // },
  // {
  //   "customerId": "customer2",
  //   "driverId": "driver2",
  //   "orderId": "order2",
  //   "orderTime": "2016-07-20T17:30:15+05:30"
  // }]}

let secret = "hasurhasura"

// async function insertOrder(query){
//   // gqlReq.request("https://mezcalmos.hasura.app/v1/graphql", query).then((data) => console.log(data))
//   try {
//     const client = new GraphQLClient("https://mezcalmos.hasura.app/v1/graphql", {
//       headers: { 'x-hasura-admin-secret': "hasurhasura" }
//     })
//     const result = await client.request(orderMutationQuery, query)
//     // console.log(result)
//   } catch (e) {
//     console.log(e.response.errors)
//   }
// }

async function insertUser(query){
  // gqlReq.request("https://mezcalmos.hasura.app/v1/graphql", query).then((data) => console.log(data))
  try {
    const client = new GraphQLClient("https://mezcalmos.hasura.app/v1/graphql", {
      headers: { 'x-hasura-admin-secret': "hasurhasura" }
    })
    const result = await client.request(userMutationQuery, query)
    // console.log(result)
  } catch (e) {
    console.log(e.response.errors)
  }
}

async function saveFile(){
  let db = (await firebase.database().ref(`/`).once('value')).val();
	console.log("finished downloading, starting write");
	
	let data = JSON.stringify(db, null, "\t");  
	fs.writeFileSync('data/db-snapshot.json', data);  
	console.log("Finished");
}

async function writeToDB(){
  
  let data = JSON.parse(fs.readFileSync('data/db-snapshot.json'));
  let drivers = data.taxiDrivers
  let users = data.users
  let i = 0
  let array = []
  for (let userId in users) {
    let user = users[userId]['info']
    if(!user)
      continue
    let object = {
      uid:userId,
    }
    if(user.displayName){
      object.displayName = user.displayName
    }

    if(user.photo){
      object.photo = user.photo
    }

    if(drivers[userId] != null){
      object.driver = true
      if(user.taxiNumber) {
        object.taxiNumber = user.taxiNumber
      }
    }
    // console.log(object);
    i++
    if(i%50 == 0){
      await insertUser({objects:array})
      array = []
    } else {
      array.push(object)
    }
  }
  
}
//   for(let orderId in orders){
//     let order = orders[orderId]
//     let object = {
//       customerId:order.customer.id,
//       orderId:orderId,
//       orderTime:(new Date(order.orderTime)).toISOString()
//     }
//     if(order.driver)
//       object.driverId = order.driver.id
//     if(order.acceptRideTime)
//       object.acceptRideTime = (new Date(order.acceptRideTime)).toISOString()
//     if(order.rideStartTime)
//       object.rideStartTime = (new Date(order.rideStartTime)).toISOString()
//     if(order.rideFinishTime)
//       object.rideFinishTime = (new Date(order.rideFinishTime)).toISOString()
//     if(order.status)
//       object.finalStatus = order.status
//     if(order.duration)
//       object.estimatedRideTime = order.duration.value
//     if(order.to && order.to.lat && order.to.lng)
//       object.dropOffLocation ={
//         type:"Point",
//         coordinates: [order.to.lat,order.to.lng]
//       }
//     if(order.from && order.from.lat && order.from.lng)
//       order.pickUpLocation = {
//         type:"Point",
//         coordinates: [order.from.lat,order.from.lng]
//       }
//     if(order.cancelledBy)
//       object.cancellationParty = order.cancelledBy
//     if(order.reason)
//       object.cancellationReason = order.reason
//     i++
//     if(i%50 == 0){
//       await insertOrder({objects:array})
//       array = []
//     } else {
//       array.push(object)
//     }
//   }
//   await insertOrder({objects:array})

//let data = JSON.parse(fs.readFileSync(filePrefix+'data.json'));
saveFile()
writeToDB()

