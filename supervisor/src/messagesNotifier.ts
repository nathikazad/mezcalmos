import * as chatModule from "../../functions/src/shared/models/Generic/Chat";
// import { getChat, setChatMessageNotifiedAsTrue, setUserAgoraInfo } from "../../functions/src/shared/controllers/chatController";
import * as notifyUser from "../../functions/src/utilities/senders/notifyUser";
import { chatUrl, orderUrl, restaurantUrl } from "../../functions/src/utilities/senders/appRoutes";
import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { NewMessageNotification, Notification, NotificationAction, NotificationType, NotificationForQueue, AuthorizeOperatorNotification } from "../../functions/src/shared/models/Notification";
// import { CounterOfferNotificationForQueue } from "../../functions/src/shared/models/Services/Taxi/TaxiOrder";
import { notifyCallerOfEndCall } from "../../functions/src/utilities/agora";

import { Keys } from "../../functions/src/shared/models/Generic/Keys";
import { 
  AuthorizeOperatorNotificationForQueue, 
  NewRestaurantNotification, 
  NewRestaurantNotificationForQueue,
  OperatorApprovedNotificationForQueue, 
  RestaurantOperatorApprovedNotification
} from "../../functions/src/shared/models/Services/Restaurant/Restaurant";
import { getRestaurantOperator, getRestaurantOperators } from "../../functions/src/shared/graphql/restaurant/operators/getRestaurantOperators"
import { getMezAdmins } from "../../functions/src/shared/graphql/user/mezAdmin/getMezAdmin"
import { getDeliveryOperators } from "../../functions/src/shared/graphql/delivery/operator/getDeliveryOperator"
import { AssignDeliveryCompanyNotificationForQueue, AssignDeliveryCompanyNotification } from "../../functions/src/shared/models/Generic/Delivery";
import { getChat } from "../../functions/src/shared/graphql/chat/getChat"

import { HttpsError } from "firebase-functions/v1/auth";

export function startWatchingMessageNotificationQueue(keys: Keys) {
  console.log("starting watching message notifications")
  rootNodes.notificationsQueueNode().on('child_added', function (snap) {
    let notification: NotificationForQueue = snap.val();
    console.log(`Notification type ${notification.notificationType}`)
    switch (notification.notificationType) {
      case NotificationType.NewMessage:
        notifyOtherMessageParticipants(notification as chatModule.MessageNotificationForQueue);
        break;
      case NotificationType.Call:
        endCall(notification as chatModule.CallNotificationForQueue)
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

async function endCall(callNotificationForQueue:chatModule.CallNotificationForQueue) {
  notifyCallerOfEndCall(callNotificationForQueue.chatId, callNotificationForQueue)
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
      chatModule.ParticipantType.RestaurantOperator,
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
        chatModule.ParticipantType.RestaurantOperator,
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
      notifyUser.pushNotification(
        m.firebaseId, 
        notification, 
        m.notificationInfo, 
        chatModule.ParticipantType.MezAdmin
      );
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
        chatModule.ParticipantType.DeliveryOperator
      );
    }
  });
  
}


async function notifyOtherMessageParticipants(notificationForQueue: chatModule.MessageNotificationForQueue) {
  let chat = await getChat(notificationForQueue.chatId);
  let sender = chat.participants.find((p) =>  
    (p.id == notificationForQueue.userId) && (p.participantType == notificationForQueue.participantType)
  );
  if(!sender) {
    throw new HttpsError(
      "internal",
      "incorrect sender user id"
    );
  }

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
  if(notificationForQueue.chatType == chatModule.ChatType.Direct) {
    chat.participants.forEach((p) => {
      if(p.id != notificationForQueue.userId) {
        notifyUser.pushNotification(p.firebaseId, notification, p.notificationInfo, p.participantType, p.language);
      }
    })
  } else {
    chat.participants.forEach((p) => {
      if(p.participantType != sender?.participantType) {
        notifyUser.pushNotification(p.firebaseId, notification, p.notificationInfo, p.participantType, p.language);
      }
    })
  }
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