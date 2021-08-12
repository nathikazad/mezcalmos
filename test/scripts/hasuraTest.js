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

// const insertOneOrder = gql`
//   mutation insertOrder($orderId: String!, $customerId: String!) {
//     insert_orders_one(object: {orderId: $orderId, customerId: $customerId}) {
//       orderId
//     }
//   }`

const insertOrderMutation = gql` 
mutation AddOrder($order: orders_insert_input!){
  insert_orders_one(object: $order) {
      customerId
      orderId
  }
}`
const insertUserMutation = gql`
mutation AddUser($user: users_insert_input!){
  insert_users_one(object: $user){
    uid
  }
}`


// const updateOneOrder = gql`
// mutation updateOrder($orderId:Text, $changes:orders_set_input!){
//   update_orders(
//     where: {orderId: {_lte: $orderId}},
//     _set: $changes
//   ){
//     returning {
//       orderId
//     }
//   }
// }`
const updateOrderMutation = gql`
mutation updateOrder($orderId:String, $changes: orders_set_input!){
  update_orders(
    where: {orderId: {_eq: $orderId}},
    _set: $changes
  ){
    returning{
      orderId
      finalStatus
    }
  }
  }`
const updateUserMutation = gql`
mutation updateUser($uid: String, $changes: users_set_input!){
  update_users(
    where: {uid: {_eq: $uid}},
    _set: $changes
  ){
    returning{
      uid
      displayName
    }
  }
}`  
// mutation updateOrder($orderId: String, $changes: orders_set_input!){
//   update_orders(
//     where: {orderId: {_lte: $orderId}},
//     _set: $changes
//   )returning{
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


  const variables = {objects:[{
    "customerId": "customer1",
    "driverId": "driver1",
    "orderId": "order1",
    "orderTime": "2016-07-20T17:30:15+05:30"
  },
  {
    "customerId": "customer2",
    "driverId": "driver2",
    "orderId": "order2",
    "orderTime": "2016-07-20T17:30:15+05:30"
  }]}

//let secret = "hasurhasura"

async function insertOrder(query){
  // gqlReq.request("https://mezcalmos.hasura.app/v1/graphql", query).then((data) => console.log(data))
  try {
    const client = new GraphQLClient(
      'https://staging-mezc.hasura.app/v1/graphql',
      //https://mezcalmos.hasura.app/v1/graphql",
       {
      headers: { 'x-hasura-admin-secret': 'JzI9zQvNqmLKK1A1HjY1oEZ2FYkd7C7qk8brZYby4wTYIUbaWUVD0F9o07Gj2g4i'
      //"hasurhasura" }
    }})
    const result = await client.request(orderMutationQuery, query)
    console.log(result)
  } catch (e) {
    console.log(e.response.errors)
  }
}
async function updateOrder(query){
  try {
    const client = new GraphQLClient(
      'https://staging-mezc.hasura.app/v1/graphql',
      //https://mezcalmos.hasura.app/v1/graphql",
       {
      headers: { 'x-hasura-admin-secret': 'JzI9zQvNqmLKK1A1HjY1oEZ2FYkd7C7qk8brZYby4wTYIUbaWUVD0F9o07Gj2g4i'
      //"hasurhasura" }
    }})
    const result = await client.request(updateOrderMutation, query)
    console.log(result)
  } catch (e) {
    console.log(e.response.errors)
  }
}
async function insertUser(query){
  try{
    const client = new GraphQLClient(
      'https://staging-mezc.hasura.app/v1/graphql',
       {
         headers: {
          'x-hasura-admin-secret': 'JzI9zQvNqmLKK1A1HjY1oEZ2FYkd7C7qk8brZYby4wTYIUbaWUVD0F9o07Gj2g4i'
         }
       }
    )
    const result = await client.request(insertUserMutation, query)
    console.log(result);
  }catch(e){
    console.log(e);
  }
}
async function updateUser(query){
  try{
    const client = new GraphQLClient(
      'https://staging-mezc.hasura.app/v1/graphql',
       {
         headers: {
          'x-hasura-admin-secret': 'JzI9zQvNqmLKK1A1HjY1oEZ2FYkd7C7qk8brZYby4wTYIUbaWUVD0F9o07Gj2g4i'
         }
       }
    )
    const result = await client.request(updateUserMutation, query)
    console.log(result);
  }catch(e){
    console.log(e.response.errors);
  }
}

async function addOrder(){
  await insertOrder({
    order: {
    orderId: 'ORDER4',
    customerId: "Customer4"
    }    
  })
}
async function updateOneOrder(){
  await updateOrder({
   orderId: '-Mej1zUmFYirNzKBmLJw',
   changes:{
     finalStatus: 'cancelledByTest'
   }
  })
}
async function addUser(){
  await insertUser({
    user: {
      uid: "user01ID",
      displayName: "user01"
    }
  })
}
async function updateTheUser(){
  await updateUser({
    uid: 'USER00',
    changes:{
      displayName: 'user00UpdatedSuccessfully'
    }
  })
}
addUser()
//updateOneOrder()
//addUser()
//updateTheUser()


// async function saveFile(){
//   let db = (await firebase.database().ref(`/`).once('value')).val();
// 	console.log("finished downloading, starting write");
	
// 	let data = JSON.stringify(db, null, "\t");  
// 	fs.writeFileSync('data/db-snapshot.json', data);  
// 	console.log("Finished");
// }

// async function writeToDB(){
//   let data = JSON.parse(fs.readFileSync('data/db-snapshot.json'));
//   let orders = data.orders.taxi
//   let i = 0
//   let array = []
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
//     if(order.estimatedPrice){
//       object.offeredPrice = order.estimatedPrice
//       object.finalPrice = order.estimatedPrice
//     }
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
// }








// let data = JSON.parse(fs.readFileSync(filePrefix+'data.json'));
// //saveFile()
// //writeToDB()

