import * as functions from "firebase-functions";
import {
  ServerResponseStatus,
} from "../shared/models/Generic/Generic";

// import { isSignedIn } from "../shared/helper/authorizer";
import { UserInfo } from "../shared/models/Generic/User";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";

import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
export = functions.https.onCall(async (data, context) => {

  if (!data.driverId || !data.restaurantId) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage:
        "required parameters driverId and restaurantId and orderType",
    };
  }

  let dvInfo: UserInfo = (
    await deliveryDriverNodes.info(data.driverId).child("info").once("value")
  ).val();
  if (dvInfo == null)
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Sorry Driver not there",
    };

  // remove
  await deliveryDriverNodes.info(dvInfo.id.toString()).remove();

  // add to restaurant nodes
  await restaurantNodes
    .restaurantDrivers(data.restaurantId)
    .child(dvInfo.id.toString())
    .remove();
  return { status: ServerResponseStatus.Success };
});
