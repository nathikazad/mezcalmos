const auth = require('../../../../functions/helpers/auth')
const helper = require('../../../libraries/helpers')
const admin = require("firebase-admin");
jest.mock('../../../../functions/helpers/sender')
const sender = require('../../../../functions/helpers/sender')

admin.initializeApp({
    projectId: "mezcalmos-31f1c",
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
  });
  describe( 'Mezcalmos', () => {
    beforeAll(async () => {
        await helper.clearDatabase(admin)
      });

      it('Test sendWhatsApp when the language is not specified', async () => {
        
        // THE TEST IS PASSING WITHOUT THE APIKEY!!!!!
        let  data = {
             "messageType": "whatsApp",
             "phoneNumber":"+21654521583",
             //"apiKey": "uHzCiX_sandbox"
        }
        let response = await auth.sendOTPForLogin(admin, data)    
        //console.log(response);
        expect(response.status).toBe('Success')
        users = (await admin.database().ref(`/users`).once('value')).val()
        let snap = (await admin.database().ref(`/`).once('value')).val()
        let userId = Object.keys(snap.users)[0]

        let authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
        let userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()
        let OTPCode = authInfo.OTPCode

        //verify that sender module is being mocked

        expect(sender.sendSMS).not.toHaveBeenCalled()
        expect(sender.sendWhatsApp).toHaveBeenCalledTimes(1)

        //verification
        let payload = {
              'message': `Your one time Mezcalmos OTP code is ${OTPCode}`,
              'phoneNumber': data.phoneNumber,
              'apiKey': data.apiKey
        }
       
        expect(sender.sendWhatsApp).toHaveBeenCalledWith(payload)
        let call = {...sender.sendWhatsApp.mock.calls[0]}
        console.log('call', call);
        expect(call[0].message).toBe(payload.message)
        expect(call[0].apiKey).toBe(payload.apiKey)
        expect(call[0].phoneNumber).toBe(payload.phoneNumber)

        //removing the user: 
        admin.database().ref(`/users/${userId}`).remove()
      })  

      it('Test sendWhatsApp when language is required', async () => {

        let data = {
          "language": 'es',
          "messageType": "whatsApp",
          "phoneNumber":"+21655521583",
          "apiKey": "uHzCiX_sandbox"
        }
        let response = await auth.sendOTPForLogin(admin, data)    
        //console.log(response);
        expect(response.status).toBe('Success')
        let users = (await admin.database().ref(`/users`).once('value')).val()
      
        let userId = Object.keys(users)[0]
        

        let authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
        let userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()
        let OTPCode = authInfo.OTPCode

        //verify that sender module is being mocked

        expect(sender.sendSMS).not.toHaveBeenCalled()
        expect(sender.sendWhatsApp).toHaveBeenCalledTimes(2)

        //verification
        let payload = {
           'message': `Su código OTP único de Mezcalmos es ${OTPCode}`,
           'phoneNumber': data.phoneNumber,
           'apiKey': data.apiKey
        } 
     
        expect(sender.sendWhatsApp).toHaveBeenCalledWith(payload)
        let call = {...sender.sendWhatsApp.mock.calls[1]}
        expect(call[0].message).toBe(payload.message)
        expect(call[0].apiKey).toBe(payload.apiKey)
        expect(call[0].phoneNumber).toBe(payload.phoneNumber)

        //removing the user: 
        admin.database().ref(`/users/${userId}`).remove()
      })

  
    it('Test when there is an error', async () => {
      // make mock throw error
      sender.sendWhatsApp.mockImplementation( () => {
        return{
          status: 'Error',
          errorMessage: 'Something is wrong'
        };
      }) 
      let  data = {
        "messageType": "whatsApp",
        "phoneNumber":"+21656521583",
        "apiKey": "uHzCiX_sandbox"
      }
      let response = await auth.sendOTPForLogin(admin, data) 
      expect(response.status).toBe('Error')   
      expect(response.errorMessage).toBe('Something is wrong')

      expect(sender.sendSMS).not.toHaveBeenCalled()
      expect(sender.sendWhatsApp).toHaveBeenCalledTimes(3)

      let snap = (await admin.database().ref(`/`).once('value')).val()
      let userId = Object.keys(snap.users)[0]
      let authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
      let userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()

      // verify the auth object and the user info:
      expect(authInfo).toBeNull()
      expect(userInfo.phoneNumber).toBe(data.phoneNumber)

      // verify the parameter called into sendWhatsApp function:
      let call = {...sender.sendWhatsApp.mock.calls[2]}
      
      expect(call[0].apiKey).toBe(data.apiKey)
      expect(call[0].phoneNumber).toBe(data.phoneNumber)
      
    })

  })
  afterAll(() => {
    admin.app().delete()
  });