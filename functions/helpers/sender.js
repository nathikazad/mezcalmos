const axios = require('axios');
const functions = require('firebase-functions');

const keys = require("./keys").keys();
// const accountSid = keys.twilio.accountid;
// const authToken = keys.twilio.authtoken;
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

       let response = await axios.post("https://waba-sandbox.360dialog.io/v1/messages", message, headers)
      } catch (error) {
        console.log(error)
          return {
            status: "Error",
            errorMessage: error
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


