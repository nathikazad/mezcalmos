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
    let response = await axios.post(`${url}${functionName}`, data, this.config)
    console.log(response)
    return response.data
  }  

}

module.exports = User;