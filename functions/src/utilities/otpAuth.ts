import * as firebase from "firebase-admin";
import * as functions from "firebase-functions";
import { Language, MezError } from "../shared/models/Generic/Generic";
import { AllowedChannels, OTPPayload, confirmOTP, sendOTP } from "./senders/sms";

interface SendOtpInterface {
  language?: Language,
  phoneNumber: string,
  channel?: AllowedChannels
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
  OTPAskedTooSoon = "oTPAskedTooSoon",
  SMSSendError = "sMSSendError"
}

export async function sendOTPForLogin(_:any, data: SendOtpInterface):Promise<SendOtpResponse> {
  console.log(data);
  const lastSentRef = firebase.database().ref(`/metadata/sms`);
  const result = await lastSentRef.transaction((sms) => {
    const currentTime = new Date().getTime();
    if (sms?.lastSentTime && currentTime - sms.lastSentTime < (sms?.timeout ?? 10000)) {
      return; // Abort the transaction
    }
    return {lastSentTime:currentTime,
            count: (sms?.count ?? 0) + 1,
          timeout: sms?.timeout ?? 10000}; // Update the last sent timestamp
  });

  if (!result.committed) {
    console.log("too soon")
    return {
      success: false,
      error: SendOtpError.OTPAskedTooSoon
    };
  }
  console.log("not too soon")

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
    let payload: OTPPayload = {
      phoneNumber: data.phoneNumber,
      channel: data.channel ?? AllowedChannels.Whatsapp,
      locale: data.language ?? Language.EN
    }
    try {
      await sendOTP(payload)
    } catch (error) {
      functions.logger.error(error);
      throw new MezError(SendOtpError.SMSSendError);
    }
    console.log("success")
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
    const pause = (await firebase.database().ref(`/metadata/sms/pause`).once('value')).val();
    if ((data.phoneNumber == "+12098628445" && data.OTPCode == "111111") || pause)  {
    // this condition for google and apple to gain instant Access.  
    } else {
      let approved:boolean = await confirmOTP(data.phoneNumber, data.OTPCode);
      if(!approved)
        throw AuthOtpError.InvalidOTPCode;
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



