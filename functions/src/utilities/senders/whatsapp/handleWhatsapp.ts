
import * as firebase from "firebase-admin";
import * as functions from 'firebase-functions';
import axios from "axios";
import { getHasura, getStagingHasura } from "../../hasura";
import { $ } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { DeliveryDriver } from "../../../shared/models/Generic/Delivery";
import { getAllDeliveryDrivers, getDeliveryDriver } from "../../../shared/graphql/delivery/driver/getDeliveryDriver";
import { ForegroundNotification, Notification, NotificationAction, NotificationType } from "../../../shared/models/Notification";
import { ParticipantType } from "../../../shared/models/Generic/Chat";
import { pushNotification } from "../notifyUser";
import { Entry, ImageMessage } from "../../../shared/models/WhatsApp";

export const handleWhatsapp = functions.https.onRequest(async (req, res) => {
  // if (
  //   req.query['hub.verify_token'] !== "jkdawg"
  // )
  //   throw new functions.https.HttpsError('invalid-argument', 'The function must be called with correct token.');

  if (req.query['hub.challenge']) {
    res.send(req.query['hub.challenge']);
    return;
  }

  if (req.body && req.body.entry) {
    await addAndNotify(req.body.entry);
  }
  res.status(200).send(`Success`);




});

export async function addAndNotify(entry: any) {
  let phoneNumber = await addMessageToDatabase(entry);
  if (phoneNumber) {
    let driverId = await getDriverWhoTookOrder(phoneNumber);
    if (driverId) {
      let driver = await getDeliveryDriver(driverId);
      notifyCallback([driver], phoneNumber);
    } else
      await notifyDrivers(phoneNumber);
  }
}

export async function notifyDrivers(phoneNumber: string, excludeDriver?: number) {
  let drivers: DeliveryDriver[] = await getAllDeliveryDrivers();
  drivers = drivers.filter((d) => d.id != excludeDriver)
  notifyCallback(drivers, phoneNumber);
  setTimeout(() => notifyCallback(drivers, phoneNumber), 10000);
}

function notifyCallback(drivers: DeliveryDriver[], phoneNumber: string | null) {
  let notification: Notification = {
    foreground: <ForegroundNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewMessage,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background: {
      en: {
        title: `New messages`,
        body: `Order from ${phoneNumber}`
      },
      es: {
        title: `Nueva mensaje`,
        body: `Pedido de ${phoneNumber}`
      }
    },
    linkUrl: `/convo/${phoneNumber}`
  }
  drivers.forEach((d) => {
    if (!d.user)
      return;
    pushNotification(d.user.firebaseId, notification, d.notificationInfo, ParticipantType.DeliveryDriver, d.user.language);
  });
}

export async function addMessageToDatabase(entries: Entry[]): Promise<string | null> {
  const chain = getHasura();
  const stagingDb = getStagingHasura();
  let phoneNumber = null;
  for (const entry of entries) {
    if (entry.changes) {
      for (const change of entry.changes) {
        if (change.value && change.value.messages) {
          for (const message of change.value.messages) {
            const from = message.from;
            if (message.type === 'image' && message.image) {
              message.image.url = await downloadImage(message.image);
            }
            phoneNumber = '+' + from;
            chain.mutation({
              insert_delivery_messages_one: [{
                object: {
                  entry: $`entry`,
                  phone_number: '+' + from
                }
              }, {
                id: true
              }]
            }, {
              "entry": message
            })
            stagingDb.mutation({
              insert_delivery_messages_one: [{
                object: {
                  entry: $`entry`,
                  phone_number: '+' + from
                }
              }, {
                id: true
              }]
            }, {
              "entry": message
            })
          }
        }
      }
    }
  }
  return phoneNumber;
}

async function getDriverWhoTookOrder(phoneNumber: string): Promise<number | null> {
  const chain = getHasura();
  let messages = await chain.query({
    delivery_messages: [{
      where: {
        _and: [{
          phone_number: {
            _eq: phoneNumber
          }
        }, {
          finished_time: {
            _is_null: true
          }
        }, {
          driver_id: {
            _is_null: false
          }
        }]
      }
    }, {
      driver_id: true
    }]
  });
  if (messages.delivery_messages.length == 0)
    return null;
  else
    return messages.delivery_messages[0].driver_id!;

}

export interface MarkMessagesAsRespondedDetails {
  phoneNumber: string,
}

export interface MarkMessagesAsFinishedDetails {
  phoneNumbers: Array<string>,
}
export interface MarkMessagesResponse {
  success: boolean,
  error?: MarkMessagesError
  unhandledError?: string,
}

export enum MarkMessagesError {
  UnhandledError = "unhandledError",
  InvalidParams = "invalidParams",
  UnauthorizedDriver = "unauthorizedDriver",
  NoMessagesFound = "noMessagesFound"
}


async function downloadImage(imageMessage: ImageMessage): Promise<string> {
  const YOUR_ACCESS_TOKEN = "EAALrwA9IgHoBOy3h0IKGlhwh1oyWW7d055BSHqAVqEo5GEP8NMzu510jhbmYZC08ibie4BMxe7ZBSiMMXKq1d8rtsldUIvBZC490F0L7Pn2ZAh6cedVsgYkEvvDgMnuFRY1lsfZAGsn7hE012nEGbj2G7QdBWQXn7aBZB3lw2zpFPTV6pqMHKcq3kUFYY3qncz3e38Dblhv8PjWqHyZBQEZD";
  const imageUrlInfo = await axios.get(`https://graph.facebook.com/v17.0/${imageMessage.id}/`, {
    headers: { 'Authorization': `Bearer ${YOUR_ACCESS_TOKEN}` }
  });


  const imageUrl = imageUrlInfo.data.url;
  const mimeType = imageUrlInfo.data.mime_type;
  const extension = mimeType.split('/')[1];

  const imageFile = await axios.get(imageUrl, {
    responseType: 'arraybuffer',
    headers: { 'Authorization': `Bearer ${YOUR_ACCESS_TOKEN}` }
  });

  const bucket = firebase.storage().bucket();
  const file = bucket.file(`whatsapp_images/${imageMessage.id}.${extension}`);
  await file.save(imageFile.data);
  await file.makePublic();
  return file.publicUrl();
}