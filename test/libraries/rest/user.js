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

  async callFunction(functionName, data = {}) {
    let response = await axios.post(`${url}${functionName}`, {data:data}, this.config)
    return response.data
  }  

  async setImage(img){
    await this.db.update(`/users/${this.id}/info`, {photo:img})
  }
  async getInfo(){
    let req = await this.db.get(`users/${this.id}/info`)
    console.log('info', req);
  }

  // async setNumber(num){
  //   await this.db.set(`users/${this.id}/info/taxiNumber`, num)
  // }

  async sendMessage(orderId, newMessage){
    await this.db.push(`/chat/${orderId}/messages`, newMessage)
  }

}

module.exports = User;