import * as chat from "../../functions/src/shared/models/Generic/Chat";
// import { getChat, setChatMessageNotifiedAsTrue, setUserAgoraInfo } from "../../functions/src/shared/controllers/chatController";
import * as notifyUser from "../../functions/src/utilities/senders/notifyUser";
import { chatUrl, orderUrl, restaurantUrl } from "../../functions/src/utilities/senders/appRoutes";
import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { NewMessageNotification, Notification, NotificationAction, NotificationType, NotificationForQueue, NewCallBackgroundNotification, AuthorizeOperatorNotification } from "../../functions/src/shared/models/Notification";
// import { CounterOfferNotificationForQueue } from "../../functions/src/shared/models/Services/Taxi/TaxiOrder";
import * as fcm from "../../functions/src/utilities/senders/fcm";
import * as agora from 'agora-access-token';
import { Keys } from "../../functions/src/shared/models/Generic/Keys";
import { 
  AuthorizeOperatorNotificationForQueue, 
  NewRestaurantNotification, 
  NewRestaurantNotificationForQueue,
  OperatorApprovedNotificationForQueue, 
  RestaurantOperatorApprovedNotification
} from "../../functions/src/shared/models/Services/Restaurant/Restaurant";
import { getRestaurantOperator, getRestaurantOperators } from "../../functions/src/shared/graphql/restaurant/operators/getRestaurantOperators"
import { getMezAdmins } from "../../functions/src/shared/graphql/user/mezAdmin/getMezAdmins"
import { getDeliveryOperators } from "../../functions/src/shared/graphql/delivery/operator/getDeliveryOperator"
import { AssignDeliveryCompanyNotificationForQueue, AssignDeliveryCompanyNotification } from "../../functions/src/shared/models/Generic/Delivery";
import { getChatParticipant, getChatParticipants } from "../../functions/src/shared/graphql/chat/getChatParticipant"
import { setUserAgoraInfo } from "../../functions/src/shared/graphql/chat/setChatInfo"

import { HttpsError } from "firebase-functions/v1/auth";

export function startWatchingMessageNotificationQueue(keys: Keys) {
  console.log("starting watching message notifications")
  rootNodes.notificationsQueueNode().on('child_added', function (snap) {
    let notification: NotificationForQueue = snap.val();
    console.log(`Notification type ${notification.notificationType}`)
    switch (notification.notificationType) {
      case NotificationType.NewMessage:
        notifyOtherMessageParticipants(notification as chat.MessageNotificationForQueue);
        break;
      // case NotificationType.NewCounterOffer:
      //   notifyCustomerAboutCounterOffer(notification as CounterOfferNotificationForQueue)
      //   break;
      case NotificationType.Call:
        notifyCallerRecipient(notification as chat.CallNotificationForQueue, keys)
        break;
      case NotificationType.OperatorApproved:
        notifyOperatorAboutApproval(notification as OperatorApprovedNotificationForQueue)
        break;
      case NotificationType.AuthorizeOperator:
        notifyOwnerAuthorizeOperator(notification as AuthorizeOperatorNotificationForQueue)
        break;
      case NotificationType.NewRestaurant:
        notifyMezAdminsNewRestaurant(notification as NewRestaurantNotificationForQueue)
        break;
      case NotificationType.NewOrder:
        notifyDeliveryOperatorsNewOrder(notification as AssignDeliveryCompanyNotificationForQueue)
        break;
    }
    rootNodes.notificationsQueueNode(snap.key!).remove();
  });
}
async function notifyOperatorAboutApproval(notificationForQueue: OperatorApprovedNotificationForQueue) {

  let notification: Notification = {
    foreground: <RestaurantOperatorApprovedNotification>{
      operatorId: notificationForQueue.operatorId,
      approved: notificationForQueue.approved,
      restaurantName: notificationForQueue.restaurantName,
      restaurantId: notificationForQueue.restaurantId,
      time: notificationForQueue.timestamp,
      notificationType: NotificationType.OperatorApproved,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background: (notificationForQueue.approved) ? {
      en: {
        title:  `Authorized`,
        body: `You have been approved as an operator at ${notificationForQueue.restaurantName}`
      },
      es: {
        title: `Authorized`,
        body: `You have been approved as an operator at ${notificationForQueue.restaurantName}`
      }
    } : {
      en: {
        title: `Not approved`,
        body: `Your request to become an operator at ${notificationForQueue.restaurantName} has been denied`
      },
      es: {
        title: `Not approved`,
        body: `Your request to become an operator at ${notificationForQueue.restaurantName} has been denied`
      }
    },
    linkUrl: restaurantUrl(notificationForQueue.restaurantId)
  }
  let operator = await getRestaurantOperator(notificationForQueue.operatorId)
  if(operator.user) {
    notifyUser.pushNotification(
      operator.user.firebaseId, 
      notification, 
      operator.notificationInfo, 
      chat.ParticipantType.RestaurantOperator,
      operator.user.language,
    );
  }
}
async function notifyOwnerAuthorizeOperator(notificationForQueue: AuthorizeOperatorNotificationForQueue) {

  let notification: Notification = {
    foreground: <AuthorizeOperatorNotification>{
      newOperatorName: notificationForQueue.newOperatorName,
      newOperatorImage: notificationForQueue.newOperatorImage,
      serviceProviderId: notificationForQueue.restaurantId,
      time: notificationForQueue.timestamp,
      notificationType: NotificationType.AuthorizeOperator,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background:{
      en: {
        title: `Authorize Operator`,
        body: `An operator named ${notificationForQueue.newOperatorName} is requesting to join your restaurant`
      },
      es: {
        title: `Authorize Operator`,
        body: `An operator named ${notificationForQueue.newOperatorName} is requesting to join your restaurant`
      }
    },
    linkUrl: restaurantUrl(notificationForQueue.restaurantId)
  }
  let operators = await getRestaurantOperators(notificationForQueue.restaurantId);
  operators.forEach((o) => {
    if(o.owner && o.user) {
      notifyUser.pushNotification(
        o.user.firebaseId, 
        notification, 
        o.notificationInfo, 
        chat.ParticipantType.RestaurantOperator,
        o.user.language,
      );
    }
  })
}
async function notifyMezAdminsNewRestaurant(notificationForQueue: NewRestaurantNotificationForQueue) {

  let notification: Notification = {
    foreground: <NewRestaurantNotification>{
      id: notificationForQueue.id,
      image: notificationForQueue.image,
      name: notificationForQueue.name,
      time: notificationForQueue.timestamp,
      notificationType: NotificationType.NewRestaurant,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background: {
      en: {
        title:  `New Restaurant`,
        body: `There is a new restaurant`
      },
      es: {
        title: `Nuevo restaurante`,
        body: `Hay un nuevo restaurante`
      }
    },
    linkUrl: restaurantUrl(notificationForQueue.id)
  }
  let mezAdmins = await getMezAdmins();
  mezAdmins.forEach((m) => {
    if(m.user) {
      notifyUser.pushNotification(
        m.user.firebaseId, 
        notification, 
        m.notificationInfo, 
        chat.ParticipantType.MezAdmin
      );
    }
  });
  
}
async function notifyDeliveryOperatorsNewOrder(notificationForQueue: AssignDeliveryCompanyNotificationForQueue) {

  let notification: Notification = {
    foreground: <AssignDeliveryCompanyNotification>{
      orderId: notificationForQueue.orderId,
      orderType: notificationForQueue.orderType,
      deliveryCompanyId: notificationForQueue.deliveryCompanyId,
      time: notificationForQueue.timestamp,
      notificationType: NotificationType.NewOrder,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background: {
      en: {
        title:  `New Order`,
        body: `There is a new order`
      },
      es: {
        title: `Nuevo `,
        body: `Hay un nuevo `
      }
    },
    linkUrl: orderUrl(notificationForQueue.orderType, notificationForQueue.orderId)
  }
  let deliveryOperators = await getDeliveryOperators(notificationForQueue.deliveryCompanyId);
  deliveryOperators.forEach((d) => {
    if(d.user) {
      notifyUser.pushNotification(
        d.user.firebaseId, 
        notification, 
        d.notificationInfo, 
        chat.ParticipantType.DeliveryOperator
      );
    }
  });
  
}
async function notifyCallerRecipient(notificationForQueue: chat.CallNotificationForQueue, keys: Keys) {
  let caller = await getChatParticipant(notificationForQueue.callerId);
  let callee = await getChatParticipant(notificationForQueue.calleeId);

  
  // let chatData: chat.ChatData = (await getChat(notificationForQueue.chatId)).chatData;
  // let callerInfo: chat.Participant = chatData.participants[notificationForQueue.callerParticipantType]![notificationForQueue.callerId]
  // let calleeInfo: chat.Participant = chatData.participants[notificationForQueue.calleeParticipantType]![notificationForQueue.calleeId]
  // let calleeToken: string | null = null;

  // let subscription: NotificationInfo = await getNotificationInfo(calleeInfo.particpantType, calleeInfo.id.toString());
  if(callee.notificationInfo) {
    // let language: Language = callee.language;
    let fcmMessage: fcm.fcmPayload = {
      token: callee.notificationInfo.token,
      payload: {
        data: <NewCallBackgroundNotification>{
          linkUrl: chatUrl(notificationForQueue.chatId),
          language: callee.language,
          callerName: caller.name ?? "Caller",
          callerImage: caller.image,
          callerType: caller.participantType,
          notificationType: NotificationType.Call,
          callNotificationType: notificationForQueue.callNotificationType,
        } 
      },
      options: {
        priority: fcm.NotificationPriority.High,
        contentAvailable: true
      }
    };

    if (notificationForQueue.callNotificationType == chat.CallNotificationtType.Incoming) {
      //TODO
      let calleeToken = await createAgoraTokensIfNotPresent(
        notificationForQueue.chatId, 
        caller as chat.ParticipantWithAgora, 
        callee as chat.ParticipantWithAgora, 
        keys
      );
      if (calleeToken == null)
        console.log("Agora token generation error");
      else {
        fcmMessage.payload.data!.agoraToken = calleeToken;
        fcmMessage.payload.data!.calleeuid = callee.id.toString(); //convertFbIdtoInt(callee.id.toString()).toString();
      }
      console.log(notificationForQueue);
    }
    console.log(fcmMessage);    
    fcm.push(fcmMessage);
  }
}


async function notifyOtherMessageParticipants(notificationForQueue: chat.MessageNotificationForQueue) {
  let chatParticipants = await getChatParticipants(notificationForQueue.chatId);
  let sender = chatParticipants.find((p) => {
    return p.id == notificationForQueue.userId
  });
  if(!sender) {
    throw new HttpsError(
      "internal",
      "incorrect sender user id"
    );
  }
  // let chatData: chat.ChatData = (await getChat(notificationForQueue.chatId)).chatData;

  // if (chatData.messages && chatData.messages![notificationForQueue.messageId].notified) {
  //   return
  // }

  // let senderInfo: chat.Participant = chatData.participants[notificationForQueue.participantType]![notificationForQueue.userId]
  // delete chatData.participants[notificationForQueue.participantType];

  chatParticipants.forEach((p) => {
    if(p.participantType != sender?.participantType) {
      let notification: Notification = {
        foreground: <NewMessageNotification>{
          chatId: notificationForQueue.chatId,
          sender,
          message: notificationForQueue.message,
          time: notificationForQueue.timestamp,
          notificationType: NotificationType.NewMessage,
          notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
        },
        background: {
          en: {
            title: `New message from ${sender!.name}`,
            body: notificationForQueue.message
          },
          es: {
            title: `Nueva mensaje de ${sender!.name}`,
            body: notificationForQueue.message
          }
        },
        linkUrl: chatUrl(notificationForQueue.chatId)
      }
      notifyUser.pushNotification(p.firebaseId, notification, p.notificationInfo, p.participantType, p.language);
    }
  })
  

  // for (let participantType in chatData.participants) {
  //   if (participantType in chat.nonNotifiableParticipants)
  //     continue
  //   for (let participantId in chatData.participants[participantType as chat.ParticipantType]) {
  //     let participant = chatData.participants[participantType as chat.ParticipantType]![participantId]

  //     let transformedSenderInfo: chat.Participant = transformSender(senderInfo, chatData.participants, chatData.orderType!, notificationForQueue.participantType, participant.particpantType); //TODO: change this to restaurant or laundry
  //     let notification: Notification = {
  //       foreground: <NewMessageNotification>{
  //         chatId: notificationForQueue.chatId,
  //         sender: transformedSenderInfo,
  //         message: notificationForQueue.message,
  //         orderId: notificationForQueue.orderId ?? null,
  //         time: notificationForQueue.timestamp,
  //         notificationType: NotificationType.NewMessage,
  //         notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
  //         orderType: chatData.orderType
  //       },
  //       background: {
  //         en: {
  //           title: `New message from ${transformedSenderInfo.name}`,
  //           body: notificationForQueue.message
  //         },
  //         es: {
  //           title: `Nueva mensaje de ${transformedSenderInfo.name}`,
  //           body: notificationForQueue.message
  //         }
  //       },
  //       linkUrl: chatUrl(
  //         notificationForQueue.chatId, 
  //         notificationForQueue.orderId,
  //         chatData.orderType, 
  //         notificationForQueue.participantType,
  //         participant.particpantType
  //       )
  //     }
  //     notifyUser.pushNotification(participantId, notification, undefined, participant.particpantType);
  //   }
  // }
  // TODO
  // setChatMessageNotifiedAsTrue(notificationForQueue.chatId, notificationForQueue.messageId);
}

// async function notifyCustomerAboutCounterOffer(notificationForQueue: CounterOfferNotificationForQueue) {
//   // TODO: check to see if customer has an order and counter offer has been notified
//   let notification: Notification = {
//     foreground: <CounterOfferNotification>{
//       driver: notificationForQueue.driver,
//       orderId: notificationForQueue.orderId,
//       customerId: notificationForQueue.customerId,
//       price: notificationForQueue.price,
//       time: notificationForQueue.timestamp,
//       notificationType: NotificationType.NewCounterOffer,
//       notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
//     },
//     background: {
//       en: {
//         title: 'New counter offer',
//         body: `New offer from ${notificationForQueue.driver.name} for ${notificationForQueue.price}`
//       },
//       es: {
//         title: `Nueva contraoferta`,
//         body: `Nueva oferta de ${notificationForQueue.driver.name} para ${notificationForQueue.price}`
//       }
//     },
//     linkUrl: orderUrl( OrderType.Taxi, notificationForQueue.orderId)
//   }
//   notifyUser.pushNotification(notificationForQueue.customerId, notification, chat.ParticipantType.Customer);
// }


async function createAgoraTokensIfNotPresent(chatId: number, caller: chat.ParticipantWithAgora, callee: chat.ParticipantWithAgora, keys: Keys): Promise<string | null> {
  if (keys.agora == null)
    return null
  await setAgoraDetails(chatId, caller.id, keys)
  let calleetoken: string = await setAgoraDetails(chatId, callee.id, keys)
  return calleetoken;
}

async function setAgoraDetails(chatId: number, userId: number, keys: Keys): Promise<string> {
  let expirationTime: number = Math.floor(Date.now() / 1000) + 24 * 60 * 60;
  let token: string = agora.RtcTokenBuilder.buildTokenWithUid(keys.agora!.appId,
    keys.agora!.certificate,
    chatId.toString(),
    userId,
    agora.RtcRole.PUBLISHER,
    0
  );
  await setUserAgoraInfo(chatId, userId, <chat.ParticipantAgoraDetails>{
    token,
    expirationTime: (new Date(expirationTime * 1000)).toISOString(),
  })
  return token;
}

// function convertFbIdtoInt(uid: string): number {
//   let encode = '';
//   for (let i = 0; i < 7; i++) {
//     encode += uid[i].charCodeAt(0)
//   }

//   return parseInt(encode) % (10 ** 7);
// }

// function transformSender(
//   defaultParticipant: chat.Participant,
//   participants: chat.Participants,
//   orderType: OrderType,
//   recipientType: chat.ParticipantType,
//   senderType: chat.ParticipantType,
// ): chat.Participant {

//     let returnParticipant: chat.Participant = defaultParticipant;
//     try {
//       switch (recipientType) {
//         case null:
//           break;
//         case chat.ParticipantType.LaundryOperator: // when receiving message from laundry operator
//           returnParticipant = getServiceProviderFromParticipants(participants, chat.ParticipantType.Laundry)
//           break;
//         case chat.ParticipantType.RestaurantOperator: // when receiving message from restaurant operator
//           returnParticipant = getServiceProviderFromParticipants(participants, chat.ParticipantType.RestaurantOperator)
//           break;
//         case chat.ParticipantType.DeliveryAdmin: // when receiving message from delivery admin operator
//           if (senderType == chat.ParticipantType.Customer) {
//             switch (orderType) {
//               case OrderType.Laundry:
//                 returnParticipant = getServiceProviderFromParticipants(participants, chat.ParticipantType.Laundry)
//                 break;
//               case OrderType.Restaurant:
//                 // THIS PART
//                 returnParticipant = getServiceProviderFromParticipants(participants, chat.ParticipantType.Restaurant)
//                 break;
//             }
//           }
//           break;
//       }
//     } catch (error) {
//       console.log("Could not find ", recipientType, " in participants .. returning returnParticipant!");
//     }
    
//   return returnParticipant
// }

// function getServiceProviderFromParticipants(
//   participants: chat.Participants,
//   participantType: chat.ParticipantType) {
//   return participants[participantType]![Object.keys(participants[participantType]!)[0]]
// }