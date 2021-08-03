module.exports = {
  signUp, sendCodeLogin, getAuth, sendOtp
}


const axios = require('axios');
const User = require("./user");
const hasura = require("../../../functions/helpers/hasura")
const url = "http://localhost:9099/identitytoolkit.googleapis.com/v1/"
const key = "?key=AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0"


// async function callFunction(functionName, data) {
//   let url = "http://localhost:5001/mezcalmos-31f1c/us-central1/"
//   let config = {
//     headers: {
//       "Content-Type": "application/json",
//     }
//   }
//   let response = await axios.post(`${url}${functionName}`, {data:data}, config)
//   return response.data
// }
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

async function sendCodeLogin(data) {
  let response = await callFunction('sendOTPForLogin', data)
  return response
}

async function getAuth(data) {
  let response = await callFunction('getAuthUsingOTP', data)
  return response
}
async function sendOtp(data){
  let response = await callFunction('sendOTP', data)
  return response
}

  
