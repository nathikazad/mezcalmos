const auth = require("../../libraries/rest/auth")
const helper = require("../../libraries/helpers")
const admin = require("firebase-admin");

admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

describe('Mezcalmos', () => {
    beforeAll(async () => {
      await helper.clearDatabase(admin)
    });
  
    it('Create user test', async () => {
      let data = {
        "phoneNumber":"+12098628445",
        "apiKey": "hWZdO4_sandbox"
      }
      let resp = await auth.whatsAppLogin(data);
      console.log(resp)

      let snap = (await admin.database().ref(`/`).once('value')).val()
      let userId = Object.keys(snap.users)[0]
      let OTPCode = snap.users[userId].auth.OTPCode

      data = {
        "phoneNumber":"+12098628445",
        "OTPCode": OTPCode,
        "inTestMode": true
      }
      let resp = await auth.confirmOTP(data)
    });
});