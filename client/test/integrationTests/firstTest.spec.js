const CustomerApp = require("../classes/apps/customerApp")
const puppeteer = require('puppeteer');
const Database = require("../classes/database");

database = new Database()
describe('Mezcalmos', () => {
  beforeAll(async () => {
    await database.reset()
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
    customerApp.page.waitForTimeout(1000)
    let userInfo = await customerApp.getUserInfo()
    expect(userInfo.displayName).toBe(customer.displayName);
    expect(userInfo.email).toBe(customer.email);
    expect(userInfo.photo).toBe(customer.photo);
    
    let userFromDb = await database.get(`users/${customerApp.userId}`)
    
    expect(userFromDb.info.displayName).toBe(customer.displayName);
    expect(userFromDb.info.email).toBe(customer.email);
    expect(userFromDb.info.photo).toBe(customer.photo);

    browser.close()
  });
});