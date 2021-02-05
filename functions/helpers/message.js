module.exports = { notifyOthers }
const webpush = require('web-push')
const vapidKeys = {
  publicKey:
    'BGnr9cpGF42t09PccsyzeJADS1UPmZ4I_QiSY4mmPMTYcsgn5m2BrkPFR4r6gs3KEzMGOXwukjBwhWQ26_ikpMw',
  privateKey: 'tbCb1TWVDlnKjwoRmPedvWQ84L8epZGnSJpT0wfln0E',
}
webpush.setVapidDetails(
  'http://www.mezcalmos.com',
  vapidKeys.publicKey,
  vapidKeys.privateKey
)

async function notifyOthers(firebase, params, message) {
  let senderId = message.userId
  let chat = (await firebase.database().ref(`/chat/${params.chatId}`).once('value')).val();
  console.log(chat)
  let senderInfo = chat.participants[senderId]
  senderInfo.id = senderId
  delete chat.participants[senderId]
  for (let participant in chat.participants){
    let subscription = (await firebase.database().ref(`/users/${participant}/notificationInfo`).once('value')).val();
    let notification = {
      notificationType: "newMessage",
      orderId: message.orderId,
      chatType: chat.chatType,
      message: message.message,
      time: message.timestamp,
      messageId: params.messageId,
      sender: senderInfo
    }
    firebase.database().ref(`/notifications/${participant}`).push(notification)
    webpush.sendNotification(subscription, JSON.stringify(notification))
  }
}