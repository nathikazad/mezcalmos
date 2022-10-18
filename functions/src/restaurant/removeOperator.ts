import * as functions from "firebase-functions";
import {
    ServerResponse,
  ServerResponseStatus,
} from "../shared/models/Generic/Generic";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
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

    if (!data.operatorId && !data.restaurantId) {
        return {
            status: ServerResponseStatus.Error,
            errorMessage:
                "required parameters operatorId and restaurantId",
        };
    }
    // let user: UserRecord;
    // try {
    //     user = await firebase
    //         .auth()
    //         .getUserByPhoneNumber(data.emailIdOrPhoneNumber);
    // } catch (a) {
    //     console.log("phone number not there");
    //     try {
    //         user = await firebase.auth().getUserByEmail(data.emailIdOrPhoneNumber);
    //     } catch (a) {
    //         console.log("email also not there");
    //         return {
    //             status: ServerResponseStatus.Error,
    //             errorMessage: "User not found",
    //         };
    //     }
    // }

    // let opInfo: UserInfo = (
    //     await userInfoNode(user.uid).once("value")
    // ).val();
    // if (opInfo == null || opInfo.name == null)
    //     return {
    //         status: ServerResponseStatus.Error,
    //         errorMessage: "User info not there",
    //     };

    let opExist  =   (await (await operatorNodes.operatorInfo(OrderType.Restaurant, data.operatorId).get()));
    if (opExist == null || opExist.val == null) {

      return {
            status: ServerResponseStatus.Error,
            errorMessage: "Operator not there",
        };
}

 
  // remove to op nodes
  operatorNodes.operatorInfo(OrderType.Restaurant, data.operatorId).remove();
  
 // remove restaurant nodes
    await restaurantNodes.restaurantOperators(data.restaurantId).child(data.operatorId).remove(); 
  return { status: ServerResponseStatus.Success };
});
