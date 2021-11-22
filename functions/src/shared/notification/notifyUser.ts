import * as customerNodes from "../databaseNodes/customer";
import * as deliveryAdminNodes from "../databaseNodes/deliveryAdmin";
import * as restaurantNodes from "../databaseNodes/restaurant";
import * as taxiNodes from "../databaseNodes/taxi";
import *  as rootDbNodes from "../databaseNodes/root";
import { ParticipantType } from "../models/Chat";
import { Language, NotificationInfo } from "../models/Generic";
import * as fcm from "../../utilities/senders/fcm";
import { Notification } from "../models/Notification";
import * as foreground from "../../utilities/senders/foreground";


let notificationFunctions: Record<ParticipantType, (para: string) => any> = {
  [ParticipantType.Customer]: customerNodes.notificationInfo,
  [ParticipantType.Restaurant]: restaurantNodes.notificationInfo,
  [ParticipantType.DeliveryAdmin]: deliveryAdminNodes.notificationInfo,
  [ParticipantType.Taxi]: taxiNodes.notificationInfo,
  // [ParticipantType.TaxiAdmin]: , Need To Add
};
notificationFunctions


export async function push(userId: string, notification: Notification, particpantType: ParticipantType = ParticipantType.Customer) {
  foreground.push({
    particpantType: particpantType,
    userId: userId,
    notification: notification.foreground
  });
  let subscription: NotificationInfo;
  subscription = (await notificationFunctions[particpantType](userId).once('value')).val();
  if (subscription != null && subscription.deviceNotificationToken) {
    let language: Language = (await rootDbNodes.userInfo(userId).once('value')).val().language;
    let fcmMessage: fcm.fcmPayload = {
      token: subscription.deviceNotificationToken,
      payload: {
        notification: notification.background[language]
      },
      options: {
        priority: fcm.NotificationPriority.High
      }
    };
    fcm.push(fcmMessage);
  }
}

// function buildNewMessage(userLang: Language, notification: NewMessageNotification): TranslatedNotificaiton {
//   let notificationMessage = notificationMessages[notification.notificationType][userLang];
//   return {
//     title: `${notificationMessage.title}${notification.sender.name}`,
//     body: notification.message
//   }
// }