import *  as rootDbNodes from "../databaseNodes/root";
import { ParticipantType } from "../models/Chat";
import { Language, NotificationInfo } from "../models/Generic";
import * as fcm from "../../utilities/senders/fcm";
import { Notification } from "../models/Notification";
import * as foreground from "../../utilities/senders/foreground";
import { getUserInfo } from "../controllers/rootController";


export async function push(
  userId: string,
  notification: Notification,
  particpantType: ParticipantType = ParticipantType.Customer,
  fcmThroughApi: boolean = false) {
  foreground.push({
    particpantType: particpantType,
    userId: userId,
    notification: notification.foreground
  });
  let subscription: NotificationInfo;
  subscription = await rootDbNodes.getNotificationInfo(particpantType, userId);
  if (subscription != null && subscription.deviceNotificationToken) {
    let language: Language = (await getUserInfo(userId)).language ?? Language.ES;
    let fcmMessage: fcm.fcmPayload = {
      token: subscription.deviceNotificationToken,
      payload: {
        notification: notification.background[language]
      },
      options: {
        priority: fcm.NotificationPriority.High
      }
    };
    fcm.push(fcmMessage, fcmThroughApi);
  }
}
