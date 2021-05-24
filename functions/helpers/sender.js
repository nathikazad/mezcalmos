const axios = require('axios');
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
        await axios.post("https://waba-sandbox.360dialog.io/v1/messages", message, {
        headers: headers
      })
      } catch (error) {
        console.log(error)
          return {
            status: "Error",
            errorMessage: `Message Send Error`
          }
      }
}

async function sendSMS(data) {
    const accountSid = functions.config().twilio.accountSid;
    const authToken = functions.config().twilio.authToken;
    const client = require('twilio')(accountSid, authToken);

    try {
      await client.messages
        .create({body: data.message, from: '+16304488781', to: data.phoneNumber.replace('+','')})
      } catch (error) {
        console.log(error)
        return {
          status: "Error",
          errorMessage: `Message Send Error`
        }
    }

}