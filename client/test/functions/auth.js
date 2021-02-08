
const vuex = require("./vuex")
module.exports = {
  createUser: async (browser, page, user) => {
    await vuex.dispatch(page, "login")
    const newPagePromise = new Promise(x => browser.once('targetcreated', target => x(target.page()))); 
    const popup = await newPagePromise;
    // console.log("waiting for add account button")
    await popup.waitForSelector('#add-account-button button')
    await popup.waitForTimeout(3000)
    // console.log("click button")
    await popup.click('#add-account-button button')
    await popup.waitForTimeout(2000)
    await popup.waitForSelector('#autogen-button')
    await popup.click('#autogen-button')

    // await popup.waitForTimeout(500)
    await popup.evaluate((user) => {
      console.log(user)
      if(user.displayName) {
        document.getElementById("display-name-input").value = user.displayName
        document.getElementById("screen-name-input").value = user.displayName
      }
      if(user.email) {
        document.getElementById("email-input").value = user.email
      }
      let photo = "http://www.gravatar.com/avatar/?d=robohash"
      if(user.photo){
        photo = user.photo
      }
      document.getElementById("profile-photo-input").value = photo
    }, user)
    await popup.click('#sign-in')
    await popup.waitForTimeout(2000)
  },
  getUserId: async (page, param) => {
    let userId =  await vuex.get(page, "userId")
    return userId
  },
  getUserInfo: async (page, param) => {
    return await vuex.get(page, "userInfo")
  }
}