const axios = require('axios');
const admin = require("firebase-admin");

let app = admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});


class Database {
  constructor(browser) {
    // super(browser)
  }

  async reset(){
    await axios.put("http://localhost:9000/.json?ns=mezcalmos-31f1c-default-rtdb", {})
    let userList = await admin.auth().listUsers(100)
    userList.users.forEach((userRecord) => {
      admin.auth().deleteUser(userRecord.uid)
    });
  }

  async set(path, data) {
    await axios.put(`http://localhost:9000/${path}.json?ns=mezcalmos-31f1c-default-rtdb`, data)
  }

  async push(path, data) {
    await axios.post(`http://localhost:9000/${path}.json?ns=mezcalmos-31f1c-default-rtdb`, data)
  }

  async get(path) {
    return (await axios.get(`http://localhost:9000/${path}.json?ns=mezcalmos-31f1c-default-rtdb`)).data
  }

  async remove(path) {
    await axios.delete(`http://localhost:9000/${path}.json?ns=mezcalmos-31f1c-default-rtdb`)
  }

}

module.exports = Database;
