const axios = require('axios');
const DB = require('./database')
const url = "http://localhost:5001/mezcalmos-31f1c/us-central1/"
class User {
  constructor(data) {
    this.email = data.email
    this.id = data.localId
    this.config = {
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer "+data.idToken
      }
    }
    this.db = new DB(data.idToken)
  }

  async callFunction(functionName, data) {
    let response = await axios.post(`${url}${functionName}`, {data:data}, this.config)
    return response.data
  }  

  async setImage(admin, img){
    let response = await admin.database().ref(`/users/${this.id}/info`).set({photo:img})
    console.log(response)
  }

}

module.exports = User;