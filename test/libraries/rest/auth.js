const axios = require('axios');
const User = require("./user")
const url = "http://localhost:9099/identitytoolkit.googleapis.com/v1/"
const key = "?key=AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0"

module.exports = {
  signUp: async (data) => {
    // console.log(data)
    let response = await axios.post(`${url}accounts:signUp${key}`, data)    
    let user = new User(response.data)
    
    for (i = 0; i < 10; i++) {
      
      await user.setImage(data.photoURL)
      let photo = await user.db.get(`/users/${user.id}/info/photo`)
      // console.log("photo ", photo)
      if(photo){
        // console.log("break")
        break
      }
      // console.log("trying again")
    }
    return user
  },
  // signIn: async (page, param) => {
  //   return await page.evaluate(({param}) => {
  //     return window.app.$store.getters[param]
  //   }, {param});
  // },
}
