import * as firebase from "firebase-admin";
import { OrderType } from "../../models/Generic/Order";

export function operatorInfo(orderType: OrderType, operatorId?: string) {
  let dbNode: string = `operators/${orderType}/info`
  if (operatorId != undefined) {
    dbNode += `/${operatorId}`
  }
  return firebase.database().ref(dbNode);

}