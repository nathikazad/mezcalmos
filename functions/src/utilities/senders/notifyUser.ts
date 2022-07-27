import { ParticipantType } from "../../shared/models/Generic/Chat";
import { Language, NotificationInfo } from "../../shared/models/Generic/Generic";
import * as fcm from "./fcm";
import { Notification } from "../../shared/models/Notification";
import * as foreground from "./foreground";
import { getNotificationInfo, getUserInfo } from "../../shared/controllers/rootController";


export async function pushNotification(
  userId: string,
  notification: Notification,
  particpantType: ParticipantType = ParticipantType.Customer,
  fcmThroughApi: boolean = false) {
  foreground.push({
    particpantType: particpantType,
    userId: userId,
    notification: { ...notification.foreground, linkUrl: notification.linkUrl },
    linkUrl: notification.linkUrl
  });
  let subscription: NotificationInfo;
  subscription = await getNotificationInfo(particpantType, userId);
  if (subscription != null && subscription.deviceNotificationToken) {
    let language: Language = (await getUserInfo(userId)).language ?? Language.ES;
    let fcmMessage: fcm.fcmPayload = {
      token: subscription.deviceNotificationToken,
      payload: {
        notification: notification.background[language],
        data: {
          linkUrl: notification.linkUrl
        }
      },
      options: {
        priority: fcm.NotificationPriority.High,
        contentAvailable: true
      }
    };
    fcm.push(fcmMessage, fcmThroughApi);
  }
}