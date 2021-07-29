const auth = require("../../libraries/rest/auth")
const helper = require("../../libraries/helpers")
const admin = require("firebase-admin");

jest.setTimeout(60000)

admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
  });

  it('Create user test', async () => {
    let data = {
      "email":"customer@mezcalmos.com",
      "displayName":"Customer One",
      "password":"password",
      "photo": "https://randomuser.me/api/portraits/men/70.jpg",
      "returnSecureToken":true
    }

    let user = await auth.signUp(admin, data)
    console.log(user);
    
  //   let userData = await user.db.get(`users/${user.id}`)
  //   expect(userData.info.email).toBe(data.email);
  //   expect(userData.info.displayName).toBe(data.displayName);

  //   // Modify name or email should not be possible
  //   await helper.expectUnauthorized(async () => {
  //     await user.db.set(`users/${user.id}/info`, {"displayName":"pussyCat"})
  //   })

  //   // Modify notification should be possible
  //   await user.db.set(`users/${user.id}/notificationInfo`, {"displayName":"pussyCat"})

  //   let badUserData = {
  //     "email":"baduser@mezcalmos.com",
  //     "displayName":"Bad User",
  //     "password":"password",
  //     "photo": "https://randomuser.me/api/portraits/men/71.jpg",
  //     "returnSecureToken":true
  //   }

  //   let badUser = await auth.signUp(admin, badUserData)

  //   // Bad user should not be able to access any other user's info 
  //   await helper.expectUnauthorized(async () => {
  //     await badUser.db.get(`users/${user.id}`)
  //   })
    
  });
});

afterAll(() => {
  admin.app().delete()
});

// Create a ride for Customer
// Customer should be able to read his ride in order's node
// Customer should not be able to modify his ride in order's node
// Customer should not be able to read or write to openOrders
// BadUser should not be able to read or write Customer's order

// Create driver
// Authorize driver
// Driver should be able to read and write location
// Driver should only be able to read orders and state, not modify them
// Driver should be able to read all open orders
// Driver should not be able to write to any open orders

// Let driver accept order
// Driver should be able to read his ride in order's node
// Driver should not be able to modify his ride in order's node except for driver position
// BadUser should not be able to read or write driver's order

// Customer should be able to read his notifications
// Customer should be able to delete his notifications
// BadUser should not be able to read or write customer's notifications

// Let driver send message
// Customer & Driver should be able to read his chat in chat node of that order id
// Customer & Driver should not be able to modify his chat except for messages
// Customer & Driver should only be able to write to messages but not be able to modify or delete
// BadUser should not be able to read or write Customer's chat