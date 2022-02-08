import { ParticipantType } from "../models/Generic/Chat";
import { Language, NotificationInfo } from "../models/Generic/Generic";
import * as fcm from "../../utilities/senders/fcm";
import { Notification } from "../models/Generic/Notification";
import * as foreground from "../../utilities/senders/foreground";
import { getNotificationInfo, getUserInfo } from "../controllers/rootController";


export async function pushNotification(
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
  subscription = await getNotificationInfo(particpantType, userId);
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
