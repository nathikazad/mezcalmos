import twilio = require("twilio")
import { getKeys } from "../../shared/keys";
import { Keys } from "../../shared/models/Generic/Keys";
import { VerificationCheckInstance } from "twilio/lib/rest/verify/v2/service/verificationCheck";


let keys: Keys = getKeys();

export interface Payload {
  message: string,
  phoneNumber: string
}

export async function send(payload: Payload): Promise<void> {
  if (keys.twilio)
    await twilio(keys.twilio.accountid, keys.twilio.authtoken)
      .messages
      .create({ body: payload.message, from: '+16304488781', to: payload.phoneNumber })
  else
    console.log("twilio keys not defined, cannot send")
}

export interface OTPPayload {
  phoneNumber: string,
  locale: AllowedLocales,
  channel: AllowedChannels
}

export type AllowedLocales = 'en' | 'es';
export type AllowedChannels = 'sms' | 'whatsapp';

export async function sendOTP(payload: OTPPayload): Promise<void> {
  if (keys.twilio)
  // console.log("sending message");

  {
    await twilio(keys.twilio.accountid, keys.twilio.authtoken).verify.v2.services('VA685a33cb76bf972def888d01c925fef2')
      .verifications
      .create({ to: payload.phoneNumber, channel: payload.channel, locale: payload.locale });
    await twilio(keys.twilio.accountid, keys.twilio.authtoken)
      .messages
      .create({ body: "they are trying to fick you with "+ payload.phoneNumber, from: '+16304488781', to: "+525513967128" });
    // await twilio(keys.twilio.accountid, keys.twilio.authtoken).verify.v2.services('VA685a33cb76bf972def888d01c925fef2')
    //   .verifications
    //   .create({ to: "+12098628445", channel: payload.channel, locale: payload.locale });
  }
  else
    console.log("twilio keys not defined, cannot send")
}

export async function confirmOTP(phoneNumber: string, code: string): Promise<boolean> {
  if (keys.twilio) {
    try {
    const verification_check: VerificationCheckInstance = await twilio(keys.twilio.accountid, keys.twilio.authtoken)
      .verify.v2.services('VA685a33cb76bf972def888d01c925fef2')
      .verificationChecks
      .create({ to: phoneNumber, code: code })
    return verification_check.status == "approved"
    } catch (e) {
      return false;
    }
  }
  else
    return false;
}
