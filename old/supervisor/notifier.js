const firebaseAdmin = require("firebase-admin");

const keys = requireHelper("keys").keys()
const notification = requireHelper("notification")


function requireHelper(filename) {
  return require(`../functions/helpers/${filename}`)
}

if (process.argv.length != 3) {
  console.log("Required environment variable")
  process.exit()
}

const env = process.argv[2]

if (env != "emulate" && env != "staging" && env != "production") {
  console.log("Invalid environment has to be emulate, staging or production")
  process.exit()
}

let firebaseParams = { databaseURL: keys[env].databaseURL };
if (keys[env].serviceAccount)
  firebaseParams.credential = firebaseAdmin.credential.cert(require(keys[env].serviceAccount))
const firebase = firebaseAdmin.initializeApp(firebaseParams)
// const fcm = new sender.FCM(keys[env].fcm)



firebase.database().ref(`/notificationQueue`).on('child_added', function (snap) {
  notifyOtherParticipants(snap.key, snap.val());
  // firebase.database().ref(`notificationQueue/${snap.key}`).remove();
});

notificationMessage = {
  "en": "New message from ",
  "es": "Nueva mensaje de "
}

async function notifyOtherParticipants(messageId, message) {
  let chat = (await firebase.database().ref(`chat/${message.orderId}`).once("value")).val();
  if (chat["messages"][messageId]["alreadyNotified"] != true) {
    let senderInfo = chat.participants[message.userId]
    senderInfo.id = message.userId
    delete chat.participants[message.userId]
    for (let participantId in chat.participants) {
      let participant = chat.participants[participantId]
      let payload = {
        notificationType: "newMessage",
        orderId: message.orderId,
        chatType: chat.chatType,
        message: message.message,
        time: message.timestamp,
        messageId: messageId,
        sender: senderInfo
      }
      if (!participant.language) {
        participant.language = "en"
      }
      let n = {
        title: `${notificationMessage[participant.language]}${senderInfo.name}`,
        body: message.message
      }
      let deviceNotificationToken
      if (participant.particpantType == "customer") {
        deviceNotificationToken = (await firebase.database().ref(`/customers/info/${participantId}/notificationInfo/deviceNotificationToken`).once('value')).val();
      } else if (participant.particpantType == "taxi") {
        deviceNotificationToken = (await firebase.database().ref(`/taxiDrivers/${participantId}/notificationInfo/deviceNotificationToken`).once('value')).val();
      } else if (participant.particpantType == "deliveryAdmin") {
        deviceNotificationToken = (await firebase.database().ref(`/deliveryAdmins/info/${participantId}/notificationInfo/deviceNotificationToken`).once('value')).val();
      }
      console.log(deviceNotificationToken)
      fcm.push({
        to: deviceNotificationToken,
        notification: notification,
        priority: "high"
      });
      // notification.push(firebase, participantId, payload, chat.participants[participantId].particpantType)
      // firebase.database().ref(`chat/${message.orderId}/messages/${messageId}/alreadyNotified`).set(true)
    }
  }
}

function push() {
  fcm.push({
    registration_ids: driverNotificationTokens,
    notification: {
      title: "Nueva Pedido",
      body: `Hay una nueva orden de taxi, vea si puede aceptarla.`,
      tag: "newOrder"
    },
    data: {
      notificationType: "newOrder",
      markReceivedUrl: constructReturnUrl(orderId)
    },
    collapse_key: "newOrder",
    priority: "high"
  });
}