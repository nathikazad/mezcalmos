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

    it('Test ChangeNumber Confirmation', async () => {
        // settings 
        let data = {phoneNumber: '+21654521583'}
        let user = await admin.auth().createUser({
           phoneNumber: data.phoneNumber
        })
        admin.database().ref(`/users/${user.uid}/info/phoneNumber`).set(user.phoneNumber);
        let userId = user.uid
        
        // Verify that the code is required
        data = {
            'phoneNumber': '00'
        }
        let response = await auth.confirmNumberChangeUsingOTP(admin, data, userId)
        expect(response.status).toBe('Error')
        expect(response.errorMessage).toBe("Required phone number and OTPCode")

        // Test the confirmation before sending a changeNumber request:
        let authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
        expect(authInfo).toBeNull()
        data = {
            "OTPCode": '000000'
        }
        response = await auth.confirmNumberChangeUsingOTP(admin, data, userId)
        expect(response.status).toBe('Error')
        expect(response.errorMessage).toBe("No phone number change requested")

        // Test the confirmation after sending a changeNumber request
         //Send request for change:
        data = {
            'messageType': 'SMS',
            'phoneNumber': '+21655521583',
            //"apiKey": "uHzCiX_sandbox"
        }
        response = await auth.sendOTPForNumberChange(admin, data, userId)
        
        expect(response.status).toBe('Success')
        expect(sender.sendWhatsApp).not.toHaveBeenCalled()
        expect(sender.sendSMS).toHaveBeenCalledTimes(1)

        authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
        let userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()
        let phoneNumberBeforeChange = userInfo.phoneNumber
        let OTPCode = authInfo.OTPCode
       
        expect(authInfo).not.toBeNull()
        expect(authInfo).toHaveProperty('attempts', 0)
        expect(authInfo).toHaveProperty('requestedPhoneNumber', data.phoneNumber)
        expect(authInfo).toHaveProperty('requestedPhoneNumberType', data.messageType)
        let requestedPhoneNumber = authInfo.requestedPhoneNumber
        let requestedPhoneNumberType = authInfo.requestedPhoneNumberType
        

         //Request Confirmation:

         // Verify that the code must be correct
        data = {
            'OTPCode' : '125478' //wrong code
        }
        response = await auth.confirmNumberChangeUsingOTP(admin, data, userId)
        expect(response.status).toBe('Error')
        expect(response.errorMessage).toBe("Invalid OTP Code")
        authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
        expect(authInfo.attempts).toBe(1)

        // Sending data with the correct Code
        data = {
            'OTPCode': OTPCode,
        }
        response = await auth.confirmNumberChangeUsingOTP(admin, data, userId)
        expect(response.status).toBe('Success')

        //verification
        userInfo = (await admin.database().ref(`users/${userId}/info`).once('value')).val()
        expect(userInfo).toHaveProperty('phoneNumberType', authInfo.messageType)

        //verify updating phone number:
        let userUpdated = await admin.auth().getUser(userId) 
        expect(userUpdated).toHaveProperty('phoneNumber', requestedPhoneNumber)

        //verify updates:
        expect(userInfo.phoneNumber).toBe(requestedPhoneNumber)
        expect(userInfo).toHaveProperty('phoneNumberType', requestedPhoneNumberType)

        //verify removing auth :
        authInfo = (await admin.database().ref(`users/${userId}/auth`).once('value')).val()
        expect(authInfo).toBeNull()
    })
})

afterAll(() => {
    admin.app().delete()
});