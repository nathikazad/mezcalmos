const axios = require('axios');

class Database {
  constructor(idToken) {
    this.idToken = idToken
  }

  async reset(){
    await axios.put(`http://localhost:9000/.json?ns=mezcalmos-31f1c-default-rtdb&auth=${this.idToken}`, {})
  }

  async set(path, data) {
    await axios.put(`http://localhost:9000/${path}.json?ns=mezcalmos-31f1c-default-rtdb&auth=${this.idToken}`, data)
  }

  async push(path, data) {
    let response = await axios.post(`http://localhost:9000/${path}.json?ns=mezcalmos-31f1c-default-rtdb&auth=${this.idToken}`, data)
    return response.data.id;
  }

  async update(path, data) {
    await axios.patch(`http://localhost:9000/${path}.json?ns=mezcalmos-31f1c-default-rtdb&auth=${this.idToken}`, data)
  }

  async get(path) {
    // console.log(path, this.idToken)
    let response = await axios.get(`http://localhost:9000/${path}.json?ns=mezcalmos-31f1c-default-rtdb&auth=${this.idToken}`)
    return response.data
  }

  async remove(path) {
    await axios.delete(`http://localhost:9000/${path}.json?ns=mezcalmos-31f1c-default-rtdb&auth=${this.idToken}`)
  }

}

module.exports = Database;
