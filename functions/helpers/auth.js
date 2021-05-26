module.exports = {
    sendOTP,
    confirmOTP
  }
const sender = require("./sender")

async function sendOTP(firebase, data) {
  if (!data.phoneNumber) {
    return {
      status: "Error",
      errorMessage: "Required phone number"
    }
  }

  if (!data.messageType && 
      (data.messageType != "SMS" || data.messageType != "whatsApp")) {
    return {
      status: "Error",
      errorMessage: "Required messageType and has to be SMS or whatsApp"
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
  
  let payload = {
    message: `Your one time Mezcalmos OTP code is ${OTPCode}`,
    phoneNumber: data.phoneNumber
  }

  if(data.language == "es"){
    payload.message = `Su código OTP único de Mezcalmos es ${OTPCode}`
  }

  let response
  if(data.messageType && data.messageType == "whatsApp"){
    payload.apiKey = data.apiKey
    response = await sender.sendWhatsApp(payload)
  } else {
    response = await sender.sendSMS(payload)
  }

  if(response) {
    return response
  }

  let newCodeEntry = {
    OTPCode: OTPCode,
    codeGeneratedTime: new Date().toUTCString(),
    attempts: 0
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
  if(process.env.FUNCTIONS_EMULATOR != true){
    customToken = await firebase.auth().createCustomToken(user.uid);
  }
  firebase.database().ref(`users/${user.uid}/auth`).remove()

  return {
    status: "Success", token: customToken
  }
}
