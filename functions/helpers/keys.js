module.exports = { keys }

const functions = require('firebase-functions');
function keys() {
  let keys = functions.config()
  if(Object.keys(keys).length > 0)
    return keys
  if(!process.env.MEZC_API_KEYS)
    return {
      "vapidkeys": {
        "public": "BAV5jTZmkERfU-EoeD5TsGuzOhcWXUlNrrh8dkaKGSt92x6eyGCCQYFM4Us_U8vEZ7HRIYqvVjUhUx7ROcL5Hso",
        "private": "LsQNDKic2ZBSUnXlbMqoUI07eEYRuIjIdvj1pg7h33g"
      },
      "twilio": {
        "accountid": "ACbfdce78851a77c16f0fa37a7",
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