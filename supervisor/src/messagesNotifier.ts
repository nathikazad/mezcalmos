import * as chat from "../../functions/src/shared/models/Generic/Chat";
import { getChat, setChatMessageNotifiedAsTrue, setUserAgoraInfo } from "../../functions/src/shared/controllers/chatController";
import * as notifyUser from "../../functions/src/utilities/senders/notifyUser";
import { chatUrl, orderUrl } from "../../functions/src/utilities/senders/appRoutes";
import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { NewMessageNotification, Notification, NotificationAction, NotificationType, NotificationForQueue, NewCallBackgroundNotification } from "../../functions/src/shared/models/Notification";
import { CounterOfferNotification, CounterOfferNotificationForQueue } from "../../functions/src/shared/models/Services/Taxi/TaxiOrder";
import { OrderType } from "../../functions/src/shared/models/Generic/Order";
import { Language, NotificationInfo } from "../../functions/src/shared/models/Generic/Generic";
import { getNotificationInfo } from "../../functions/src/shared/controllers/rootController";
import * as fcm from "../../functions/src/utilities/senders/fcm";
import * as agora from 'agora-access-token';
import { Keys } from "../../functions/src/shared/models/Generic/Keys";

export function startWatchingMessageNotificationQueue(keys: Keys) {
  rootNodes.notificationsQueueNode().on('child_added', function (snap) {
    let notification: NotificationForQueue = snap.val();
    console.log(`Notification type ${notification.notificationType}`)
    switch (notification.notificationType) {
      case NotificationType.NewMessage:
        notifyOtherMessageParticipants(notification as chat.MessageNotificationForQueue);
        break;
      case NotificationType.NewCounterOffer:
        notifyCustomerAboutCounterOffer(notification as CounterOfferNotificationForQueue)
        break;
      case NotificationType.Call:
        notifyCallerRecipient(notification as chat.CallNotificationForQueue, keys)
        break;
    }
    rootNodes.notificationsQueueNode(snap.key!).remove();
  });
}

async function notifyCallerRecipient(notificationForQueue: chat.CallNotificationForQueue, keys: Keys) {
  let chatData: chat.ChatData = (await getChat(notificationForQueue.chatId)).chatData;
  let callerInfo: chat.Participant = chatData.participants[notificationForQueue.callerParticipantType]![notificationForQueue.callerId]
  let calleeInfo: chat.Participant = chatData.participants[notificationForQueue.calleeParticipantType]![notificationForQueue.calleeId]
  let calleeToken: string | null = null;
  if (notificationForQueue.callNotificationType == chat.CallNotificationtType.Incoming) {
    calleeToken = await createAgoraTokensIfNotPresent(notificationForQueue.chatId, callerInfo as chat.ParticipantWithAgora, calleeInfo as chat.ParticipantWithAgora, keys);
    if (calleeToken == null)
      console.log("Agora token generation error");
    console.log(notificationForQueue);
    console.log();
  }

  let subscription: NotificationInfo = await getNotificationInfo(calleeInfo.particpantType, calleeInfo.id);
  if (subscription != null && subscription.deviceNotificationToken) {
    let language: Language = calleeInfo.language ?? Language.ES;
    let fcmMessage: fcm.fcmPayload = {
      token: subscription.deviceNotificationToken,
      payload: {
        data: <NewCallBackgroundNotification>{
          linkUrl: chatUrl(notificationForQueue.chatId),
          language: language,
          callerName: callerInfo.name ?? "Caller",
          callerId: callerInfo.id,
          chatId: chatData.chatId,
          notificationType: NotificationType.Call,
          callNotificationType: notificationForQueue.callNotificationType,
          callerImage: callerInfo.image,
          callerType: callerInfo.particpantType
        } 
      },
      options: {
        priority: fcm.NotificationPriority.High,
        contentAvailable: true
      }
    };
    if (calleeToken != null){
      fcmMessage.payload.data!.agoraToken = calleeToken;
      fcmMessage.payload.data!.uid = convertFbIdtoInt(callerInfo.id).toString();
    }
console.log(fcmMessage);    
fcm.push(fcmMessage);
  }
}


async function notifyOtherMessageParticipants(notificationForQueue: chat.MessageNotificationForQueue) {
  let chatData: chat.ChatData = (await getChat(notificationForQueue.chatId)).chatData;

  if (chatData.messages && chatData.messages![notificationForQueue.messageId].notified) {
    return
  }
  let senderInfo: chat.Participant = chatData.participants[notificationForQueue.participantType]![notificationForQueue.userId]
  delete chatData.participants[notificationForQueue.participantType];
  for (let nonNotifiableParticipant in chat.nonNotifiableParticipants) {
    delete chatData.participants[chat.nonNotifiableParticipants[nonNotifiableParticipant]];
  }
  for (let participantType in chatData.participants) {
    for (let participantId in chatData.participants[participantType as chat.ParticipantType]) {
      let participant = chatData.participants[participantType as chat.ParticipantType]![participantId]
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
    linkUrl: orderUrl(chat.ParticipantType.Customer, OrderType.Taxi, notificationForQueue.orderId)
  }
  notifyUser.pushNotification(notificationForQueue.customerId, notification, chat.ParticipantType.Customer);
}


async function createAgoraTokensIfNotPresent(chatId: string, caller: chat.ParticipantWithAgora, callee: chat.ParticipantWithAgora, keys: Keys): Promise<string | null> {
  if (keys.agora == null)
    return null
  await setAgoraDetails(chatId, caller, keys)
  let calleetoken: string = await setAgoraDetails(chatId, callee, keys)
  return calleetoken;
}

async function setAgoraDetails(chatId: string, user: chat.Participant, keys: Keys): Promise<string> {
  let expirationTime: number = Math.floor(Date.now() / 1000) + 300;
  let token: string = agora.RtcTokenBuilder.buildTokenWithUid(keys.agora!.appId,
    keys.agora!.certificate,
    chatId,
    convertFbIdtoInt(user.id),
    agora.RtcRole.PUBLISHER,
    expirationTime);
  await setUserAgoraInfo(chatId, user.particpantType, user.id, <chat.ParticipantAgoraDetails>{
    token: token,
    expirationTime: (new Date(expirationTime * 1000)).toISOString(),
    uid: convertFbIdtoInt(user.id)
  })
  return token
}

function convertFbIdtoInt(uid: string): number {
  let encode = '';
  for (let i = 0; i < 7; i++) {
    encode += uid[i].charCodeAt(0)
  }

  return parseInt(encode) % (10 ** 7);
}
