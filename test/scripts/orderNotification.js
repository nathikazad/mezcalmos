const {gql, GraphQLClient} = require('graphql-request')
const firebaseAdmin = require("firebase-admin");
const { SecondaryAuthTokenContext } = require('twilio/lib/rest/accounts/v1/secondaryAuthToken');
const firebase = firebaseAdmin.initializeApp({
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
  }, "production");
 
    let customer = {
        id: 'customerId100',
        name: 'klaus'
    }
   
    let driver = {
      id: 'driverId100',
      name: 'Elijah' 
    }
  
    let secondDriver = {
        id: 'driverId101',
        name: 'Heyly'
    }


// const insertUserMutation = gql`
// mutation AddUser($user: users_insert_input!){
//   insert_users_one(object: $user){
//     uid,
//   }
// }`
const insertPersons = gql`
mutation insertPersons($objects:[users_insert_input!]!){
    insert_users(objects: $objects){
      returning{
        uid,
        displayName
      }
    }
  }`

const insertOrderMutation = gql` 
mutation AddOrder($order: orders_insert_input!){
  insert_orders_one(object: $order) {
      customerId
      orderId
  }
}`

const insertNotificationsMutation = gql`
mutation insertNotifications($objects: [notifications_insert_input!]!) {
  insert_notifications(objects: $objects, on_conflict:
    {constraint: notifications_orderId_driverId_key,
      update_columns: [sentTime, receivedTime, openedTime]}) {
    affected_rows
  }
}
`
async function insertNotifications(query){
    try {
        const client = new GraphQLClient(
          'https://testing-mezc.hasura.app/v1/graphql',
          
           {
          headers: { 'x-hasura-admin-secret': 'rOTavdgkE13VvHckk2AsK5FEMvkCLx5EriEBQF2GJaRLrCw55gv44uATzneQiEMN'
          
        }})
        const result = await client.request(insertNotificationsMutation, query)
        console.log(result)
      } catch (e) {
        console.log(e.response.errors)
      }
}

async function insertOrder(query){
    try {
      const client = new GraphQLClient(
        'https://testing-mezc.hasura.app/v1/graphql',
        
         {
        headers: { 'x-hasura-admin-secret': 'rOTavdgkE13VvHckk2AsK5FEMvkCLx5EriEBQF2GJaRLrCw55gv44uATzneQiEMN'
        
      }})
      const result = await client.request(insertOrderMutation, query)
      console.log(result)
    } catch (e) {
      console.log(e.response.errors)
    }
  }



async function insertUser(query){
    try{
      const client = new GraphQLClient(
        'https://testing-mezc.hasura.app/v1/graphql',
         {
           headers: {
            'x-hasura-admin-secret': 'rOTavdgkE13VvHckk2AsK5FEMvkCLx5EriEBQF2GJaRLrCw55gv44uATzneQiEMN'
           }
         }
      )
      const result = await client.request(insertPersons, query)
      console.log(result);
    }catch(e){
      console.log(e.response.errors);
    }
}

async function addUsers(){
    await insertUser({
        objects:[
            {
                uid: customer.id,
                displayName: customer.name
            },
            {
                uid: driver.id,
                displayName: driver.name
            },
            {
                uid: secondDriver.id,
                displayName: secondDriver.name
            }
        ]
    })
}

async function addOrder(){
    await insertOrder({
      order: {
      orderId: 'orderId100',
      customerId: customer.id,
      orderTime: (new Date()).toUTCString(), 
    
      }    
    })
  }
async function insertListOfNotifications(){
    await insertNotifications({
        objects: [
            {
                orderId: "orderId100",
                driverId: driver.id,
                sentTime: (new Date()).toUTCString(), 
            },
            {
                orderId: "orderId100",
                driverId: secondDriver.id,
                sentTime: (new Date()).toUTCString(), 
            }
        ]
    })
}

// addCustomer()  
// addDriver()
//addOrder()
//addUsers()
insertListOfNotifications()



/*mutation insertNotificationList{
  insert_notifications(objects: [
    {
      driverId: "driverIdD01"
      sentTime: "2021-08-27T02:48:39+00:00",
      orderId: "orderId01" 
    }
  ]){
    returning{
      orderId
    }
  }
}
mutation insertOrderWithNotification {
  insert_orders_one(object: 
    {
      orderId: "ORDERID03",
      customerId: "CustomerId03",
      orderNotifications: {
        data:{
            driverId: "driverId03",
            sentTime: "2021-07-27T02:48:39+00:00"
            openedTime: "2021-09-27T02:48:39+00:00",
            receivedTime: "2021-10-27T02:48:39+00:00"
        }
    
    }
    }) {
    orderId
    
  }
}
mutation insertOrderWithNotification {
  update_orders(
    where: {orderId: {_eq: "orderId01"}}, 
    _set: {driverId: "newDriver01"}
  ){
    affected_rows
  }
  update_notifications(
    where: {orderId:{_eq:"orderId01"}}, 
    _set: {
    driverId: "newDriver01",
    receivedTime: "2021-06-7T02:48:39+00:00",
    openedTime: "2021-127T02:48:39+00:00"
    }) {
    returning{
      orderId
      
    }
  }
}
*/
