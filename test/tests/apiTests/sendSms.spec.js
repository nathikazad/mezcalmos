const auth = require("../../libraries/rest/auth")
const helper = require("../../libraries/helpers")
const admin = require("firebase-admin");


const accountSid = functions.config().TWILIO_ACCOUNT_SID;
const authToken = functions.config().TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

admin.initializeApp({
    projectId: "mezcalmos-31f1c",
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

class TwilioTestClient{

    constructor(sid, token, messages){
         this.sid = sid
         this.token = token
         this.messages = TwilioTestClientMessages()
    }
}
class TwilioTestClientMessages{

    constructor(from, to, body){
        this.from = from
        this.to = to
        this.body = body
    }

}

describe('Mezcalmos', () => {
    beforeAll(async () => {
        await helper.clearDatabase(admin)
        //this.smsClient = new client
      });

    it('Test sending sms message', async () => {
      

    })
})

afterAll(() => {
    admin.app().delete()
});
