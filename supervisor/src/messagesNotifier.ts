import { Chat, Message } from "../../functions/src/shared/models/Generic/Chat";
import { getChat, setChatMessageNotifiedAsTrue } from "../../functions/src/shared/controllers/chatController";
import * as notifyUser from "../../functions/src/utilities/senders/notifyUser";
import { chatUrl } from "../../functions/src/utilities/senders/appRoutes";
import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { NewMessageNotification, Notification, NotificationAction, NotificationType } from "../../functions/src/shared/models/Notification";

export function startWatchingMessageNotificationQueue() {
  rootNodes.notificationsQueueNode().on('child_added', function (snap) {
    notifyOtherParticipants(snap.key!, snap.val());
    console.log(snap.key);
    rootNodes.notificationsQueueNode(snap.key!).remove();
  });
}

async function notifyOtherParticipants(messageId: string, message: Message) {
  // TO BE REMOVED, added for backwards compatibility in cases where message does not have chatId field
  message.chatId = message.chatId ?? message.orderId;
  // TILL HERE
  let chat: Chat = await getChat(message.chatId);
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
        chatId: message.chatId,
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
      },
      linkUrl: chatUrl(message.chatId)
    }
    notifyUser.pushNotification(participantId, notification, participant.particpantType);
  }
  setChatMessageNotifiedAsTrue(message.chatId, messageId);
}
