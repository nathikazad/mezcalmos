const auth = require('../../../../functions/helpers/auth')
const helper = require("../../../libraries/helpers")
const admin = require("firebase-admin");
jest.mock('../../../../functions/helpers/sender')
const sender = require('../../../../functions/helpers/sender')

admin.initializeApp({
    projectId: "mezcalmos-31f1c",
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

describe('Mezcalmos', () => {
    beforeAll(async () => {
        await helper.clearDatabase(admin)
    });
    it('Test changing number by user', async() => {
      // setting user
      let data = {phoneNumber: '+21654521583'}
      let user = await admin.auth().createUser({
        phoneNumber: data.phoneNumber
      })
      admin.database().ref(`/users/${user.uid}/info/phoneNumber`).set(user.phoneNumber);
      let userId = user.uid

      // missing phone number
      data = {
        "messageType": "SMS",
       //"apiKey": "uHzCiX_sandbox"
      }
      let response = await auth.sendOTPForNumberChange(admin, data, userId)
      //console.log(response);
      expect(response.status).toBe('Error')
      expect(response.errorMessage).toBe("Required phone number")
      expect(sender.sendSMS).not.toHaveBeenCalled()
      expect(sender.sendWhatsApp).not.toHaveBeenCalled()

      // wrong phone number
      data = {
        "phoneNumber": "001",
        "messageType": "SMS",
       //"apiKey": "uHzCiX_sandbox"
      }
      response = await auth.sendOTPForNumberChange(admin, data, userId)
      //console.log(response);
      expect(response.status).toBe('Error')
      expect(response.errorMessage).toBe("Invalid phone number")
      expect(sender.sendSMS).not.toHaveBeenCalled()
      expect(sender.sendWhatsApp).not.toHaveBeenCalled()

      // missing message type
      data = {
        //"messageType": "SMS",
        'phoneNumber' : '+21655521583'
       //"apiKey": "uHzCiX_sandbox"
      }
      response = await auth.sendOTPForNumberChange(admin, data, userId)
      //console.log(response);
      expect(response.status).toBe('Error')
      expect(response.errorMessage).toBe("Required messageType and has to be SMS or whatsApp")
      expect(sender.sendSMS).not.toHaveBeenCalled()
      expect(sender.sendWhatsApp).not.toHaveBeenCalled()

      // wrong message type
      data = {
        "messageType": "cats",
        'phoneNumber' : '+21655521583'
       //"apiKey": "uHzCiX_sandbox"
      }
      response = await auth.sendOTPForNumberChange(admin, data, userId)
      //console.log(response);
      expect(response.status).toBe('Error')
      expect(response.errorMessage).toBe("Required messageType and has to be SMS or whatsApp")
      expect(sender.sendSMS).not.toHaveBeenCalled()
      expect(sender.sendWhatsApp).not.toHaveBeenCalled()

      //Test when phoneNumber is already in use
      data ={
        "messageType": "SMS",
        'phoneNumber' : '+21654521583'
      }
      response = await auth.sendOTPForNumberChange(admin, data, userId)
      //console.log(response);
      expect(response.status).toBe('Error')
      expect(response.errorMessage).toBe("Number is already in use with another user")
      expect(sender.sendSMS).not.toHaveBeenCalled()
      expect(sender.sendWhatsApp).not.toHaveBeenCalled()
      
      //Test with a new phoneNumber:
      data = {
          'messageType': 'SMS',
          'phoneNumber': '+21655521583',
          //"apiKey": "uHzCiX_sandbox"
      }
      response = await auth.sendOTPForNumberChange(admin, data, userId)
     
      expect(response.status).toBe('Success')
      expect(sender.sendWhatsApp).not.toHaveBeenCalled()
      expect(sender.sendSMS).toHaveBeenCalledTimes(1)

      //verification:
      let authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
      let userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()
      let OTPCode = authInfo.OTPCode
      let call = {...sender.sendSMS.mock.calls[0]}

      expect(authInfo).toHaveProperty('requestedPhoneNumber')
      expect(authInfo).toHaveProperty('requestedPhoneNumberType')
      expect(authInfo.requestedPhoneNumber).toBe(data.phoneNumber)
      expect(authInfo.requestedPhoneNumberType).toBe(data.messageType)
      expect(call[0].message).toBe(`Your one time Mezcalmos OTP code is ${OTPCode}`)
      expect(call[0].phoneNumber).toBe(data.phoneNumber)

    })
})
afterAll(() => {
    admin.app().delete()
});