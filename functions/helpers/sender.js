const axios = require('axios');
const functions = require('firebase-functions');

const keys = require("./keys").keys();

let twilio;
if (keys.twilio && keys.twilio.accountid && keys.twilio.authtoken) {
  let accountSid = keys.twilio.accountid;
  let authToken = keys.twilio.authtoken;
  twilio = require('twilio')(accountSid, authToken);
}


const webpush = require('web-push')
const vapidKeys = keys.vapidkeys

if (vapidKeys && vapidKeys.public && vapidKeys.private) {
  webpush.setVapidDetails(
    'http://www.mezcalmos.com',
    vapidKeys.public,
    vapidKeys.private
  )
}

module.exports = {
  sendSMS,
  sendToDevice,
  sendToBrowser
}

async function sendSMS(data) {
  try {
    await twilio.messages
      .create({ body: data.message, from: '+16304488781', to: data.phoneNumber })
  } catch (error) {
    console.log(error)
    return {
      status: "Error",
      errorMessage: `Message Send Error`
    }
  }
}


module.exports.FCM = class FCM {
  constructor(key) {
    this.key = key
  }

  async push(message) {
    axios.post(
      "https://fcm.googleapis.com/fcm/send",
      message,
      {
        headers: {
          "Content-Type": "application/json",
          Authorization:
            `key=${this.key}`
        }
      }
    )
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