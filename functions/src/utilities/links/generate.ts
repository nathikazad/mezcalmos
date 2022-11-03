import * as functions from "firebase-functions";
import {
    ServerResponse,
    ServerResponseStatus,
} from "../../shared/models/Generic/Generic";

// import * as firebase from "firebase-admin";
import { isSignedIn } from "../../shared/helper/authorizer";
import { operatorInfo } from "../../shared/databaseNodes/operators/operator";
import { OrderType } from "../../shared/models/Generic/Order";
import { generateDeepLink } from "./deeplink";
import { generateQr } from "./qr";
import { serviceProviderDetails } from "../../shared/databaseNodes/services/serviceProvider";
import * as restaurantNodes from "../../shared/databaseNodes/services/restaurant";


export const generateLink = functions.https.onCall(async (data, context) => {

    let response: ServerResponse | undefined = await isSignedIn(context.auth);
    if (response != undefined) {
      return {
        ok: false,
        error: response,
      };
    }
  
    if (!data.providerId || !data.providerType) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage:
          "required parameters providerId and providerType.",
      };
    }
    // check if the operator is assigned to that restaurant and authorized.
    // to replace with checkRestaurantOperator
    const pTypeAsOrderType : OrderType = (data.providerType as string).toLowerCase() as OrderType;

    const operatorRestaurantId = (await operatorInfo(pTypeAsOrderType , context.auth?.uid).child('state/restaurantId').once('value')).val();
    if (!operatorRestaurantId || operatorRestaurantId != data.providerId) {
        return {
            status: ServerResponseStatus.Error,
            errorMessage:
              `Unauthorized operator! => operatorRestaurantId:${operatorRestaurantId}`,
          };
    }
    // check if the deepLink is already there in db.
    const restaurantDetailsNode = serviceProviderDetails(pTypeAsOrderType, data.providerId);
    let restaurantLink:string|null = (await restaurantDetailsNode.child('link').once('value')).val();
    if (!restaurantLink) {

        // restaurant does not have a link yet.
        const link : string | null = await generateDeepLink(data.providerType, data.providerId);
        if (!link) {
            return {
                status: ServerResponseStatus.Error,
                errorMessage:
                  "Failed generating your link, try later!",
              };
        }
        restaurantLink = link;
        // we write it to the details node :
        try {
            restaurantNodes.info(data.providerId).child('details').child('link').set(link);
        } catch (error) {
            functions.logger.error(`Link Error ==> ${error}`);
        }

    }
    // check if Qr code os already there set in the db if not generate it
    let restaurantQr : string|null = (await restaurantDetailsNode.child('qr').once('value')).val();
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
        // we write it to the details node :
        try {
            restaurantNodes.info(data.providerId).child('details').child('qr').set(qr);
        } catch (error) {
            functions.logger.error(`QR Error ==> ${error}`);
        }

    }
     
    return {
        status: ServerResponseStatus.Success,
        results : {
            "qr"    : restaurantQr,
            "link"  : restaurantLink
        }
        // errorMessage:
        //   "Failed generating your link, try later!",
      };

}); 





