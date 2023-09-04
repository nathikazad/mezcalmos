
import * as firebase from "firebase-admin";
import * as functions from 'firebase-functions';
import axios from "axios";
import { getHasura } from "../hasura";
import { $ } from "../../../../hasura/library/src/generated/graphql-zeus";
import { DeliveryDriver } from "../../shared/models/Generic/Delivery";
import { getAllDeliveryDrivers } from "../../shared/graphql/delivery/driver/getDeliveryDriver";
import { ForegroundNotification, Notification, NotificationAction, NotificationType } from "../../shared/models/Notification";
import { ParticipantType } from "../../shared/models/Generic/Chat";
import { pushNotification } from "./notifyUser";
import { Entry, ImageMessage, Message } from "../../shared/models/WhatsApp";

export const handleWhatsapp = functions.https.onRequest(async (req, res) => {
  // if (
  //   req.query['hub.verify_token'] !== "jkdawg"
  // ) 
  //  throw new functions.https.HttpsError('invalid-toke ', 'The function must be called with correct token.');
  // 
  // const db = firebase.database();

  const chain = getHasura();

  if (req.body && req.body.entry) {
    const entries: Entry[] = req.body.entry;
    for (const entry of entries) {
      if (entry.changes) {
        for (const change of entry.changes) {
          if (change.value && change.value.messages) {
            for (const message of change.value.messages) {
              const from = message.from;
              if (message.type === 'image' && message.image) {
                message.image.url = await downloadImage(message.image);
              }
              
              // const ref = db.ref(`/whatsappCallback/${from}`);
              message.resolved = false;

              chain.mutation({
                insert_delivery_messages_one: [{
                  object: {
                    entry: $`entry`,
                    phone_number: from
                  }
                }, {
                  id: true
                }]
              }, {
                "entry": message
              })

              // ref.push(message);
            }
          }
        }
      }
    }
    // notify drivers
    let drivers: DeliveryDriver[] = await getAllDeliveryDrivers();
    let notification: Notification = {
      foreground: <ForegroundNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewMessage,
        notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
      },
      background: {
        en: {
          title: `New messages`,
          body: ""
        },
        es: {
          title: `Nueva mensaje`,
          body: ""
        }
      },
      linkUrl: `/`
    }
    notifyDrivers(drivers, notification);
    setTimeout( () => notifyDrivers(drivers, notification), 10000);
    setTimeout( () => notifyDrivers(drivers, notification), 20000);
  }
  if (req.query['hub.challenge'])
    res.send(req.query['hub.challenge']);
  else
    res.send("puuta madre");

  function notifyDrivers(drivers: DeliveryDriver[], notification: Notification) {
    drivers.forEach((d) => {
      if (!d.user)
        return;
      pushNotification(d.user.firebaseId, notification, d.notificationInfo, ParticipantType.DeliveryDriver, d.user.language);
    });
  }
});

export const markMessagesAsResolved = functions.https.onCall(async (data, context) => {
  const phoneNumber = data.phoneNumber; 
  const driverId = data.driverId; 

  if (!phoneNumber) {
    throw new functions.https.HttpsError('invalid-argument', 'The function must be called with a phone number.');
  }

  if (!driverId) {
    throw new functions.https.HttpsError('invalid-argument', 'The function must be called with a driverId.');
  }

  const chain = getHasura();

  const response = await chain.query({
    delivery_messages: [{
      where: {
        phone_number: {
          _eq: phoneNumber
        }
      }
    }, {
      entry: [{}, true]
    }]
  })

  if(response.delivery_messages.length > 0) {
    let entries: Message[] = [];
    let updates: any = [];
    response.delivery_messages.forEach((e) => {
      let entry: Message = e.entry;
      entry.resolved = true;
      updates.push({
        where: {
          phone_number: phoneNumber
        },
        _set: {
          entry: entry,
          driver_id: driverId
        }
      })
      entries.push(e.entry)
    })
    chain.mutation({
      update_delivery_messages_many: [{
        updates: updates
      }, {
        affected_rows: true
      }]
    })

  // const db = firebase.database();
  // const ref = db.ref(`/whatsappCallback/${phoneNumber}/messages`);

  // const snapshot = await ref.once('value');

  // if (snapshot.exists()) {
  //   const messages: { [key: string]: Message } = snapshot.val();

  //   for (const messageId in messages) {
  //     if (Object.hasOwnProperty.call(messages, messageId)) {
  //       messages[messageId].resolved = true;
  //       messages[messageId].driverId = driverId;
  //     }
  //   }

  //   await ref.set(messages);
    return { status: 'success', message: `All messages for ${phoneNumber} marked as resolved.` };
  } else {
    return { status: 'failure', message: `No messages found for phone number ${phoneNumber}` };
  }
});

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