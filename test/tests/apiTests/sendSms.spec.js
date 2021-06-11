//const auth = require("../../libraries/rest/auth")
const auth = require('../../../functions/helpers/auth')
const helper = require("../../libraries/helpers")
const admin = require("firebase-admin");

jest.mock('../../../functions/helpers/sender')
const sender = require('../../../functions/helpers/sender')


admin.initializeApp({
    projectId: "mezcalmos-31f1c",
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
});


describe('Mezcalmos', () => {
  beforeAll(async () => {
      await helper.clearDatabase(admin)
    });

  it('Test when the sendSMS should not be called', async () => {
    
    let authObject = {
      "OTPCode": "333333",
      "attempts": "0",
      "messageType": 'whatsApp',
      "codeGeneratedTime": new Date(2021, 5, 9, 11, 20, 21, 22).toUTCString()
    }  
    let data = {
     "messageType": 'whatsApp',
     "language": 'es',
     "phoneNumber": "+12056521583",
     "apiKey": "uHzCiX_sandbox"
    }
    let testUser = await admin.auth().createUser({
      phoneNumber: data.phoneNumber
    })   
    let testUserId = testUser.uid  
   admin.database().ref(`/users/${testUserId}/auth`).set(authObject);
   admin.database().ref(`/users/${testUserId}/info/phoneNumber`).set(testUser.phoneNumber)  
   let response = await auth.sendOTP(admin, data, testUserId) //the function will generate a new entry code
   let authObjectAfterSending = (await admin.database().ref(`users/${testUserId}/auth`).once('value')).val() 
   let OTPCode = authObjectAfterSending.OTPCode
   let payload = {
    'message': `Su código OTP único de Mezcalmos es ${OTPCode}`,
    'phoneNumber': data.phoneNumber,
    'apiKey': data.apiKey
   }
   expect(sender.sendSMS).toHaveBeenCalledTimes(0);

  })

  it('Test sending SMS', async () => {
      
    let authObject = {
        "OTPCode": "333333",
        "attempts": "0",
        "messageType": 'SMS',
        "codeGeneratedTime": new Date(2021, 5, 9, 11, 20, 21, 22).toUTCString()
    }  
    let data = {
       "messageType": 'SMS',
       "phoneNumber": "+12054521583",
       "apiKey": "uHzCiX_sandbox"
    }
    let testUser = await admin.auth().createUser({
       phoneNumber: data.phoneNumber
    })   
    let testUserId = testUser.uid  
     admin.database().ref(`/users/${testUserId}/auth`).set(authObject);
     admin.database().ref(`/users/${testUserId}/info/phoneNumber`).set(testUser.phoneNumber)  
    let response = await auth.sendOTP(admin, data, testUserId) //the function will generate a new entry code
    let authObjectAfterSending = (await admin.database().ref(`users/${testUserId}/auth`).once('value')).val() 
    let OTPCode = authObjectAfterSending.OTPCode
    let payload = {
      'message': `Your one time Mezcalmos OTP code is ${OTPCode}`,
      'phoneNumber': data.phoneNumber,
      //'apiKey': data.apiKey
    }
    expect(sender.sendSMS).toHaveBeenCalledTimes(1);
    
    expect(sender.sendSMS).toHaveBeenCalledWith(payload)

    let call = {...sender.sendSMS.mock.calls[0]}
    expect(call[0].message).toBe(payload.message)
    expect(call[0].phoneNumber).toBe(payload.phoneNumber)
   

          
  })

  it('Test sendSMS when language is required', async () => {
   
    let authObject = {
      "OTPCode": "333333",
      "attempts": "0",
      "messageType": 'SMS',
      "codeGeneratedTime": new Date(2021, 5, 9, 11, 20, 21, 22).toUTCString()
   }  
    let data = {
     "messageType": 'SMS',
     "language": 'es',
     "phoneNumber": "+12055521583",
     "apiKey": "uHzCiX_sandbox"
    }
    let testUser = await admin.auth().createUser({
     phoneNumber: data.phoneNumber
    })   
    let testUserId = testUser.uid  
    admin.database().ref(`/users/${testUserId}/auth`).set(authObject);
    admin.database().ref(`/users/${testUserId}/info/phoneNumber`).set(testUser.phoneNumber)  
    let response = await auth.sendOTP(admin, data, testUserId) //the function will generate a new entry code
    let authObjectAfterSending = (await admin.database().ref(`users/${testUserId}/auth`).once('value')).val() 
    let OTPCode = authObjectAfterSending.OTPCode
    let payload = {
    'message': `Su código OTP único de Mezcalmos es ${OTPCode}`,
    'phoneNumber': data.phoneNumber,
    //'apiKey': data.apiKey
    }
    expect(sender.sendSMS).toHaveBeenCalledTimes(2);
    expect(sender.sendSMS).toHaveBeenCalledWith(payload)
  
    let call = {...sender.sendSMS.mock.calls[1]}
    expect(call[0].message).toBe(payload.message)
    expect(call[0].phoneNumber).toBe(payload.phoneNumber)
  })

  it('Test in case there is an error', async () => {
    // make mock throw error
    sender.sendSMS.mockImplementation( () => {
      return{
        status: 'Error',
        errorMessage: 'Something is wrong'
      };
    }) 
    let authObject = {
      "OTPCode": "333333",
      "attempts": "0",
      "codeGeneratedTime": new Date(2021, 5, 9, 11, 20, 21, 22).toUTCString(),
      "messageType": 'SMS'
    }  
    let data = {
     "messageType": 'SMS',
     "phoneNumber": "+12057521583",
     "apiKey": "uHzCiX_sandbox"
    }
    let testUser = await admin.auth().createUser({
     phoneNumber: data.phoneNumber
    })   
    let testUserId = testUser.uid  
    admin.database().ref(`/users/${testUserId}/auth`).set(authObject);
    admin.database().ref(`/users/${testUserId}/info/phoneNumber`).set(testUser.phoneNumber)  
    // send OTP
    let response = await auth.sendOTP(admin, data, testUserId) //the function will generate an error
    // console.log('response ', response);

    // verify that it receives an error
    expect(sender.sendSMS).toHaveReturned()
    expect(sender.sendSMS).toHaveBeenCalledTimes(3)
    expect(JSON.stringify(response)).toBe(JSON.stringify({
      status: 'Error',
      errorMessage: 'Something is wrong'
    }))
    // the auth object does not change after sending the function
    let authObjectAfterSending = (await admin.database().ref(`users/${testUserId}/auth`).once('value')).val()
    expect(JSON.stringify(authObjectAfterSending)).toBe(JSON.stringify(authObject))
   //
    let OTPCode = authObjectAfterSending.OTPCode
    payload = {
      'message': `Your one time Mezcalmos OTP code is ${OTPCode}`,
      'phoneNumber': data.phoneNumber,
      // 'apiKey': data.apiKey
    }
    let call = {...sender.sendSMS.mock.calls[2]}
    
   //verify that the OTPCode had changed while calling the function
   expect(sender.sendSMS).not.toHaveBeenCalledWith(payload)
   expect(call[0].message).not.toBe(payload.message)
   //verification
   
   expect(call[0].phoneNumber).toBe(payload.phoneNumber)
   
  })

})

afterAll(() => {
    admin.app().delete()
});
