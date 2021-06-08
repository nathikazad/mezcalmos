const auth = require("../../libraries/rest/auth")
const helper = require("../../libraries/helpers")
const admin = require("firebase-admin");
const {sendWhatsApp} = require("../../../functions/helpers/sender");
const axios = require('axios');


admin.initializeApp({
    projectId: "mezcalmos-31f1c",
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});


let OTPCode = '000000'

let payload = {
    message: `Your one time Mezcalmos OTP code is ${OTPCode}`,
    phoneNumber: '+21654521583',
    apiKey: "uHzCiX_sandbox"
}

jest.mock("axios")

describe('Mezcalmos', () => {
    beforeAll(async () => {
        await helper.clearDatabase(admin)
      });
    it('Test sending whatsApp message', async () => {
       let mockFun = axios.get.mockResolvedValue({
            "contacts":[
                {
                    "wa_id": "newUserId"
                }
            ],
            "messages": [
                {
                    "from": '+16304488781', 
                    "id": "ABGGSHggVwIvAhANFj5aqzEi_lbauSkLYDCO",
                    "type": "text",
                    "text": {
                        "body": `Your one time Mezcalmos OTP code is ${OTPCode}`
                    }
                      
                }
            ]
       })

       console.log(mockFun);

    //    const response = await sendWhatsApp(payload)
       //expect(response.result.contacts[0]).toBe({"wa_id": "newUserId"})



        // tried to mock the hole module

        // const mockSendWhatsApp = jest.fn()
        // .mockReturnValue(Promise.resolve())
    //    sender.sendWhatsApp.mockResolvedValue(payload)
    //    expect(sender.sendWhatsApp.mock).toHaveBeenCalled()
    //  const sendWhatsAppMsg = jest.spyOn(sender, sender.sendWhatsApp)
    //  const result = sendWhatsAppMsg(payload)
    //  expect(result).toBe()
    

    })
})

afterAll(() => {
    admin.app().delete()
});
