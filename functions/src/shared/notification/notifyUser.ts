const notificationMessages = require('./notificationMessages.json')
import * as customerNodes from "../databaseNodes/customer";
import * as deliveryAdminNodes from "../databaseNodes/deliveryAdmin";
import * as restaurantNodes from "../databaseNodes/restaurant";
import * as taxiNodes from "../databaseNodes/taxi";
import *  as rootDbNodes from "../databaseNodes/root";
import { ParticipantType } from "../models/Chat";
import { Language, NotificationInfo } from "../models/Generic";
import * as fcm from "../../utilities/senders/fcm";
import { notificationsNode } from "../databaseNodes/notifications";
import { NewMessageNotification, Notification, NotificationType, OrderStatusChangeNotification } from "../models/Notification";


let notificationFunctions: Record<ParticipantType, (para: string) => any> = {
  [ParticipantType.Customer]: customerNodes.notificationInfo,
  [ParticipantType.Restaurant]: restaurantNodes.notificationInfo,
  [ParticipantType.DeliveryAdmin]: deliveryAdminNodes.notificationInfo,
  [ParticipantType.Taxi]: taxiNodes.notificationInfo,
  // [ParticipantType.TaxiAdmin]: , Need To Add
};
notificationFunctions


export async function push(userId: string, notification: Notification, particpantType: ParticipantType = ParticipantType.Customer) {
  notificationsNode(particpantType, userId).push(notification)
  let subscription: NotificationInfo;

  subscription = (await notificationFunctions[particpantType](userId).once('value')).val();
  if (subscription != null && subscription.deviceNotificationToken) {
    let translatedNotificaiton: TranslatedNotificaiton = await buildDeviceNotificationMessage(userId, notification);
    let fcmMessage: fcm.Message = {
      token: subscription.deviceNotificationToken,
      payload: {
        notification: {
          title: translatedNotificaiton.title,
          body: translatedNotificaiton.body,
          tag: notification.notificationType
        }
      },
      options: {
        priority: fcm.NotificationPriority.High
      }
    };
    fcm.push(fcmMessage);
  }
}

interface TranslatedNotificaiton {
  title: string,
  body: string
}

async function buildDeviceNotificationMessage(userId: string, notification: Notification): Promise<TranslatedNotificaiton> {
  let userLang = (await rootDbNodes.userInfo(userId).once('value')).val().language;
  if (!userLang)
    userLang = "es";
  if (notification.notificationType == NotificationType.OrderStatusChange) {
    return buildOrderStatusMessage(userLang, <OrderStatusChangeNotification>notification)
  } else if (notification.notificationType == NotificationType.NewMessage) {
    return buildNewMessage(userLang, <NewMessageNotification>notification)
  } else {
    throw "Invalid Notification Type";
  }
}

function buildOrderStatusMessage(userLang: Language, notification: OrderStatusChangeNotification): TranslatedNotificaiton {
  return notificationMessages[notification.notificationType][notification.orderType][notification.status][userLang]
}

function buildNewMessage(userLang: Language, notification: NewMessageNotification): TranslatedNotificaiton {
  let notificationMessage = notificationMessages[notification.notificationType][userLang];
  return {
    title: `${notificationMessage.title}${notification.sender.name}`,
    body: notification.message
  }
}