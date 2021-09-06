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
  insert_users(objects: $objects, on_conflict: {constraint: users_pkey, update_columns: [uid, displayName, photo]}) {
    returning {
      uid
    }
  }
}`

const driverMutationQuery = gql`
mutation AddDriver($objects: [drivers_insert_input!]!){
  insert_drivers(objects: $objects, on_conflict: {constraint: drivers_pkey, update_columns: [driverId, taxiNumber, location, online]}){
    returning{
      driverId
    }
  }
}`

const deleteUsersQuery = gql`
mutation DeleteUsers {
  delete_users (where: {}) {
  	affected_rows
  }
}`

const getUsersQuery = gql`
query MyQuery {
  users {
    uid
  }
}`

let secret = ""
let testSecret = "rOTavdgkE13VvHckk2AsK5FEMvkCLx5EriEBQF2GJaRLrCw55gv44uATzneQiEMN"

async function insertOrder(query) {
  return await runQuery(orderMutationQuery, query)
}

async function insertUser(query) {
  return await runQuery(userMutationQuery, query)
}

async function deleteUsers() {
  return await runQuery(deleteUsersQuery)
}

async function getUsers() {
  return await runQuery(getUsersQuery)
}


async function insertDriver(query) {
  return await runQuery(driverMutationQuery, query)
}

async function runQuery(mutation, query) {
  try {
    const client = new GraphQLClient("https://testing-mezc.hasura.app/v1/graphql", {
      headers: { 'x-hasura-admin-secret': testSecret }
    })
    const result = await client.request(mutation, query)
  } catch (e) {
    console.log(query)
  }
}

async function saveFile() {
  let db = (await firebase.database().ref(`/`).once('value')).val();
  console.log("finished downloading, starting write");

  let data = JSON.stringify(db, null, "\t");
  fs.writeFileSync('data/db-snapshot.json', data);
  console.log("Finished");
}

async function writeToDB() {

  // await deleteUsers()
  let data = JSON.parse(fs.readFileSync('data/db-snapshot.json'));
  let drivers = data.taxiDrivers
  let users = data.users

  let array = []
  for (let userId in users) {
    let user = users[userId]['info']
    if (!user)
      continue
    let object = {
      uid: userId,
    }
    if (user.displayName) {
      object.displayName = user.displayName
    }

    if (user.photo) {
      object.photo = user.photo
    }
    array.push(object)
  }
  await insertUser({ objects: array })


  let driversArray = []
  for (let driverId in drivers) {
    let driver = drivers[driverId]
    let location = null
    let online = false
    let taxiNumber = null

    if (driver.location != null) {
      let position = { ...driver.location }.position
      location = {
        type: "Point",
        coordinates: [position.lat, position.lng]
      }
    }

    if (driver.state != null) {
      online = driver.state.isLooking || false;
    }

    let info = users[driverId]['info']
    if (info != null && info.taxiNumber != null) {
      taxiNumber = info.taxiNumber
    }

    let object = {
      driverId: driverId,
      taxiNumber: taxiNumber,
      location: location,
      online: online
    }
    driversArray.push(object)
  }
  await insertDriver({ objects: driversArray })

  let orders = data.orders.taxi
  let ordersArray = []
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


    ordersArray.push(object)
  }
  await insertOrder({ objects: ordersArray })
}


// saveFile()
writeToDB()