const auth = require("../../libraries/rest/auth")
const helper = require("../../libraries/helpers")
const admin = require("firebase-admin")
const axios = require('axios')


jest.setTimeout(800000)

const sleep = ms => {
  console.log(`Sleeping for ${ms/1000} seconds`);
  return new Promise(resolve => {
      setTimeout(resolve, ms);
  })
}

admin.initializeApp({
  projectId: "mezcalmos-31f1c",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});

describe('Mezcalmos', () => {
    beforeAll(async () => {
        await helper.clearDatabase(admin)
    });
    it('Test getting authentication by using otp code', async () => {
      //jest.mock('axios')
      // let parameters = {
      //   link : null,
      //   payload: null,
      //   headers : null,
      //   throwError : false
      // } 
      // function post(link, payload, headers,throwError){
      //   link = parameters.link,
      //   payload = parameters.payload,
      //   headers = parameters.headers,
      //   throwError = parameters.throwError
      //   if(throwError){
      //     return{
      //       status: 'Error',
      //       errorMessage: 'send failed'
      //     }
      //   } else {
      //     return{
      //       parameters
      //     }
      //   }
      // }
      // axios.post = post()
      //   global.post = jest.fn( (link, payload, headers) => {
        
      //     Promise.resolve() 
      // })
      // axios.post = post

        // sending code for login
        let data = {
            "messageType": "whatsApp",
            "phoneNumber": "+12098628445",
            "apiKey": "uHzCiX_sandbox"
        }
        let response = await auth.sendCodeLogin(data)  
        console.log('response',response);  
        // expect(response.result.status).toBe('Success')

      //   let snap = (await admin.database().ref(`/`).once('value')).val()
      //   let userId = Object.keys(snap.users)[0]
      //   let authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()  
          
      //   let OTPCode = authInfo.OTPCode
      //   let codeGeneratedTime = authInfo.codeGeneratedTime
      //   // let userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()
      //   // let phoneNumber = userInfo.phoneNumber
      //   expect(authInfo.attempts).toEqual(0)

      
      //   // Test when phone number is missing
      //       data = {
      //         "OTPCode": OTPCode,
      //         "apiKey": "uHzCiX_sandbox"
      //       }
      //       response = await auth.getAuth(data)
      //       expect(response.result.status).toBe('Error')
      //       expect(response.result.errorMessage).toBe("Required phone number and OTPCode")
      //       expect(authInfo.attempts).toEqual(0)
    
      //   // Test when phone number is wrong

      //       data = {
      //         "phoneNumber": "00",
      //         "OTPCode": OTPCode,
      //         "apiKey": "uHzCiX_sandbox"
      //       }
      //       response = await auth.getAuth(data)
      //       expect(response.result.status).toBe('Error')
      //       expect(response.result.errorMessage).toBe("The phone number must be a non-empty E.164 standard compliant identifier string.")
      //       expect(authInfo.attempts).toEqual(0)

    
      //   // Code is required
      //       data = {
      //         "phoneNumber": "+12098628445",
      //         "apiKey": "uHzCiX_sandbox"
      //       }
      //       response = await auth.getAuth(data)
      //       expect(response.result.status).toBe('Error')
      //       expect(response.result.errorMessage).toBe("Required phone number and OTPCode") 
      //       expect(authInfo.attempts).toEqual(0)
    
      //   //Code is wrong 
      //       data = {
      //         "phoneNumber": "+12098628445",
      //         "OTPCode": '585858',
      //         "apiKey": "uHzCiX_sandbox"
      //       }
      //       response = await auth.getAuth(data)
      //       expect(response.result.status).toBe('Error')
      //       expect(response.result.errorMessage).toBe("Invalid OTP Code") 
        
      //   //verification attempts number change
      //     authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val() 
      //     userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()
      //     expect(authInfo.attempts).toEqual(1)

      //  //Test when userPhone does not exist
      //    data = {
      //      "OTPCode": OTPCode,
      //      "phoneNumber": "+12054521583",
      //      "apiKey": "uHzCiX_sandbox"
      //   }
      //    response = await auth.getAuth(data)
      //    expect(response.result.status).toBe('Error')
      //    expect(response.result.errorMessage).toBe("Invalid OTP Code")
      //    //

      //   //  data = {
      //   //       //"messageType": "whatsApp",
      //   //       "phoneNumber":"+12098628445",
      //   //       "OTPCode": OTPCode,
      //   //       "apiKey": "uHzCiX_sandbox"
      //   //     }
      //   //     response = await auth.getAuth(data)
      //   //     console.log(response);

         

    
    
      //   //Test when user exist but time for confirmation is expired:
    
      //          //By using sleep function 
    
      //       data = {
      //         "messageType": "whatsApp",
      //         "phoneNumber":"+12098628445",
      //         "OTPCode": OTPCode,
      //         "apiKey": "uHzCiX_sandbox"
      //       }
      //       let ms = 10 *60 *1000
      //       await sleep(ms)
      //       response = await auth.getAuth(data)
      //       expect(response.result.status).toBe('Error')
      //       expect(response.result.errorMessage).toBe("Invalid OTP Code, time expired")
    
      //       //verification
      //       authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val() 
      //       userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()
    
      //       expect(authInfo.OTPCode).toBe(data.OTPCode)
      //       expect(authInfo.attempts).toEqual(2)
      
      //         //By simulating an old request
    
      //       let authObject = {
      //           "OTPCode": "333333",
      //           "attempts": "0",
      //           "messageType": 'whatsApp',
      //           "codeGeneratedTime": new Date(2021, 4, 30, 11, 20, 21, 22).toUTCString()
      //       }
      //       data = {
      //         // "messageType": 'whatsApp',
      //          "phoneNumber": "+12054521583",
      //          "OTPCode": authObject.OTPCode,
      //          "apiKey": "uHzCiX_sandbox"
      //       }
                 
      //       let testUser = await admin.auth().createUser({
      //         phoneNumber: data.phoneNumber
      //       })
      //       let testUserId = testUser.uid
      //       // injection 
      //       admin.database().ref(`/users/${testUserId}/auth`).set(authObject);
      //       admin.database().ref(`/users/${testUserId}/info/phoneNumber`).set(testUser.phoneNumber)
      //       //verify data injection
      //       authInfo = (await admin.database().ref(`users/${testUserId}/auth`).once('value')).val() 
      //       userInfo = (await admin.database().ref(`users/${testUserId}/info`).once('value')).val()
      //       expect(authInfo.OTPCode).toBe(authObject.OTPCode)
      //       expect(authInfo.codeGeneratedTime).toBe(authObject.codeGeneratedTime)
      //       expect(authInfo.attempts).toBe(authObject.attempts)
                
    
      //       let generatedTime = new Date(authInfo.codeGeneratedTime)
      //       let expirationTime = new Date(generatedTime.getTime() + 10 * 60 * 1000)
      //       console.log(`No confirmation should be valid after: ${expirationTime}`);
      //   // Test confirmation function 
      //       response = await auth.getAuth(data)
      //       expect(response.result.status).toBe('Error')
      //       expect(response.result.errorMessage).toBe("Invalid OTP Code, time expired") 
    
      //       authInfo = (await admin.database().ref(`users/${testUserId}/auth`).once('value')).val() 
      //       expect(authInfo.attempts).toEqual(1)
    
      //   // Test confirmation when attempts are superior then 3
      //      // change the attempts number 
      //       admin.database().ref(`/users/${testUserId}/auth/attempts`).set(4);
      //       authInfo = (await admin.database().ref(`users/${testUserId}/auth`).once('value')).val() 
      //       expect(authInfo.attempts).toEqual(4)
      //          // send confirmation
      //       response = await auth.getAuth(data) 
      //       expect(response.result.status).toBe('Error')
      //       // expect(response.result.errorMessage).toBe("Exceeded number of tries")  


    
      //     //Test when all conditions are respected:
      //       let newDate = new Date(Date.now())
      //       let newCodeGeneratedTime = newDate.toUTCString()
      //       console.log(newCodeGeneratedTime);
      //       admin.database().ref(`/users/${testUserId}/auth/attempts`).set(2);
      //       admin.database().ref(`/users/${testUserId}/auth/codeGeneratedTime`).set(newCodeGeneratedTime);
      //      // send confirmation
      //       response = await auth.getAuth(data) 
      //       expect(response.result.status).toBe('Success')  
            
      //       let userInfoConfirmed = (await admin.database().ref(`users/${testUserId}/info`).once('value')).val()
      //       console.log(userInfoConfirmed);
      //        let authInfoConfirmed = (await admin.database().ref(`users/${testUserId}/auth`).once('value')).val() 
      //       // console.log(userInfo)


      //       expect(userInfoConfirmed.phoneNumberType).toBe(authObject.messageType)
      //       expect(authInfoConfirmed).toBeNull()
                      
    })
})
afterAll(() => {
    admin.app().delete()
  });