const CustomerApp = require("../classes/customerApp")
const puppeteer = require('puppeteer');
describe('Mezcalmos', () => {
  beforeAll(async () => {
    // await page.goto('localhost:8080');
  });

  it('Create user test', async () => {
    jest.setTimeout(30000);
    const browser = await puppeteer.launch({headless:false});
    let customerApp = new CustomerApp(browser)
    await customerApp.open()
    let customer = {
      displayName: 'Delivery One',
      email: 'delivery.one@mezcalmos.com',
      photo: 'http://www.gravatar.com/avatar/?d=wavatar'
    }
    await customerApp.createUser(customer)

    let userInfo = await customerApp.getUserInfo()
    browser.close()
    expect(userInfo.displayName).toBe(customer.displayName);
    expect(userInfo.email).toBe(customer.email);
    expect(userInfo.photo).toBe(customer.photo);
  });
});