import *  as rootDbNodes from "../databaseNodes/root";
import { ParticipantType } from "../models/Chat";
import { Language, NotificationInfo } from "../models/Generic";
import * as fcm from "../../utilities/senders/fcm";
import { Notification } from "../models/Notification";
import * as foreground from "../../utilities/senders/foreground";
import { getUserInfo } from "../rootController";


export async function push(userId: string, notification: Notification, particpantType: ParticipantType = ParticipantType.Customer) {
  foreground.push({
    particpantType: particpantType,
    userId: userId,
    notification: notification.foreground
  });
  let subscription: NotificationInfo;
  subscription = await rootDbNodes.getNotificationInfo(particpantType, userId);
  if (subscription != null && subscription.deviceNotificationToken) {
    let language: Language = (await getUserInfo(userId)).language!;
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