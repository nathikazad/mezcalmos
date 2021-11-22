module.exports = { getKeys }
import * as functions from "firebase-functions";
import * as fs from 'fs';
import { Keys } from "./models/Keys";

let keys: Keys = <Keys>functions.config()
if (!process.env.MEZC_API_KEYS) {
  keys = {
    twilio: {
      accountid: "ACbfdce78851a77c16f0fa37a7",
      authtoken: "dummy"
    },
    hasura: {
      key: "rOTavdgkE13VvHckk2AsK5FEMvkCLx5EriEBQF2GJaRLrCw55gv44uATzneQiEMN",
      url: "https://testing-mezc.hasura.app/v1/graphql"
    },
    fcm: {
      key: "smkey"
    }
  }
} else {
  keys = <Keys>JSON.parse(fs.readFileSync(process.env.MEZC_API_KEYS, 'utf8'));
}

export function getKeys(): Keys {
  return keys
}