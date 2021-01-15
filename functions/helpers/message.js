module.exports = { notifyOthers }

//possible statuses: lookingForDriver, onTheWay, droppedOff
async function notifyOthers(firebase, params, message) {
  let senderId = message.userId
  let participants = (await firebase.database().ref(`/chat/${params.orderId}/participants`).once('value')).val();
  let senderInfo = participants[senderId]
  senderInfo.id = senderId
  delete participants[senderId]
  for (let participant in participants){
    firebase.database().ref(`/notifications/${participant}`).push({
      notificationType: "newMessage",
      orderId: params.orderId,
      message: message.message,
      time: message.timestamp,
      messageId: params.messageId,
      sender: senderInfo
    })
  }
}