import * as firebase from "firebase-admin";
export function deliveryAdmins(adminId?: string) {
  let dbNode: string = `/deliveryAdmins/info`
  if (adminId != undefined) {
    dbNode += `/${adminId}`
  }
  return firebase.database().ref(dbNode)
}