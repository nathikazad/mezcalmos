import twilio = require("twilio")
import { getKeys } from "../../shared/keys";


let keys = getKeys();

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