const BasicApp = require("./basicApp")
class CustomerApp extends BasicApp {
  constructor(browser) {
    super(browser)
  }

  async open(){
    this.page = await this.browser.newPage();
    await this.page.goto('http://localhost:8080/');
  }

}

module.exports = CustomerApp;