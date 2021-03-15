
module.exports = {
  clearDatabase: async (admin) => {
    if ((process.env["FIREBASE_AUTH_EMULATOR_HOST"] == 'localhost:9099') &&
      (process.env["FIREBASE_DATABASE_EMULATOR_HOST"] == 'localhost:9000')) {
      let userList = await admin.auth().listUsers(100)
      userList.users.forEach(async(userRecord) => {
        await admin.auth().deleteUser(userRecord.uid)
      });
      await admin.database().ref("/").remove()
    }
  }
}