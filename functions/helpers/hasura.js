const {gql, GraphQLClient} = require('graphql-request')

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

// const insertOrderMutation = gql` 
// mutation AddOrder($order: orders_insert_input!){
//   insert_orders_one(object: $order) {
//       customerId
//       orderId
//   }
// }`
// const insertUserMutation = gql`
// mutation AddUser($user: users_insert_input!){
//   insert_users_one(object: $user){
//     uid
//   }
// }`
// const updateUserMutation = gql`
// mutation updateUser($uid: String, $changes: users_set_input!){
//   update_users(
//     where: {uid: {_eq: $uid}},
//     _set: $changes
//   ){
//     returning{
//       uid
//       displayName
//     }
//   }
// }` 

// const updateOrderMutation = gql`
// mutation updateOrder($orderId:String, $changes: orders_set_input!){
//   update_orders(
//     where: {orderId: {_eq: $orderId}},
//     _set: $changes
//   ){
//     returning{
//       orderId
//       finalStatus
//     }
//   }
//   }`

  class Hasura {
    client;
    constructor(keys) {
      this.client = new GraphQLClient(
        keys.url,
        {
          headers: {
            'x-hasura-admin-secret': keys.key
          }
        });
    }
    async insertOrder(query) {
        const insertOrderMutation = gql` 
        mutation AddOrder($order: orders_insert_input!){
          insert_orders_one(object: $order) {
           customerId
           orderId
          }
       }`
      try {
        const result = await this.client.request(insertOrderMutation, query)
        console.log(result)
        return{
          status: 'Success'
        }
  
      } catch (e) {
        console.log(e)
      }
    }
  
    async updateOrder(query) {
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
      
      try {
        const result = await this.client.request(updateOrderMutation, query)
        console.log(result.update_orders.returning)
        return{
          status: 'Success'
        }
      } catch (e) {
        console.log(e)
      }
    }
  
    async insertUser(query) {
      const insertUserMutation = gql`
      mutation AddUser($user: users_insert_input!){
        insert_users_one(object: $user){
          uid
        }
      }`
      try{
        const result = await this.client.request(insertUserMutation, query)
        console.log(result);
        return{
          status: 'Success'
        }
  
      }catch(e){
        console.log(e);
      }
    }
  
    async updateUser(query) {
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
      try{
        const result = await this.client.request(updateUserMutation, query)
        console.log(result);
        // return{
        //   status: 'Success'
        // }
  
      }catch(e){
        console.log(e);
      }
    }
  }
  


module.exports = { 
  Hasura,
  setClaim
  // insertOrder,
  // updateOrder,
  // insertUser,
  // updateUser,
  
}
  
