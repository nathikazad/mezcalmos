import * as firebase from "firebase-admin";
import { ParticipantType } from "../models/Chat";
export function notificationsNode(particpantType: ParticipantType, userId: string) {
  return firebase.database().ref(`/notifications/${particpantType}/${userId}`)
}