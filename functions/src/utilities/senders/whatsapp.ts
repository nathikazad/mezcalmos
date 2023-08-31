import { Request, Response } from "firebase-functions/v1";
import * as firebase from "firebase-admin";
import axios from "axios";

export async function handleWhatsapp(req: Request, res: Response): Promise<void> {
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
  resolved: boolean
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
