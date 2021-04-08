const axios = require('axios');
const User = require("./user")
const url = "http://localhost:9099/identitytoolkit.googleapis.com/v1/"
const key = "?key=AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0"

module.exports = {
  signUp: async (admin, data) => {
    // console.log(data)
    let response = await axios.post(`${url}accounts:signUp${key}`, data)    
    let user = new User(response.data)
    await user.setImage(data.photoURL)
    // await new Promise(res => setTimeout(() => {
    //   res()
    // }, 200))
    
    // await admin.database().ref(`/users/${user.id}/info/photo`).set(data.photoURL)
    // for (i = 0; i < 10; i++) {
      
    //   await user.setImage(data.photoURL)
    //   await admin.database().ref(`/users/${user.id}/info/photo`).set(data.photoURL)
    //   let photo = await user.db.get(`/users/${user.id}/info/photo`)
    //   let photo2 = (await admin.database().ref(`/users/${user.id}/info/photo`).once('value')).val()

    //   if(photo && photo2){
    //     console.log("break")
    //     break
    //   }
    //   console.log("trying again")
    // }
    // setTimeout(function() {
    //   user.setImage(data.photoURL)
    //   admin.database().ref(`/users/${user.id}/info/photo`).set(data.photoURL)
    // }, 500)
    return user
  },
  // signIn: async (page, param) => {
  //   return await page.evaluate(({param}) => {
  //     return window.app.$store.getters[param]
  //   }, {param});
  // },
}
