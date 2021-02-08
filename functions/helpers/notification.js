module.exports = {
  push
}

const webpush = require('web-push')
// TODO: make config variables
const vapidKeys = {
  publicKey: 'BGnr9cpGF42t09PccsyzeJADS1UPmZ4I_QiSY4mmPMTYcsgn5m2BrkPFR4r6gs3KEzMGOXwukjBwhWQ26_ikpMw',
  privateKey: 'tbCb1TWVDlnKjwoRmPedvWQ84L8epZGnSJpT0wfln0E',
}
webpush.setVapidDetails(
  'http://www.mezcalmos.com',
  vapidKeys.publicKey,
  vapidKeys.privateKey
)

async function push(firebase, userId, message) {
  firebase.database().ref(`/notifications/${userId}`).push(message)
  let subscription = (await firebase.database().ref(`/users/${userId}/notificationInfo`).once('value')).val();

  webpush.sendNotification(subscription, JSON.stringify(message))
}