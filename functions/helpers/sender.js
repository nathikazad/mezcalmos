const axios = require('axios');
const functions = require('firebase-functions');

const keys = require("./keys").keys();
const accountSid = keys.twilio.accountid;
const authToken = keys.twilio.authtoken;
const client = require('twilio')(accountSid, authToken);

const webpush = require('web-push')
const vapidKeys = keys.vapidkeys

webpush.setVapidDetails(
  'http://www.mezcalmos.com',
  vapidKeys.public,
  vapidKeys.private
)

module.exports = {
    sendSMS,
    sendWhatsApp,
    sendToDevice,
    sendToBrowser
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


async function sendToDevice(notifKey, message, firebase) {
  const payload = {
    notification: message
  };
  try {
    let response = await firebase.messaging().sendToDevice(notifKey, payload)
    // console.log(response);
  } catch (e) {
    console.log(`Send to devices error `, e);
  }
}

async function sendToBrowser(webPushKey, message) {
  try{
    let response = await webpush.sendNotification(webPushKey, JSON.stringify(message)) 
    // console.log(response);
  } catch (e){
    functions.logger.error(`web push error `, e);
  }
}