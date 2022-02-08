import * as fcm from "../../utilities/senders/fcm"
import { DeliveryAdmin } from "../models/DeliveryAdmin";
import * as foreground from "../../utilities/senders/foreground";
import { OrderNotification } from "../models/Generic/Notification";
import { ParticipantType } from "../models/Generic/Chat";


export async function notifyDeliveryAdmins(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  foregroundNotificaiton: OrderNotification,
  fcmNotification: fcm.fcmPayload) {
  let notificationTokens: Array<string> = [];
  for (let adminId in deliveryAdmins) {
    let payload: foreground.fgPayload = {
      particpantType: ParticipantType.DeliveryAdmin,
      userId: adminId,
      notification: foregroundNotificaiton
    }
    foreground.push(payload)
    let admin: DeliveryAdmin = deliveryAdmins[adminId]
    if (admin.notificationInfo?.deviceNotificationToken) {
      notificationTokens.push(admin.notificationInfo.deviceNotificationToken);
    }
  }
  fcmNotification.token = notificationTokens;
  fcm.push(fcmNotification);
}