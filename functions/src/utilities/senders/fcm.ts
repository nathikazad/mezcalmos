import axios from "axios";
import { getKeys } from "../../shared/keys";
import * as firebase from "firebase-admin";
import { logger } from "firebase-functions/v1";

let keys = getKeys();

export enum NotificationPriority {
  High = "high",
  Normal = "nomal"
}

export interface fcmNotification {
  title: string,
  body: string,
  tag?: string,
  [key: string]: string | undefined;
}

export interface fcmPayload {
  token: string | string[],
  payload: {
    notification: fcmNotification,
    data?: any
  },
  options: {
    collapseKey?: string,
    priority: NotificationPriority;
  }
}


export async function push(notification: fcmPayload, throughApi: boolean = false) {
  try {
    if (process.env.FUNCTIONS_EMULATOR === "true" ||
      throughApi === true) {
      pushThroughApi(notification);
    } else {
      await firebase.messaging().sendToDevice(notification.token, notification.payload, notification.options)
    }
    // console.log(response);
  } catch (e) {
    logger.error(`Send to devices error `);
  }
}

function pushThroughApi(notification: fcmPayload) {
  let message: any = {
    ...notification.payload,
    ...notification.options
  }
  if (message.collapseKey != null) {
    message.collapse_key = message.collapseKey;
    delete message.collapseKey
  }
  if (Array.isArray(notification.token))
    message.registration_ids = notification.token
  else
    message.to = notification.token
  axios.post(
    "https://fcm.googleapis.com/fcm/send",
    message,
    {
      headers: {
        "Content-Type": "application/json",
        Authorization:
          `key=${keys.fcm.key}`
      }
    }
  ).catch(error => {
    logger.error("FCM push error")
    logger.error(message)
    logger.error(error.response.statusText)
  });
}
