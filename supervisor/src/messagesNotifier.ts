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
    
    if (notificationForQueue.callNotificationType == chat.CallNotificationtType.Incoming) {
      calleeToken = await createAgoraTokensIfNotPresent(notificationForQueue.chatId, callerInfo as chat.ParticipantWithAgora, calleeInfo as chat.ParticipantWithAgora, keys);
      if (calleeToken == null)
        console.log("Agora token generation error");
      else {
        fcmMessage.payload.data!.agoraToken = calleeToken;
        fcmMessage.payload.data!.calleeuid = convertFbIdtoInt(calleeInfo.id).toString();
      }
      console.log(notificationForQueue);
      console.log();
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
  for (let participantType in chatData.participants) {
    if (participantType in chat.nonNotifiableParticipants)
      continue
    for (let participantId in chatData.participants[participantType as chat.ParticipantType]) {
      let participant = chatData.participants[participantType as chat.ParticipantType]![participantId]
      let transformedSenderInfo: chat.Participant = transformSender(senderInfo, chatData.participants, chatData.orderType!, notificationForQueue.participantType, participant.particpantType); //TODO: change this to restaurant or laundry
      let notification: Notification = {
        foreground: <NewMessageNotification>{
          chatId: notificationForQueue.chatId,
          sender: transformedSenderInfo,
          message: notificationForQueue.message,
          orderId: notificationForQueue.orderId ?? null,
          time: notificationForQueue.timestamp,
          notificationType: NotificationType.NewMessage,
          notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
          orderType: chatData.orderType
        },
        background: {
          en: {
            title: `New message from ${transformedSenderInfo.name}`,
            body: notificationForQueue.message
          },
          es: {
            title: `Nueva mensaje de ${transformedSenderInfo.name}`,
            body: notificationForQueue.message
          }
        },
        linkUrl: chatUrl(notificationForQueue.chatId, notificationForQueue.orderId, chatData.orderType, notificationForQueue.participantType, participant.particpantType)
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
  let expirationTime: number = Math.floor(Date.now() / 1000) + 24 * 60 * 60;
  let token: string = agora.RtcTokenBuilder.buildTokenWithUid(keys.agora!.appId,
    keys.agora!.certificate,
    chatId,
    convertFbIdtoInt(user.id),
    agora.RtcRole.PUBLISHER,
    0);
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

function transformSender(
  defaultParticipant: chat.Participant,
  participants: chat.Participants,
  orderType: OrderType,
  recipientType: chat.ParticipantType,
  senderType: chat.ParticipantType,
): chat.Participant {
  let returnParticipant: chat.Participant = defaultParticipant;
  switch (recipientType) {
    case null:
      break;
    case chat.ParticipantType.LaundryOperator: // when receiving message from laundry operator
      returnParticipant = getServiceProviderFromParticipants(participants, chat.ParticipantType.Laundry)
      break;
    case chat.ParticipantType.RestaurantOperator: // when receiving message from restaurant operator
      returnParticipant = getServiceProviderFromParticipants(participants, chat.ParticipantType.Restaurant)
      break;
    case chat.ParticipantType.DeliveryAdmin: // when receiving message from delivery admin operator
      if (senderType == chat.ParticipantType.Customer) {
        switch (orderType) {
          case OrderType.Laundry:
            returnParticipant = getServiceProviderFromParticipants(participants, chat.ParticipantType.Laundry)
            break;
          case OrderType.Restaurant:
            returnParticipant = getServiceProviderFromParticipants(participants, chat.ParticipantType.Restaurant)
            break;
        }
      }
      break;
  }
  return returnParticipant
}

function getServiceProviderFromParticipants(
  participants: chat.Participants,
  participantType: chat.ParticipantType) {
  return participants[participantType]![Object.keys(participants[participantType]!)[0]]
}