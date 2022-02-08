import { Chat, Message } from "../../functions/src/shared/models/Generic/Chat";
import { getChat, setChatMessageNotifiedAsTrue } from "../../functions/src/shared/controllers/chatController";
import * as notifyUser from "../../functions/src/shared/notification/notifyUser";
import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { NewMessageNotification, Notification, NotificationAction, NotificationType } from "../../functions/src/shared/models/Generic/Notification";

export function startWatchingMessageNotificationQueue() {
  rootNodes.notificationsQueueNode().on('child_added', function (snap) {
    notifyOtherParticipants(snap.key!, snap.val());
    console.log(snap.key);
    rootNodes.notificationsQueueNode(snap.key!).remove();
  });
}

async function notifyOtherParticipants(messageId: string, message: Message) {
  let chat: Chat = await getChat(message.orderId);
  if (chat.messages && chat.messages![messageId].notified) {
    return
  }
  let senderInfo = chat.participants[message.userId]
  senderInfo.id = message.userId
  delete chat.participants[message.userId]
  for (let participantId in chat.participants) {
    let participant = chat.participants[participantId]
    let notification: Notification = {
      foreground: <NewMessageNotification>{
        sender: senderInfo,
        message: message.message,
        orderId: message.orderId,
        time: message.timestamp,
        notificationType: NotificationType.NewMessage,
        notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
      },
      background: {
        en: {
          title: `New message from ${senderInfo.name}`,
          body: message.message
        },
        es: {
          title: `Nueva mensaje de ${senderInfo.name}`,
          body: message.message
        }
      }
    }
    notifyUser.pushNotification(participantId, notification, participant.particpantType);
  }
  setChatMessageNotifiedAsTrue(message.orderId, messageId);
}
