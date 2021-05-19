module.exports = {
    sendOTP,
    confirmOTP
  }

async function sendOTP(firebase, data) {
  if (!data.phoneNumber) {
    return {
      status: "Error",
      errorMessage: "Required phone number"
    }
  }
  
  let phoneNumberEntry = (await firebase.database().ref(`/auth/numbers/${data.phoneNumber}`).once('value')).val();
  if(phoneNumberEntry && phoneNumberEntry.lastCodeGeneratedTime) {
    let lastCodeGeneratedTime = new Date(phoneNumberEntry.lastCodeGeneratedTime);
    let validTimeForNextCodeGeneration = new Date(lastCodeGeneratedTime.getTime() + 60*1000);
    if(Date.now() < validTimeForNextCodeGeneration) {
      let secondsLeft = parseInt((validTimeForNextCodeGeneration.getTime() - Date.now())/1000)
      return {
        status: "Error",
        errorMessage: `Cannot generate another code for ${secondsLeft} seconds`
      }
    }
  }

  let OTPCode = parseInt(Math.random()*1000000)

  let newCodeEntry = {
    OTPCode: OTPCode,
    codeGeneratedTime: new Date().toUTCString(),
    attempts: 0
  }
  // send code and check for error
  firebase.database().ref(`/auth/numbers/${data.phoneNumber}`).update(newCodeEntry)

  return {
    status: "Success"
  }
}


async function confirmOTP(firebase, data) {

  // expirationTime: new Date(Date.now()+10*60*1000).toUTCString(),
  if (!data.phoneNumber || !data.OTPCode) {
    return {
        status: "Error",
        errorMessage: "Required phone number and OTPCode"
    }
  }

  let phoneNumberEntry = (await firebase.database().ref(`/auth/numbers/${data.phoneNumber}`).once('value')).val();
  if(!phoneNumberEntry || !phoneNumberEntry.OTPCode || !phoneNumberEntry.codeGeneratedTime) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code"
    }
  }

  if(parseInt(phoneNumberEntry.attempts) > 3) {
    return {
      status: "Error",
      errorMessage: "Exceeded number of tries"
    }
  }

  firebase.database().ref(`/auth/numbers/${data.phoneNumber}/attempts`).set(parseInt(phoneNumberEntry.attempts+1))


  
  let generatedTime = new Date(phoneNumberEntry.codeGeneratedTime)
  let expirationTime = new Date(generatedTime.getTime() + 10 * 60 * 1000)
  if(Date.now() > expirationTime) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code"
    }
  }

  if(phoneNumberEntry.OTPCode != data.OTPCode) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code"
    }
  }

  if(!phoneNumberEntry.userId){
    let userRecord = await firebase.auth().createUser({phoneNumber: data.phoneNumber})
    firebase.database().ref(`/auth/numbers/${data.phoneNumber}/userId`).set(userRecord.uid)
    phoneNumberEntry.userId = userRecord.uid
  } 

  let customToken = await firebase.auth().createCustomToken(phoneNumberEntry.userId);

  // let newCodeEntry = {
  //   OTPCode: null,
  //   codeGeneratedTime: null,
  //   attempts: null
  // }
  // // send code and check for error
  // firebase.database().ref(`/auth/numbers/${data.phoneNumber}`).update(newCodeEntry)


  return {
    status: "Success", token: customToken
  }
}
    // confirmOTP {
//   // check code maps
//   // check not expired
//   // check ip address matches
//   // if new user
//   //    create new user
//   // else 
//   //    use existing user
//   // generate jwt token
//   // send to front
// }