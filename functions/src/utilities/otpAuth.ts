import * as firebase from "firebase-admin";
import * as functions from "firebase-functions";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import * as sms from "./senders/sms";

interface sendOtpInterface {
  language: string,
  phoneNumber: string
}

interface verifyOtpInterface {
  phoneNumber: string,
  OTPCode: string
}

export const sendOTPForLogin = functions.https.onCall(async (data) => {
  let response = await _sendOTPForLogin(<sendOtpInterface>data);
  return response;
});

export const getAuthUsingOTP = functions.https.onCall(async (data) => {
  let response = await _getAuthUsingOTP(<verifyOtpInterface>data);
  return response;
});

async function _sendOTPForLogin(data: sendOtpInterface): Promise<ServerResponse> {
  if (!data.phoneNumber) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Required phone number"
    }
  }

  let user;
  try {
    user = await firebase.auth().getUserByPhoneNumber(data.phoneNumber);
  } catch (a) {
    let e: any = a;
    if (e.errorInfo.code == "auth/user-not-found") {
      try {
        user = await firebase.auth().createUser({
          phoneNumber: data.phoneNumber
        })
        firebase.database().ref(`/users/${user.uid}/info/phoneNumber`).set(data.phoneNumber);
      } catch (a) {
        let e: any = a;
        return {
          status: ServerResponseStatus.Error,
          errorMessage: e.errorInfo.message,
        }
      }
    } else {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "User not found",
    }
    }
  }

  let response = await sendOTP(data, user.uid)

  if (response != undefined) {
    return response
  }

  return {
    status: ServerResponseStatus.Success
  }
}

async function _getAuthUsingOTP(data: verifyOtpInterface) {
  if (!data.phoneNumber || !data.OTPCode) {
    return {
      status: "Error",
      errorMessage: "Required phone number and OTPCode"
    }
  }
  let user
  try {
    user = await firebase.auth().getUserByPhoneNumber(data.phoneNumber)
  } catch (a) {
    let e: any = a;
    if (e.errorInfo.code == 'auth/user-not-found') {
      return {
        status: 'Error',
        errorMessage: 'Invalid OTP Code'
      }
    } else {
      return {
        status: ServerResponseStatus.Error,
        // errorMessage: e.errorInfo.message
      }
    }
  }

  // this condition for google to gain instant Access.
  if (data.phoneNumber != "+21650914839" && user.uid != "tSG0eSFZNGNA7grjBPFEBbpYwjE3" && user.uid != "xlS6U3OW10P30kgSF6htS63ChHD3") {
    let response = await confirmOTP(data, user.uid);
    if (response) {
      return response;
    }
  }
  else {
    if (data.OTPCode != "111111") {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Invalid OTP Code"
      }
    }
  }

  let customToken;
  if (process.env.FUNCTIONS_EMULATOR != "true") {
    customToken = await firebase.auth().createCustomToken(user.uid);
  }
  firebase.database().ref(`users/${user.uid}/auth`).remove()

  return {
    status: ServerResponseStatus.Success,
    token: customToken
  }
}

async function sendOTP(data: sendOtpInterface, userId: string): Promise<ServerResponse | undefined> {
  let auth = (await firebase.database().ref(`users/${userId}/auth`).once('value')).val();
  if (auth && auth.codeGeneratedTime) {
    let lastCodeGeneratedTime = new Date(auth.codeGeneratedTime);
    let validTimeForNextCodeGeneration = new Date(lastCodeGeneratedTime.getTime() + 60 * 1000);
    if (new Date() < validTimeForNextCodeGeneration) {
      let secondsLeft = (validTimeForNextCodeGeneration.getTime() - Date.now()) / 1000;
      return {
        status: ServerResponseStatus.Error,
        errorMessage: (data.language == "es") ? `No puedes generar otro codigo para ${secondsLeft} segundos` : `Cannot generate another code for ${secondsLeft} seconds`,
        secondsLeft: secondsLeft
      }
    }
  }
  let randomNumber: number = Math.trunc(Math.random() * 1000000)
  let OTPCode = String(randomNumber).padStart(6, '0')

  let payload: sms.Payload = {
    message: (data.language == "es") ? `Su código OTP único de Mezcalmos es ${OTPCode}` : `Your one time Mezcalmos OTP code is ${OTPCode}`,
    phoneNumber: data.phoneNumber
  }

  try {
    await sms.send(payload)
  } catch (error) {
    functions.logger.error(error);
    // console.log(error)
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `SMS Send Error`
    }
  }

  let newCodeEntry = {
    OTPCode: OTPCode,
    codeGeneratedTime: new Date().toISOString(),
    attempts: 0
  }
  firebase.database().ref(`users/${userId}/auth`).set(newCodeEntry)
  return undefined;
}


async function confirmOTP(data: verifyOtpInterface, userId: string): Promise<ServerResponse | undefined> {

  let auth = (await firebase.database().ref(`users/${userId}/auth`).once('value')).val();
  if (!auth || !auth.OTPCode || !auth.codeGeneratedTime) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Invalid OTP Code"
    }
  }

  if (parseInt(auth.attempts) > 3) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Exceeded number of tries"
    }
  }

  firebase.database().ref(`users/${userId}/auth/attempts`).set(parseInt(auth.attempts + 1))

  let generatedTime = new Date(auth.codeGeneratedTime)
  let expirationTime = new Date(generatedTime.getTime() + 10 * 60 * 1000)
  if (new Date() > expirationTime) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Invalid OTP Code"
    }
  }

  if (auth.OTPCode != data.OTPCode) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Invalid OTP Code"
    }
  }

  return
}
