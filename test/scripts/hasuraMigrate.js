const { gql, GraphQLClient } = require('graphql-request')
const fs = require('fs');
const firebaseAdmin = require("firebase-admin");
const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
}, "production");



const orderMutationQuery = gql`
mutation AddOrder($objects: [orders_insert_input!]!){
  insert_orders(objects: $objects) {
    returning {
      customerId
      driverId
      orderId
    }
  }
}`

const userMutationQuery = gql`
mutation AddUser($objects: [users_insert_input!]!){
  insert_users(objects: $objects, on_conflict: {constraint: users_pkey, update_columns: [displayName, photo, driver, taxiNumber]}) {
    returning {
      uid
    }
  }
}`

let secret = ""

async function insertOrder(query) {
  try {
    const client = new GraphQLClient("https://mezcalmos.hasura.app/v1/graphql", {
      headers: { 'x-hasura-admin-secret': secret }
    })
    const result = await client.request(orderMutationQuery, query)
    // console.log(result)
  } catch (e) {
    console.log(e.response.errors)
  }
}

async function insertUser(query) {
  try {
    const client = new GraphQLClient("https://mezcalmos.hasura.app/v1/graphql", {
      headers: { 'x-hasura-admin-secret': secret }
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
  i = 0
  array = []
  let orders = data.orders.taxi
  for (let orderId in orders) {
    let order = orders[orderId]
    if (!order || !order.customer || !order.orderTime)
      continue
    let object = {
      customerId: order.customer.id,
      orderId: orderId,
      orderTime: (new Date(order.orderTime)).toISOString()
    }
    if (order.driver)
      object.driverId = order.driver.id
    if (order.acceptRideTime)
      object.acceptRideTime = (new Date(order.acceptRideTime)).toISOString()
    if (order.rideStartTime)
      object.rideStartTime = (new Date(order.rideStartTime)).toISOString()
    if (order.rideFinishTime)
      object.rideFinishTime = (new Date(order.rideFinishTime)).toISOString()
    if (order.status)
      object.finalStatus = order.status
    if (order.duration)
      object.estimatedRideTime = order.duration.value
    if (order.to && order.to.lat && order.to.lng)
      object.dropOffLocation = {
        type: "Point",
        coordinates: [order.to.lat, order.to.lng]
      }
    if (order.from && order.from.lat && order.from.lng)
      order.pickUpLocation = {
        type: "Point",
        coordinates: [order.from.lat, order.from.lng]
      }
    if (order.cancelledBy)
      object.cancellationParty = order.cancelledBy
    if (order.reason)
      object.cancellationReason = order.reason
    i++
    if (i % 50 == 0) {
      await insertOrder({ objects: array })
      array = []
    } else {
      array.push(object)
    }
  }
  await insertOrder({ objects: array })
  console.log(i)
}


// saveFile()
writeToDB()

