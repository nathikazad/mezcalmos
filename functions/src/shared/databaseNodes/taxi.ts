import * as firebase from "firebase-admin";

export function notificationInfo(taxiId?: string) {
  firebase.database().ref(`/taxis/info/${taxiId}/notificationInfo`)
}