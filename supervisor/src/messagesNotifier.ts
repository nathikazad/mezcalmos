import { CallNotificationForQueue, ChatData, MessageNotificationForQueue, nonNotifiableParticipants, Participant, ParticipantType } from "../../functions/src/shared/models/Generic/Chat";
import { getChat, setChatMessageNotifiedAsTrue } from "../../functions/src/shared/controllers/chatController";
import * as notifyUser from "../../functions/src/utilities/senders/notifyUser";
import { chatUrl, orderUrl } from "../../functions/src/utilities/senders/appRoutes";
import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { NewMessageNotification, Notification, NotificationAction, NotificationType, NotificationForQueue } from "../../functions/src/shared/models/Notification";
import { CounterOfferNotification, CounterOfferNotificationForQueue } from "../../functions/src/shared/models/Services/Taxi/TaxiOrder";
import { OrderType } from "../../functions/src/shared/models/Generic/Order";
import { Language, NotificationInfo } from "../../functions/src/shared/models/Generic/Generic";
import { getNotificationInfo } from "../../functions/src/shared/controllers/rootController";
import * as fcm from "../../functions/src/utilities/senders/fcm";

export function startWatchingMessageNotificationQueue() {
  rootNodes.notificationsQueueNode().on('child_added', function (snap) {
    let notification: NotificationForQueue = snap.val();
    console.log(`Notification type ${notification.notificationType}`)
    switch (notification.notificationType) {
      case NotificationType.NewMessage:
        notifyOtherMessageParticipants(notification as MessageNotificationForQueue);
        break;
      case NotificationType.NewCounterOffer:
        notifyCustomerAboutCounterOffer(notification as CounterOfferNotificationForQueue)
        break;
      case NotificationType.Call:
        notifyCallerRecipient(notification as CallNotificationForQueue)
        break;
    }
    rootNodes.notificationsQueueNode(snap.key!).remove();
  });
}

async function notifyCallerRecipient(notificationForQueue: CallNotificationForQueue) {
  let chatData: ChatData = (await getChat(notificationForQueue.chatId)).chatData;
  let callerInfo: Participant = chatData.participants[notificationForQueue.callerParticipantType]![notificationForQueue.callerId]
  let calleeInfo: Participant = chatData.participants[notificationForQueue.calleeParticipantType]![notificationForQueue.calleeId]
  let subscription: NotificationInfo = await getNotificationInfo(calleeInfo.particpantType, calleeInfo.id);
  if (subscription != null && subscription.deviceNotificationToken) {
    let language: Language = calleeInfo.language ?? Language.ES;
    let fcmMessage: fcm.fcmPayload = {
      token: subscription.deviceNotificationToken,
      payload: {
        data: {
          linkUrl: chatUrl(notificationForQueue.chatId),
          language: language,
          callerName: callerInfo.name ?? "Caller",
          notificationType: NotificationType.Call,
          callerImage: callerInfo.image,
          callerType: callerInfo.particpantType
        }
      },
      options: {
        priority: fcm.NotificationPriority.High,
        contentAvailable: true
      }
    };
    fcm.push(fcmMessage);
  }
}


async function notifyOtherMessageParticipants(notificationForQueue: MessageNotificationForQueue) {
  let chatData: ChatData = (await getChat(notificationForQueue.chatId)).chatData;

  if (chatData.messages && chatData.messages![notificationForQueue.messageId].notified) {
    return
  }
  let senderInfo: Participant = chatData.participants[notificationForQueue.participantType]![notificationForQueue.userId]
  delete chatData.participants[notificationForQueue.participantType];
  for (let nonNotifiableParticipant in nonNotifiableParticipants) {
    delete chatData.participants[nonNotifiableParticipants[nonNotifiableParticipant]];
  }
  for (let participantType in chatData.participants) {
    for (let participantId in chatData.participants[participantType as ParticipantType]) {
      let participant = chatData.participants[participantType as ParticipantType]![participantId]
      let notification: Notification = {
        foreground: <NewMessageNotification>{
          chatId: notificationForQueue.chatId,
          sender: senderInfo,
          message: notificationForQueue.message,
          orderId: notificationForQueue.orderId ?? null,
          time: notificationForQueue.timestamp,
          notificationType: NotificationType.NewMessage,
          notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
        },
        background: {
          en: {
            title: `New message from ${senderInfo.name}`,
            body: notificationForQueue.message
          },
          es: {
            title: `Nueva mensaje de ${senderInfo.name}`,
            body: notificationForQueue.message
          }
        },
        linkUrl: chatUrl(notificationForQueue.chatId)
      }
      notifyUser.pushNotification(participantId, notification, participant.particpantType);
    }
  }
  setChatMessageNotifiedAsTrue(notificationForQueue.chatId, notificationForQueue.messageId);
}

async function notifyCustomerAboutCounterOffer(notificationForQueue: CounterOfferNotificationForQueue) {
  // TODO: check to see if customer has an order and counter offer has been notified
  let notification: Notification = {
    foreground: <CounterOfferNotification>{
      driver: notificationForQueue.driver,
      orderId: notificationForQueue.orderId,
      customerId: notificationForQueue.customerId,
      price: notificationForQueue.price,
      time: notificationForQueue.timestamp,
      notificationType: NotificationType.NewCounterOffer,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background: {
      en: {
        title: 'New counter offer',
        body: `New offer from ${notificationForQueue.driver.name} for ${notificationForQueue.price}`
      },
      es: {
        title: `Nueva contraoferta`,
        body: `Nueva oferta de ${notificationForQueue.driver.name} para ${notificationForQueue.price}`
      }
    },
    linkUrl: orderUrl(ParticipantType.Customer, OrderType.Taxi, notificationForQueue.orderId)
  }
  notifyUser.pushNotification(notificationForQueue.customerId, notification, ParticipantType.Customer);
}