import * as functions from "firebase-functions";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import * as firebase from "firebase-admin";
import { UserRecord } from "firebase-functions/v1/auth";
import * as laundryNodes from "../shared/databaseNodes/services/laundry";
import * as laundryOperatorNodes from "../shared/databaseNodes/operators/operator";
import { OrderType } from "../shared/models/Generic/Order";
import { userInfoNode } from "../shared/databaseNodes/root";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";


export = functions.https.onCall(async (data, context) => {
  let response = await isSignedIn(context.auth)
  if (response != undefined) {
    return {
      ok: false,
      error: response
    }
  }

  response = await checkDeliveryAdmin(context.auth!.uid)
  if (response != undefined) {
    return {
      ok: false,
      error: response
    };
  }


  if (!data.emailIdOrPhoneNumber && !data.laundryName) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "required parameters emailIdOrPhoneNumber and laundryName"
    }
  }

  let user: UserRecord;
  try {
    user = await firebase.auth().getUserByPhoneNumber(data.emailIdOrPhoneNumber);
  } catch (a) {
    console.log("phone number not there");
    let e: any = a;
    if (e.errorInfo.code == "auth/user-not-found") {
      try {
        user = await firebase.auth().getUserByEmail(data.emailIdOrPhoneNumber)
      } catch (a) {
        console.log("email also not there");
        let e: any = a;
        return {
          status: ServerResponseStatus.Error,
          errorMessage: e.errorInfo.message,
        }
      }
    } else {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "User not found",
      }
    }
  }

  let laundryId: string = (await laundryNodes.info().push()).key!;
  let newLaundry = JSON.parse(laundryTemplateInJson);
  newLaundry.info.id = laundryId
  newLaundry.info.name = data.laundryName;
  newLaundry.state.operators[user.uid] = true;
  laundryNodes.info(laundryId).set(newLaundry);

  let operatorInfo = (await userInfoNode(user.uid).once('value')).val();
  let newOperator = { info: operatorInfo, state: { laundryId: laundryId } };
  laundryOperatorNodes.operatorInfo(OrderType.Laundry, user.uid).set(newOperator);


  return { status: ServerResponseStatus.Success }
})


let laundryTemplateInJson = `{
  "details": {
    "averageNumberOfDays": 1,
    "costs": {
      "byType": [
        {
          "cost": 16,
          "id": "RvN3XAfsD8WR",
          "name": {
            "en": "regular wash",
            "es": "lavado normal"
          }
        }
      ],
      "minimumCost": 50
    },
    "schedule": {
      "friday": {
        "from": "8:0",
        "isOpen": true,
        "to": "20:0"
      },
      "monday": {
        "from": "8:0",
        "isOpen": true,
        "to": "20:0"
      },
      "saturday": {
        "from": "8:0",
        "isOpen": true,
        "to": "19:0"
      },
      "sunday": {
        "from": "8:0",
        "isOpen": true,
        "to": "16:0"
      },
      "thursday": {
        "from": "8:0",
        "isOpen": true,
        "to": "20:0"
      },
      "tuesday": {
        "from": "8:0",
        "isOpen": true,
        "to": "20:0"
      },
      "wednesday": {
        "from": "8:0",
        "isOpen": true,
        "to": "20:0"
      }
    }
  },
  "info": {
    "id": null,
    "image": "https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/laundries%2Fyurimar.jpg?alt=media&token=4f5561c0-070d-416b-a1c6-885de0cb42b9",
    "location": {
      "address": "Boulevard Lic. José Murat a un costado del Hotel Yurimar, Puerto Escondido, México, 70934",
      "lat": 15.861492064236634,
      "lng": -97.05935736662569
    },
    "name": data.laundryName,
  },
  "state": {
    "authorizationStatus": "authorized",
    "available": true,
    "operators": {
      [user.uid]: true
    }
  }`;

