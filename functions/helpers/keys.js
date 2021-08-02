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
      },
      "hasura": {
        "url": 'https://summary-mole-22.hasura.app/v1/graphql',
        "key": 'JzI9zQvNqmLKK1A1HjY1oEZ2FYkd7C7qk8brZYby4wTYIUbaWUVD0F9o07Gj2g4i'
      }
    }
  var fs = require('fs');
  keys = JSON.parse(fs.readFileSync(process.env.MEZC_API_KEYS, 'utf8'));
  return keys
}