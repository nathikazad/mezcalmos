describe('Google', () => {
  beforeAll(async () => {
    await page.goto('localhost:8080');
  });

  it('User name should be saved', async () => {
    customerApp.createUser("name", "image")
    await expect(customerApp.user.name()).resolves.toMatch('name');
    let userId = customerApp.getuserId()
    await customerApp.callTaxi("from", "to")
    await expect(firebase.user(userId).orders.length, 1)
  });
});