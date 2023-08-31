
import * as firebase from "firebase-admin";
import * as functions from 'firebase-functions';
import axios from "axios";

export const handleWhatsapp = functions.https.onRequest(async (req, res) => {
  // if (
  //   req.query['hub.verify_token'] !== "jkdawg"
  // ) 
  //  throw new functions.https.HttpsError('invalid-toke ', 'The function must be called with correct token.');
  // 
  const db = firebase.database();
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
              const ref = db.ref(`/whatsappCallback/${from}`);
              message.resolved = false
              ref.push(message);
            }
          }
        }
      }
    }
  }
  if (req.query['hub.challenge'])
    res.send(req.query['hub.challenge']);
  else
    res.send("puuta madre");
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

  const db = firebase.database();
  const ref = db.ref(`/whatsappCallback/${phoneNumber}/messages`);

  const snapshot = await ref.once('value');

  if (snapshot.exists()) {
    const messages: { [key: string]: Message } = snapshot.val();

    for (const messageId in messages) {
      if (Object.hasOwnProperty.call(messages, messageId)) {
        messages[messageId].resolved = true;
        messages[messageId].driverId = driverId;
      }
    }

    await ref.set(messages);
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


interface TextMessage {
  body: string;
}

interface LocationMessage {
  latitude: number;
  longitude: number;
}

interface ImageMessage {
  id: string;
  url: string;
  mime_type: string;
  sha256: string;
  caption?: string;
}

interface Message {
  from: string;
  id: string;
  type: string;
  timestamp: string;
  text?: TextMessage;
  location?: LocationMessage;
  image?: ImageMessage;
  resolved?: boolean;
  driverId?:number
}

interface Profile {
  name: string;
}

interface Contact {
  profile: Profile;
  wa_id: string;
}

interface ChangeValue {
  contacts: Contact[];
  messages: Message[];
  messaging_product: string;
  metadata: {
    display_phone_number: string;
    phone_number_id: string;
  };
}

interface Change {
  field: string;
  value: ChangeValue;
}

interface Entry {
  changes: Change[];
  id: string;
}
