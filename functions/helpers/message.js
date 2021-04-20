module.exports = { notifyOthers, notifyUser }

const notification = require("./notification");

async function notifyOthers(firebase, params, message) {
  let senderId = message.userId
  let chat = (await firebase.database().ref(`/chat/${params.chatId}`).once('value')).val();
  let senderInfo = chat.participants[senderId]
  senderInfo.id = senderId
  delete chat.participants[senderId]
  for (let participantId in chat.participants){
    let payload = {
      notificationType: "newMessage",
      orderId: message.orderId,
      chatType: chat.chatType,
      message: message.message,
      time: message.timestamp,
      messageId: params.messageId,
      sender: senderInfo
    }
    notification.push(firebase, participantId, payload, chat.participants[participantId].particpantType)
  }
}

async function notifyUser(firebase, params, message) {
  if(message.adminId) {
    let payload = {
      notificationType: "newAdminMessage",
      message: message.message,
      time: message.timestamp,
      messageId: params.messageId
    }
    notification.push(firebase, params.userId, payload, params.userType)
  }
}