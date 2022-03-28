import * as functions from "firebase-functions";
import * as fs from 'fs';
import { Keys } from "./models/Generic/Keys";


let keys: Keys = <Keys>functions.config()
if (Object.keys(keys).length == 0) {
  if (process.env.MEZC_API_KEYS) {
    keys = <Keys>JSON.parse(fs.readFileSync(process.env.MEZC_API_KEYS, 'utf8'));
  } else {
    console.log("No environment keys or MEZC_API_KEYS file defined")
  }
}

export function getKeys(): Keys {
  return keys
}

export function setKeys(newKeys: Keys) {
  keys = newKeys;
}