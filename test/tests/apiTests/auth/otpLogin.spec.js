const helper = require("../../../libraries/helpers")
const admin = require("firebase-admin");
jest.mock('../../../../functions/helpers/sender')
const sender = require('../../../../functions/helpers/sender')
const auth = require('../../../../functions/helpers/auth')

jest.setTimeout(70000)

admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

const sleep = ms => {
  console.log(`Sleeping for ${ms/1000} seconds`);
  return new Promise(resolve => {
      setTimeout(resolve, ms);
  })
}



describe('Mezcalmos', () => {
    beforeAll(async () => {
      await helper.clearDatabase(admin)
    });
  
    it('Test sending code for login', async () => {
       //missing phone number
      // let data = {
      //   "messageType": "SMS",
      //   "apiKey": "uHzCiX_sandbox"
      // }
      // let response = await auth.sendCodeLogin(data)
      // expect(response.result.status).toBe('Error')
      // expect(response.result.errorMessage).toBe("Required phone number")

      sender.sendSMS.mockImplementation( () => {
        return{
          status: 'Error',
          errorMessage: 'Something is wrong'
        };
      }) 

      //wrong phone number
      data = {
        "phoneNumber":"+12098628445",
        "messageType": "SMS",
        "apiKey": "uHzCiX_sandbox"
      }
      response = await auth.sendOTPForLogin(admin, data)
      console.log(response)
      // expect(response.result.status).toBe('Error')
      // expect(response.result.errorMessage).toBe('The phone number must be a non-empty E.164 standard compliant identifier string.')

      // //missing message type
      // data = {
      //   "phoneNumber":"+12098628445",
      //   "apiKey": "uHzCiX_sandbox"
      // }
      // response = await auth.sendCodeLogin(data)
      // expect(response.result.status).toBe('Error')
      // expect(response.result.errorMessage).toBe("Required messageType and has to be SMS or whatsApp")

      //  //wrong message type
      // data = {
      //   "messageType": "cats",
      //   "phoneNumber":"+12098628445",
      //   "apiKey": "uHzCiX_sandbox"
      // }
      // response = await auth.sendCodeLogin(data)
      // expect(response.result.status).toBe('Error')
      // expect(response.result.errorMessage).toBe("Required messageType and has to be SMS or whatsApp")

      //new user's phone number
          //verify that no user is created yet
        //   let users = (await admin.database().ref(`/users`).once('value')).val()
        //   expect(users).toBeNull()
        //   // send function:
        //   data = {
        //       "messageType": "SMS",
        //       "phoneNumber":"+21654521583",
        //       "apiKey": "uHzCiX_sandbox"
        //   }
        //  response = await auth.sendCodeLogin(data)    
        //  console.log(response.result);
      
        //  expect(response.result.status).toBe('Success')
          //mocking the sender 

          //users = (await admin.database().ref(`/users`).once('value')).val()
          //let snap = (await admin.database().ref(`/`).once('value')).val()
          // console.log('snap', snap);
          // let userId = Object.keys(snap.users)[0]
          // let authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
          // let OTPCode = authInfo.OTPCode
          // let codeGeneratedTime = authInfo.codeGeneratedTime

          // let userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()
          // let phoneNumber = userInfo.phoneNumber
          // expect(phoneNumber).toBe(data.phoneNumber)

          // verify valid time required before next code generation:
        //   let lastCodeGeneratedTime = new Date(codeGeneratedTime)
        //   let validTimeForNextCodeGeneration = new Date(lastCodeGeneratedTime.getTime() + 60 * 1000)
        //   let secondsLeft = parseInt((validTimeForNextCodeGeneration.getTime() - Date.now()) / 1000)

        // // Test generating a new code, before the required delay:
        //   response = await auth.sendCodeLogin(data)    
        //   expect(response.result.status).toBe('Error')
        //   expect(response.result.errorMessage).toBe(`Cannot generate another code for ${secondsLeft} seconds`)
        
        // // Test generating a new code, while the required delay did not finish yet:
        //   let ms = 30 * 1000 // 30seconds
        //   await sleep(ms)
          
        //   response = await auth.sendCodeLogin(data)  
        //   secondsLeft = parseInt((validTimeForNextCodeGeneration.getTime() - Date.now()) / 1000)  
        //   expect(response.result.status).toBe('Error')
        //   expect(response.result.errorMessage).toBe(`Cannot generate another code for ${secondsLeft} seconds`)

        // // Test generating a new code, after finishing the required delay of 60 seconds
        //   ms = 30*1000
        //   await sleep(ms)

        //   response = await auth.sendCodeLogin(data)  
        //   expect(response.result.status).toBe('Success')
        //   // verifications:
        //   authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
        //   validTimeForNextCodeGeneration = validTimeForNextCodeGeneration.toUTCString()
          
        //   expect(authInfo.codeGeneratedTime).toBe(validTimeForNextCodeGeneration)
          

    });
});
afterAll(() => {
  admin.app().delete()
});