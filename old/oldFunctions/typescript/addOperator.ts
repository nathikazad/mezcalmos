import * as functions from "firebase-functions";
import {
    ServerResponse,
  ServerResponseStatus,
} from "../shared/models/Generic/Generic";
import * as firebase from "firebase-admin";
import { UserRecord } from "firebase-functions/v1/auth";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { UserInfo } from "../shared/models/Generic/User";
import { userInfoNode } from "../shared/databaseNodes/root";
import { OrderType } from "../shared/models/Generic/Order";

import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as operatorNodes from "../shared/databaseNodes/operators/operator";
export = functions.https.onCall(async (data, context) => {
  let response: ServerResponse | undefined = await isSignedIn(context.auth);
  if (response != undefined) {
    return {
      ok: false,
      error: response,
    };
  }

  response = await checkDeliveryAdmin(context.auth!.uid);
  if (response != undefined) {
    return {
      ok: false,
      error: response,
    };
  }

  if (!data.emailIdOrPhoneNumber && !data.restaurantId) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage:
        "required parameters emailIdOrPhoneNumber and restaurantId",
    };
  }
  let user: UserRecord;
  try {
    user = await firebase
      .auth()
      .getUserByPhoneNumber(data.emailIdOrPhoneNumber);
  } catch (a) {
    console.log("phone number not there");
    try {
      user = await firebase.auth().getUserByEmail(data.emailIdOrPhoneNumber);
    } catch (a) {
      console.log("email also not there");
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "User not found",
      };
    }
  }

  let opInfo: UserInfo = (
    await userInfoNode(user.uid).once("value")
  ).val();
  if (opInfo == null || opInfo.name == null)
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "User info not there",
    };

  // remove from old restaurant //

let oldRestuarntId : string = await  (await operatorNodes.operatorInfo(OrderType.Restaurant, opInfo.id).child("state").child("restaurantId").get()).val();
  
  if (oldRestuarntId != null) {
    restaurantNodes.restaurantOperators(oldRestuarntId).child(opInfo.id).remove();
  }
 
  let newOp = {
    info: opInfo,
    state: { restaurantId: data.restaurantId },
  };
  // add to op nodes
  operatorNodes.operatorInfo(OrderType.Restaurant, user.uid).set(newOp);
  
 // add to restaurant nodes
    await restaurantNodes.restaurantOperators(data.restaurantId).child(user.uid).set(true); 
  return { status: ServerResponseStatus.Success };
});
