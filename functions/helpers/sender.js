const axios = require('axios');
const functions = require('firebase-functions');

//const accountSid = functions.config().twilio.accountid;
//const authToken = functions.config().twilio.authtoken;

// const accountSid = process.env.ACCOUNT_SID;
// const authToken = process.env.AUTH_TOKEN;

const accountSid = functions.config().TWILIO_ACCOUNT_SID;
const authToken = functions.config().TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

// const accountSid = process.env.TWILIO_ACCOUNT_SID;
// const authToken = process.env.TWILIO_AUTH_TOKEN;
// const client = require('twilio')(accountSid, authToken);

module.exports = {
    sendSMS,
    sendWhatsApp
  }

async function sendWhatsApp(data) {
  

    const headers = {
        'Content-Type': 'application/json',
        'D360-API-KEY': data.apiKey
    }
    
      const message = {
        "recipient_type": "individual",
        "to": data.phoneNumber.replace('+',''),
        "type": "text",
        "text": {
            "body": data.message
        }
      }

      try {
        await axios.post("https://waba-sandbox.360dialog.io/v1/messages", message, headers)
      //   req = await axios.post("https://waba-sandbox.360dialog.io/v1/messages", message, {
      //   headers: headers
      // })
      
      } catch (e) {
        console.log(e)
          return {
            status: "Error",
            errorMessage: e
          }
      }
}

async function sendSMS(data) { 
    try {
      await client.messages
        .create({body: data.message, from: '+16304488781', to: data.phoneNumber})
      } catch (error) {
        console.log(error)
        return {
          status: "Error",
          errorMessage: `Message Send Error`
        }
    }

}


