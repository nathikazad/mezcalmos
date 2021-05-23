module.exports = {
  signUp, whatsAppLogin
}


const axios = require('axios');
const User = require("./user")
const url = "http://localhost:9099/identitytoolkit.googleapis.com/v1/"
const key = "?key=AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0"


async function callFunction(functionName, data) {
  let url = "http://localhost:5001/mezcalmos-31f1c/us-central1/"
  let config = {
    headers: {
      "Content-Type": "application/json",
    }
  }
  let response = await axios.post(`${url}${functionName}`, {data:data}, config)
  return response.data
}

async function signUp(admin, data) {
  // console.log(data)
  let response = await axios.post(`${url}accounts:signUp${key}`, data)    
  let user = new User(response.data)
  await user.setImage(data.photoURL)
  return user
}
// signIn: async (page, param) => {
//   return await page.evaluate(({param}) => {
//     return window.app.$store.getters[param]
//   }, {param});
// },

async function whatsAppLogin(data) {
  let response = await callFunction('sendOTP', data)
  return response
}

  
