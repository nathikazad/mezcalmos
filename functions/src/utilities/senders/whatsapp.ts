
import * as firebase from "firebase-admin";
import * as functions from 'firebase-functions';
import axios from "axios";
import { getHasura, getStagingHasura } from "../hasura";
import { $ } from "../../../../hasura/library/src/generated/graphql-zeus";
import { DeliveryDriver } from "../../shared/models/Generic/Delivery";
import { getAllDeliveryDrivers } from "../../shared/graphql/delivery/driver/getDeliveryDriver";
import { ForegroundNotification, Notification, NotificationAction, NotificationType } from "../../shared/models/Notification";
import { ParticipantType } from "../../shared/models/Generic/Chat";
import { pushNotification } from "./notifyUser";
import { Entry, ImageMessage } from "../../shared/models/WhatsApp";
import { MezError } from "../../shared/models/Generic/Generic";

export const handleWhatsapp = functions.https.onRequest(async (req, res) => {
  // if (
  //   req.query['hub.verify_token'] !== "jkdawg"
  // )
  //   throw new functions.https.HttpsError('invalid-argument', 'The function must be called with correct token.');
  
  if (req.query['hub.challenge']) {
    res.send(req.query['hub.challenge']);
    return;
  }
  console.log("here1");
  
  if (req.body && req.body.entry) {
    await addAndNotify(req.body.entry);
    // setTimeout(() => notifyDrivers(drivers), 20000);
  }
  res.status(200).send(`Success`);




});

export async function addAndNotify(entry:any) {
  let phoneNumber = await addMessageToDatabase(entry);
  if (phoneNumber) {
    let drivers: DeliveryDriver[] = await getAllDeliveryDrivers();
    notifyDrivers(drivers, phoneNumber);
    setTimeout(() => notifyDrivers(drivers, phoneNumber), 10000);
  }

  function notifyDrivers(drivers: DeliveryDriver[], phoneNumber: string | null) {
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
      if (!d.user || d.notificationInfo?.turnOffNotifications == true)
        return;
      pushNotification(d.user.firebaseId, notification, d.notificationInfo, ParticipantType.DeliveryDriver, d.user.language);
    });
  }
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

export async function markMessagesAsResponded(uid: number, data: MarkMessagesAsRespondedDetails): Promise<MarkMessagesResponse> {
  try {
    const phoneNumber = data.phoneNumber;
    if (!phoneNumber) {
      throw new MezError(MarkMessagesError.InvalidParams);
    }

    const chain = getHasura();
    const driverId: number = await getDriverId(uid);

    // get all messages that match phone number and do not have responded time
    const response = await chain.query({
      delivery_messages: [{
        where:
        {
          _and: [{
            phone_number: {
              _eq: phoneNumber
            },
            responded_time: {
              _is_null: true
            }
          }]
        }
      }, {
        entry: [{}, true],
        id: true
      }]
    });


    type SetInput = {
      driver_id?: number;
      responded_time?: Date;
    };
    if (response.delivery_messages.length > 0) {
      // mark all messages as responded and only the last message with driver_id
      let mutationResponse = await chain.mutation({
        update_delivery_messages_many: [{
          updates: response.delivery_messages.map((msg, index) => {
            let setObject: SetInput = {
              responded_time: new Date()
            };

            if (index === response.delivery_messages.length - 1) {
              setObject.driver_id = driverId;
            }

            return {
              where: {
                id: { _eq: msg.id }
              },
              _set: setObject
            };
          })
        }, {
          affected_rows: true
        }]
      });

      if (mutationResponse.update_delivery_messages_many?.length ?? 0 > 0)
        return { success: true };
      else
        throw new MezError(MarkMessagesError.NoMessagesFound);
    } else {
      throw new MezError(MarkMessagesError.NoMessagesFound);
    }

  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(MarkMessagesError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: MarkMessagesError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }

  }
}


export async function markMessagesAsFinished(uid: number, data: MarkMessagesAsFinishedDetails): Promise<MarkMessagesResponse> {
  try {
    const chain = getHasura();
    if (!data.phoneNumbers) {
      throw new MezError(MarkMessagesError.InvalidParams);
    }
    const response = await chain.query({
      delivery_messages: [{
        where:
        {
          _and: [{
            phone_number: {
              _in: data.phoneNumbers
            },
            _or: [{
              finished_time: {
                _is_null: true
              }
            },
            {
              responded_time: {
                _is_null: true
              }
            }]
          }]
        }
      }, {
        entry: [{}, true],
        responded_time: true,
        id: true
      }]
    });


    type SetInput = {
      responded_time?: Date;
      finished_time?: Date;
    };
    if (response.delivery_messages.length > 0) {
      let mutationResponse = await chain.mutation({
        update_delivery_messages_many: [{
          updates: response.delivery_messages.map((msg, index) => {
            let setObject: SetInput = {
              finished_time: new Date()
            };

            if (msg.responded_time == null) {
              msg.responded_time = new Date();
            }

            return {
              where: {
                id: { _eq: msg.id }
              },
              _set: setObject
            };
          })
        }, {
          affected_rows: true
        }]
      });

      if (mutationResponse.update_delivery_messages_many?.length ?? 0 > 0)
        return { success: true };
      else
        throw new MezError(MarkMessagesError.NoMessagesFound);
    } else {
      throw new MezError(MarkMessagesError.NoMessagesFound);
    }

  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(MarkMessagesError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: MarkMessagesError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }

  }
}

async function getDriverId(uid: number) {
  const chain = getHasura();
  const response = await chain.query({
    delivery_driver: [{
      where: {
        user_id: {
          _eq: uid
        }
      }
    }, {
      id: true
    }]
  });

  if (response.delivery_driver.length < 1) {
    throw new MezError(MarkMessagesError.UnauthorizedDriver);
  }
  const driverId: number = response.delivery_driver[0].id;
  return driverId;
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