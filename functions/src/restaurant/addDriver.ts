import * as functions from "firebase-functions";
import {
  AuthorizationStatus,
  ServerResponse,
  ServerResponseStatus,
} from "../shared/models/Generic/Generic";
import * as firebase from "firebase-admin";
import { UserRecord } from "firebase-functions/v1/auth";
import {  isSignedIn } from "../shared/helper/authorizer";
import { UserInfo } from "../shared/models/Generic/User";
import { userInfoNode } from "../shared/databaseNodes/root";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";

import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as laundryNodes from "../shared/databaseNodes/services/laundry";
import { State } from "../shared/models/Drivers/DeliveryDriver";
import { OrderType } from "../shared/models/Generic/Order";
export = functions.https.onCall(async (data, context) => {
  let response: ServerResponse | undefined = await isSignedIn(context.auth);
  if (response != undefined) {
    return {
      ok: false,
      error: response,
    };
  }

  if (!data.emailIdOrPhoneNumber || !data.restaurantId || !data.orderType) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "required parameters emailIdOrPhoneNumber and restaurantId and orderType",
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

  let dvInfo: UserInfo = (await userInfoNode(user.uid).once("value")).val();
  if (dvInfo == null || dvInfo.name == null)
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "User info not there",
    };
    let isOperator : boolean  =  (await restaurantNodes.restaurantOperators(data.restaurantId).child(dvInfo.id).get()).exists();
  if (isOperator) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "You can't add an operator as a driver",
    };
  }
 
  let newDvState: State = {
    authorizationStatus: AuthorizationStatus.Authorized,
    isOnline: true,
    serviceProviderType: data.orderType,
    serviceProviderId: data.restaurantId,
  };

  let newDv = {
    info: dvInfo,
    state: newDvState,
  };
  // add to op nodes
  await deliveryDriverNodes.info(dvInfo.id).set(newDv);

  // add to restaurant nodes
  if (data.orderType == OrderType.Restaurant) {
    await restaurantNodes
      .restaurantDrivers(data.restaurantId)
      .child(user.uid)
      .set(true);
  } else if (data.orderType == OrderType.Laundry) {
    await laundryNodes
      .laundryDrivers(data.restaurantId)
      .child(user.uid)
      .set(true);
  }
  return { status: ServerResponseStatus.Success };
});
