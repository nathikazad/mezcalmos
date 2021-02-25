const functions = require('firebase-functions');
module.exports = {
  push
}

const webpush = require('web-push')
const vapidKeys = functions.config().vapidkeys
webpush.setVapidDetails(
  'http://www.mezcalmos.com',
  vapidKeys.public,
  vapidKeys.private
)

async function push(firebase, userId, message, particpantType = "customer") {
  firebase.database().ref(`/notifications/${particpantType}/${userId}`).push(message)
  let subscription = (await firebase.database().ref(`/users/${userId}/notificationInfo`).once('value')).val();

  webpush.sendNotification(subscription, JSON.stringify(message))
}