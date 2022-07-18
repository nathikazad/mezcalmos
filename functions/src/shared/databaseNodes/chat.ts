import * as firebase from "firebase-admin";
import { ParticipantType } from "../models/Generic/Chat";

export function chatNode(chatId?: string) {
  let address = `/chat`;
  if (chatId != null)
    address += `/${chatId}`
  return firebase.database().ref(address);
}

export function chatMessageNotifiedNode(chatId: string, messageId: string) {
  return firebase.database().ref(`chat/${chatId}/messages/${messageId}/notified`);
}

export function participantAgoraNode(chatId: string, participantType: ParticipantType, userId: string) {
  return chatNode(chatId).child("participants").child(participantType).child(userId).child('agora');
}