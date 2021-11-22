import * as firebase from "firebase-admin";
export function deliveryAdmins(adminId?: string) {
  let dbNode: string = `/deliveryAdmins`
  if (adminId != undefined) {
    dbNode += `/${adminId}`
  }
  return firebase.database().ref(dbNode)
}

export function notificationInfo(adminId?: string) {
  firebase.database().ref(`/deliveryAdmins/info/${adminId}/notificationInfo`)
}