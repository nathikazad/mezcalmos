module.exports = { keys }

const functions = require('firebase-functions');
function keys() {
  let keys = functions.config()
  if(Object.keys(keys).length > 0)
    return keys
  if(!process.env.MEZC_API_KEYS)
    return {
      "vapidkeys": {
        "public": "BI6u8d0SftoK0O9HpSANUfGTli6aWO8PwmjjhVdqPXd5fZRdJfOH0m_nhtFceYNS5Fya1VQvxpx_itrJ0Epppjw",
        
        "private": "1WXut8bK2ctiirzyEka9H5qxuUNNHlTTkCGW5xzpSh8"
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