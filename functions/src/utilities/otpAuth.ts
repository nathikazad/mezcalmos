import * as firebase from "firebase-admin";
import * as functions from "firebase-functions";
import { MezError } from "../shared/models/Generic/Generic";
import * as sms from "./senders/sms";

interface SendOtpInterface {
  language: string,
  phoneNumber: string
}

interface SendOtpResponse {
  success: boolean,
  error?: SendOtpError
  unhandledError?: string,
  secondsLeft?: number,
}
enum SendOtpError {
  UnhandledError = "unhandledError",
  UserNotFound = "userNotFound",
  OTPAskedTooSoon = "OTPAskedTooSoon",
  SMSSendError = "SMSSendError"
}

export async function sendOTPForLogin(_:any, data: SendOtpInterface):Promise<SendOtpResponse> {
  try {
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
          throw new MezError(e.errorInfo.message);
        }
      } else {
        throw new MezError(SendOtpError.UserNotFound);
      }
    }
    await sendOTP(data, user.uid);
    return {
      success: true
    }
  } catch(e: any) {
    if (e instanceof MezError) {
        if (Object.values(SendOtpError).includes(e.message as any)) {
            return {
                success: false,
                error: e.message as any,
                ...e.details
            }
        } else {
            return {
                success: false,
                error: SendOtpError.UnhandledError,
                unhandledError: e.message as any
            }
        }
    } else {
        throw e
    }
  }
}
interface VerifyOtpInterface {
  phoneNumber: string,
  OTPCode: string
}
export interface AuthResponse {
  success: boolean,
  error?: AuthOtpError
  unhandledError?: string,
  token?: string | undefined
}
enum AuthOtpError {
  UnhandledError = "unhandledError",
  InvalidOTPCode = "invalidOTPCode",
  ExceededNumberOfTries = "exceededNumberOfTries",
}
export async function getAuthUsingOTP(_:any, data: VerifyOtpInterface): Promise<AuthResponse> {
  try {
    let user;
    try {
      user = await firebase.auth().getUserByPhoneNumber(data.phoneNumber)
    } catch (a) {
      let e: any = a;
      if (e.errorInfo.code == 'auth/user-not-found') {

        throw new MezError(AuthOtpError.InvalidOTPCode);
      } else {
        throw new MezError(e.errorInfo.message);
      }
    }

    // this condition for google to gain instant Access.
    if (data.phoneNumber != "+21650914839" && user.uid != "tSG0eSFZNGNA7grjBPFEBbpYwjE3" && user.uid != "xlS6U3OW10P30kgSF6htS63ChHD3") {
      
      await confirmOTP(data, user.uid);
    }
    else {
      if (data.OTPCode != "111111") {
        throw new MezError(AuthOtpError.InvalidOTPCode);
      }
    }

    let customToken;
    if (process.env.FUNCTIONS_EMULATOR != "true") {
      customToken = await firebase.auth().createCustomToken(user.uid);
    }
    firebase.database().ref(`users/${user.uid}/auth`).remove()

    return {
      success: true,
      token: customToken
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(AuthOtpError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any,
        }
      } else {
        return {
          success: false,
          error: AuthOtpError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
}

async function sendOTP(data: SendOtpInterface, userId: string) {

  let auth = (await firebase.database().ref(`users/${userId}/auth`).once('value')).val();
  if (auth && auth.codeGeneratedTime) {
    let lastCodeGeneratedTime = new Date(auth.codeGeneratedTime);
    let validTimeForNextCodeGeneration = new Date(lastCodeGeneratedTime.getTime() + 60 * 1000);
    if (new Date() < validTimeForNextCodeGeneration) {
      let secondsLeft = (validTimeForNextCodeGeneration.getTime() - Date.now()) / 1000;

      throw new MezError(SendOtpError.OTPAskedTooSoon, {secondsLeft});
      // return {
      //   success: false,
      //   errorMessage: (data.language == "es") ? `No puedes generar otro codigo para ${secondsLeft} segundos` : `Cannot generate another code for ${secondsLeft} seconds`,
      //   secondsLeft: secondsLeft,
      // }
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
    throw new MezError(SendOtpError.SMSSendError);
  }

  let newCodeEntry = {
    OTPCode: OTPCode,
    codeGeneratedTime: new Date().toISOString(),
    attempts: 0
  }
  firebase.database().ref(`users/${userId}/auth`).set(newCodeEntry)
}


async function confirmOTP(data: VerifyOtpInterface, userId: string) {

  let auth = (await firebase.database().ref(`users/${userId}/auth`).once('value')).val();
  if (!auth || !auth.OTPCode || !auth.codeGeneratedTime) {

    throw new MezError(AuthOtpError.InvalidOTPCode);
  }

  if (parseInt(auth.attempts) > 3) {
    throw new MezError(AuthOtpError.ExceededNumberOfTries);
  }

  firebase.database().ref(`users/${userId}/auth/attempts`).set(parseInt(auth.attempts + 1))

  let generatedTime = new Date(auth.codeGeneratedTime)
  let expirationTime = new Date(generatedTime.getTime() + 10 * 60 * 1000)
  if (new Date() > expirationTime) {

    throw new MezError(AuthOtpError.InvalidOTPCode);
  }
  if (auth.OTPCode != data.OTPCode) {

    throw new MezError(AuthOtpError.InvalidOTPCode);
  }
}
