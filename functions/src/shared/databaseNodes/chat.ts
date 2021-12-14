import * as firebase from "firebase-admin";

export function chatNode(orderId: string) {
  return firebase.database().ref(`/chat/${orderId}`);
}

export function chatMessageNotifiedNode(orderId: string, messageId: string) {
  return firebase.database().ref(`chat/${orderId}/messages/${messageId}/notified`);
}