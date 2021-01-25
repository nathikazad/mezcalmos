module.exports = { notifyOthers }

//possible statuses: lookingForDriver, onTheWay, droppedOff
async function notifyOthers(firebase, params, message) {
  let senderId = message.userId
  let chat = (await firebase.database().ref(`/chat/${params.chatId}`).once('value')).val();
  console.log(chat)
  let senderInfo = chat.participants[senderId]
  senderInfo.id = senderId
  delete chat.participants[senderId]
  for (let participant in chat.participants){
    firebase.database().ref(`/notifications/${participant}`).push({
      notificationType: "newMessage",
      orderId: message.orderId,
      chatType: chat.chatType,
      message: message.message,
      time: message.timestamp,
      messageId: params.messageId,
      sender: senderInfo
    })
  }
}