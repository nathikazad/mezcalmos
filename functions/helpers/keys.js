module.exports = { keys }

const functions = require('firebase-functions');
function keys() {
  let keys = functions.config()
  if(Object.keys(keys).length > 0)
    return keys
  if(!process.env.MEZC_API_KEYS)
    return {
      "vapidkeys": {
        "public": "dummy",
        "private": "dummy"
      },
      "twilio": {
        "accountid": "ACdummy",
        "authtoken": "dummy"
      },
      "stripe": {
        "secretkey": "sk_dummy"
      }
    }
  var fs = require('fs');
  keys = JSON.parse(fs.readFileSync(process.env.MEZC_API_KEYS, 'utf8'));
  return keys
}