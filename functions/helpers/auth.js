const axios = require('axios');
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
  let user;
  try {
    user = await firebase.auth().getUserByPhoneNumber(data.phoneNumber);
  } catch(e) {
    if(e.errorInfo.code == "auth/user-not-found"){
      user = await firebase.auth().createUser({phoneNumber: data.phoneNumber})
      firebase.database().ref(`/users/${user.uid}/info/phoneNumber`).set(user.phoneNumber);
    } else {
      return {
        status: "Error",
        errorMessage: e.errorInfo.message
      }
    }
    
  }
  
  let auth = (await firebase.database().ref(`users/${user.uid}/auth`).once('value')).val();
  if(auth && auth.lastCodeGeneratedTime) {
    let lastCodeGeneratedTime = new Date(auth.lastCodeGeneratedTime);
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
  
  const headers = {
    'Content-Type': 'application/json',
    'D360-API-KEY': data.apiKey
  }

  const message = {
    "recipient_type": "individual",
    "to": data.phoneNumber.replace('+',''),
    "type": "text",
    "text": {
        "body": `Your one time OTP code is ${OTPCode}`
    }
  }
  
  try {
    await axios.post("https://waba-sandbox.360dialog.io/v1/messages", message, {
    headers: headers
  })
  } catch (error) {
      return {
        status: "Error",
        errorMessage: `Message Send Error`
      }
  }

  firebase.database().ref(`users/${user.uid}/auth`).set(newCodeEntry)

  return {
    status: "Success"
  }
}


async function confirmOTP(firebase, data) {
  if (!data.phoneNumber || !data.OTPCode) {
    return {
        status: "Error",
        errorMessage: "Required phone number and OTPCode"
    }
  }
  let user = await firebase.auth().getUserByPhoneNumber(data.phoneNumber);
  // console.log(user)
  if(!user) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code"
    }
  }
  let auth = (await firebase.database().ref(`users/${user.uid}/auth`).once('value')).val();
  if(!auth || !auth.OTPCode || !auth.codeGeneratedTime) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code"
    }
  }

  if(parseInt(auth.attempts) > 3) {
    return {
      status: "Error",
      errorMessage: "Exceeded number of tries"
    }
  }

  firebase.database().ref(`users/${user.uid}/auth/attempts`).set(parseInt(auth.attempts+1))
  
  let generatedTime = new Date(auth.codeGeneratedTime)
  let expirationTime = new Date(generatedTime.getTime() + 10 * 60 * 1000)
  if(Date.now() > expirationTime) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code"
    }
  }

  if(auth.OTPCode != data.OTPCode) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code"
    }
  }

  let customToken;
  if(data.inTestMode == null){
    customToken = await firebase.auth().createCustomToken(user.uid);
  }
  firebase.database().ref(`users/${user.uid}/auth`).remove()

  return {
    status: "Success", token: customToken
  }
}