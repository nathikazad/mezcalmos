const {gql, GraphQLClient} = require('graphql-request')


module.exports = { 
  setClaim,
  insertOrder,
  updateOrder,
  insertUser,
  updateUser
}


async function setClaim(firebase, uid) {
  try {
    const customClaims = {
      "https://hasura.io/jwt/claims": {
        "x-hasura-default-role": "user",
        "x-hasura-allowed-roles": ["user"], // add admin role for admin users
        "x-hasura-user-id": uid
      }
    };
    await firebase.auth().setCustomUserClaims(uid, customClaims)
    return { status: "success", user: context.auth.uid }
  } catch (error) {
    console
    return { status: "failure", message: error }
  }
}

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

const updateOrderMutation = gql`
mutation updateOrder($orderId:String, $changes: orders_set_input!){
  update_orders(
    where: {orderId: {_eq: $orderId}},
    _set: $changes
  ){
    returning{
      orderId
    }
  }
  }`

  async function insertOrder(query){
    // gqlReq.request("https://mezcalmos.hasura.app/v1/graphql", query).then((data) => console.log(data))
    try {
      const client = new GraphQLClient(
        'https://summary-mole-22.hasura.app/v1/graphql',
         {
        headers: { 'x-hasura-admin-secret': 'JzI9zQvNqmLKK1A1HjY1oEZ2FYkd7C7qk8brZYby4wTYIUbaWUVD0F9o07Gj2g4i'
        
        }})
      const result = await client.request(insertOrderMutation,query)
      console.log(result)
    } catch (e) {
      console.log(e.response.errors)
    }
  }

  async function updateOrder(query){
    try {
      const client = new GraphQLClient(
        'https://summary-mole-22.hasura.app/v1/graphql',
        //https://mezcalmos.hasura.app/v1/graphql",
         {
        headers: { 'x-hasura-admin-secret': 'JzI9zQvNqmLKK1A1HjY1oEZ2FYkd7C7qk8brZYby4wTYIUbaWUVD0F9o07Gj2g4i'
        //"hasurhasura" }
      }})
      const result = await client.request(updateOrderMutation, query)
      console.log(result)
      return {
        status: 'Success'
      }
    } catch (e) {
      console.log(e.response.errors)
    }
  }
  async function insertUser(query){
    try{
      const client = new GraphQLClient(
        'https://summary-mole-22.hasura.app/v1/graphql',
         {
           headers: {
            'x-hasura-admin-secret': 'JzI9zQvNqmLKK1A1HjY1oEZ2FYkd7C7qk8brZYby4wTYIUbaWUVD0F9o07Gj2g4i'
           }
         }
      )
      const result = await client.request(insertUserMutation, query)
      console.log(result);
    }catch(e){
      console.log(e.response.errors);
    }
  }
  async function updateUser(query){
    try{
      const client = new GraphQLClient(
        'https://summary-mole-22.hasura.app/v1/graphql',
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

  // import { GraphQLClient } from 'graphql-request'
// // from https://github.com/leoalves/hasura-firebase-auth
// exports.authorizedHasuraOperation = functions.https.onCall(async (data, context) => {
//   export const query = `
//     query
//     `
//   try {
//     // set from cli using 
//     // firebase functions:config:set hasura.host="HOST ADDRESS" hasura.adminSecret="ADMIN SECRET"
//     const client = new GraphQLClient(functions.config().hasura.host, {
//       headers: { 'x-hasura-admin-secret': functions.config().hasura.adminSecret }
//     })
//     const result = await client.request(query, {
//       // query variables
//       uid: context.auth.uid,
//     })
//     if (hasuraUser) {
//       return { status: "success", result: result }
//     } else {
//       throw new Error('Error running query')
//     }

//   } catch (error) {
//     console
//     return { status: "failure", message: error }
//   }
// });