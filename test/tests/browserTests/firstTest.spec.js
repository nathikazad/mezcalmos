
const puppeteer = require('puppeteer');
const CustomerApp = require("../../libraries/apps/customerApp")
const admin = require("firebase-admin");
const helper = require("../../libraries/helpers")
admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});


describe('Mezcalmos', () => {
  beforeAll(async () => {
    await helper.clearDatabase(admin)
  });

  it('Create user test', async () => {
    jest.setTimeout(30000);
    const browser = await puppeteer.launch({headless:true});
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
    
    let userFromDb = (await admin.database().ref(`/users/${customerApp.userId}`).once('value')).val();
    
    expect(userFromDb.info.displayName).toBe(customer.displayName);
    expect(userFromDb.info.email).toBe(customer.email);
    expect(userFromDb.info.photo).toBe(customer.photo);

    browser.close()
  });
});

afterAll(() => {
  admin.app().delete()
});