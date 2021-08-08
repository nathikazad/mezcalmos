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

class Hasura {
  constructor(keys) {
    this.client = new GraphQLClient(
      keys.url,
      {
        headers: {
          'x-hasura-admin-secret': keys.key
        }
      });
  }
  async insertOrder(parameters) {
    const insertOrderMutation = gql` 
      mutation AddOrder($order: orders_insert_input!){
        insert_orders_one(object: $order) {
          customerId
          orderId
        }
      }`
    try {
      const result = await this.client.request(insertOrderMutation, parameters)
      console.log(result)
      return {
        status: 'Success'
      }

    } catch (e) {
      console.log(e)
    }
  }

  async updateOrder(parameters) {
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
      const result = await this.client.request(updateOrderMutation, parameters)
      console.log(result.update_orders.returning)
      return {
        status: 'Success'
      }
    } catch (e) {
      console.log(e)
    }
  }

  async insertUser(parameters) {
    const insertUserMutation = gql`
    mutation AddUser($user: users_insert_input!){
      insert_users_one(object: $user){
        uid
      }
    }`
    try {
      const result = await this.client.request(insertUserMutation, parameters)
      console.log(result);
      return {
        status: 'Success'
      }

    } catch (e) {
      console.log(e);
    }
  }

  async updateUser(parameters) {
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
    try {
      const result = await this.client.request(updateUserMutation, parameters)
      console.log(result);
      // return{
      //   status: 'Success'
      // }

    } catch (e) {
      console.log(e);
    }
  }

  async getDrivers(parameters) {
    const getDriversQuery = gql`
      query GetDriversQuery($lat: float8, $long: float8, $bound: Int){
        nearby_drivers(args: {lat: $lat, long: $long, bound: $bound}){
          location
        }
      }`
    try {
      const result = await this.client.request(getDriversQuery, parameters)
      console.log(result);
    } catch (e) {
      console.log(e);
    }
  }
}
  


module.exports = { 
  Hasura,
  setClaim
}
  
