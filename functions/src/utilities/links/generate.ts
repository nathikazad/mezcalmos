import * as functions from "firebase-functions";
import {
    ServerResponse,
    ServerResponseStatus,
} from "../../shared/models/Generic/Generic";

// import * as firebase from "firebase-admin";
import { isSignedIn } from "../../shared/helper/authorizer";
import { operatorInfo } from "../../shared/databaseNodes/operators/operator";
import { OrderType } from "../../shared/models/Generic/Order";
import { info } from "../../shared/databaseNodes/services/restaurant";
import { generateDeepLink } from "./deeplink";
import { generateQr } from "./qr";


export const generateLink = functions.https.onCall(async (data, context) => {

    let response: ServerResponse | undefined = await isSignedIn(context.auth);
    if (response != undefined) {
      return {
        ok: false,
        error: response,
      };
    }
  
    if (!data.restaurantId || !data.providerType) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage:
          "required parameters restaurantId and providerType.",
      };
    }
    // check if the operator is assigned to that restaurant and authorized.
    const operatorRestaurantId = (await operatorInfo(data.providerType as OrderType, context.auth?.uid).child('state/restaurantId').once('value')).val();
    if (!operatorRestaurantId || operatorRestaurantId != data.restaurantId) {
        return {
            status: ServerResponseStatus.Error,
            errorMessage:
              "Unauthorized operator!",
          };
    }
    // check if the deepLink is already there in db.
    const restaurantInfoNode = info(data.providerId);
    let restaurantLink:string|null = (await restaurantInfoNode.child('link').once('value')).val();
    if (!restaurantLink) {

        // restaurant does not have a link yet.
        const link : string | null = await generateDeepLink(data.providerType, data.restaurantId);
        if (!link) {
            return {
                status: ServerResponseStatus.Error,
                errorMessage:
                  "Failed generating your link, try later!",
              };
        }
        restaurantLink = link;
        // we write it to the info node :
        await restaurantInfoNode.set({
            "link": link,
        });

    }
    // check if Qr code os already there set in the db if not generate it
    let restaurantQr : string|null = (await restaurantInfoNode.child('qr').once('value')).val();
    if (!restaurantQr) {
        // restaurant does not have a QR yet.
        const qr : string | null = await generateQr(restaurantLink);
        if (!qr) {
            return {
                status: ServerResponseStatus.Error,
                errorMessage:
                  "Failed generating your link, try later!",
              };
        }
        restaurantQr = qr;
        // we write it to the info node :
        await restaurantInfoNode.set({
            "qr": qr 
        });
    }
     
    return {
        status: ServerResponseStatus.Success,
        errorMessage : {
            "qr"    : restaurantQr,
            "link"  : restaurantLink
        }
        // errorMessage:
        //   "Failed generating your link, try later!",
      };

}); 





