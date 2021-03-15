const auth = require("./vuex/modules/auth")
class BasicApp {
  constructor(browser) {
    this.browser = browser;
    this.page = null;
    this.userId = null;
  }

  async createUser(user) {
    await auth.createUser(this.browser, this.page, user)
    this.userId = await auth.getUserId(this.page);
  }

  async getUserInfo() {
    return await auth.getUserInfo(this.page);
  }

  async logout(user) {
    await auth.logout(this.page)
    this.userId = null;
  }

}

module.exports = BasicApp;