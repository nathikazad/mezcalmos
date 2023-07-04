import { ParticipantType } from "../../shared/models/Generic/Chat";
import { Language, NotificationInfo } from "../../shared/models/Generic/Generic";
import * as fcm from "./fcm";
import { Notification } from "../../shared/models/Notification";
import * as foreground from "./foreground";


export async function pushNotification(
  firebaseUserId: string,
  notification: Notification,
  notificationInfo?: NotificationInfo | null,
  participantType: ParticipantType = ParticipantType.Customer,
  language: Language = Language.ES,
  notifyForeground: boolean = true,
  fcmThroughApi: boolean = false,
) {
  if(notifyForeground) {
    foreground.push({
      participantType,
      firebaseUserId,
      notification: { ...notification.foreground, linkUrl: notification.linkUrl },
      linkUrl: notification.linkUrl
    });
  }
  if(notificationInfo == null) {
    return;
  }
  let fcmMessage: fcm.fcmPayload = {
    token: notificationInfo.token,
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
  if (process.env.FUNCTIONS_EMULATOR === "true") {
    console.log("sending notification for: ", firebaseUserId)
    console.log("message: ", fcmMessage)

  } else {
    fcm.push(fcmMessage, fcmThroughApi);

  }
  
}