import * as firebase from "firebase-admin";

export function chatNode(orderId?: string) {
  let address = `/chat`;
  if (orderId != null)
    address += `/${orderId}`
  return firebase.database().ref(address);
}

export function chatMessageNotifiedNode(chatId: string, messageId: string) {
  return firebase.database().ref(`chat/${chatId}/messages/${messageId}/notified`);
}