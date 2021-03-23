const axios = require('axios');
const User = require("./user")
const url = "http://localhost:9099/identitytoolkit.googleapis.com/v1/"
const key = "?key=AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0"

module.exports = {
  signUp: async (admin, data) => {
    let response = await axios.post(`${url}accounts:signUp${key}`, data)
    // console.log(`/users/${response.data.localId}/info/photo`)
    await admin.database().ref(`/users/${response.data.localId}/info/photo`).set(data.photo)
    await admin.database().ref(`/users/${response.data.localId}/info/photo`).set(data.photo)
    await admin.database().ref(`/users/${response.data.localId}/info/photo`).set(data.photo)
    return new User(response.data)
  },
  // signIn: async (page, param) => {
  //   return await page.evaluate(({param}) => {
  //     return window.app.$store.getters[param]
  //   }, {param});
  // },
}
