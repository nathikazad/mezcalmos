
const { gql } = require('graphql-request')


const deleteOrderQuery = gql`
mutation DeleteOrders {
  delete_orders(where: {}) {
    affected_rows
  }
}`

const deleteUsersQuery = gql`
mutation DeleteUsers {
  delete_users (where: {}) {
  	affected_rows
  }
}`



module.exports = {
  clearDatabase: async (admin, hasura) => {
    if ((process.env["FIREBASE_AUTH_EMULATOR_HOST"] == 'localhost:9099') &&
      (process.env["FIREBASE_DATABASE_EMULATOR_HOST"] == 'localhost:9000')) {

      let userList = await admin.auth().listUsers(100)
      userList.users.forEach(async(userRecord) => {
        await admin.auth().deleteUser(userRecord.uid)
      });
      await admin.database().ref("/").remove()
      if (hasura) {
        await hasura.request(deleteUsersQuery)
        await hasura.request(deleteOrderQuery)
      }
    }
  },

  expectUnauthorized: async (func) => {
    await expect(func()).rejects.toThrow("Request failed with status code 401");
  }
}