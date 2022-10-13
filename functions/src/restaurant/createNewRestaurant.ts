import * as functions from "firebase-functions";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import * as firebase from "firebase-admin";
import { UserRecord } from "firebase-functions/v1/auth";
import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as operatorNodes from "../shared/databaseNodes/operators/operator";
import { OrderType } from "../shared/models/Generic/Order";
import { userInfoNode } from "../shared/databaseNodes/root";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { UserInfo } from "../shared/models/Generic/User";


export = functions.https.onCall(async (data, context) => {
  let response: ServerResponse | undefined = await isSignedIn(context.auth)
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


  if (!data.emailIdOrPhoneNumber && !data.restaurantName) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "required parameters emailIdOrPhoneNumber and restaurantName"
    }
  }
  let user: UserRecord;
  try {
    user = await firebase.auth().getUserByPhoneNumber(data.emailIdOrPhoneNumber);
  } catch (a) {
    console.log("phone number not there");
    try {
      user = await firebase.auth().getUserByEmail(data.emailIdOrPhoneNumber)
    } catch (a) {
      console.log("email also not there");
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "User not found",
      }
    }
  }

  let operatorInfo: UserInfo = (await userInfoNode(user.uid).once('value')).val();
  if(operatorInfo == null || operatorInfo.name == null)
  return {
    status: ServerResponseStatus.Error,
    errorMessage: "User info not there",
  }

  let restaurantId: string = (await restaurantNodes.info().push()).key!;
  let newRestaurant = JSON.parse(restaurantTemplateInJson);
  newRestaurant.info.id = restaurantId
  newRestaurant.info.name = data.restaurantName;
  newRestaurant.state.operators[user.uid] = true;
  restaurantNodes.info(restaurantId).set(newRestaurant);

  let newOperator = { info: operatorInfo, state: { restaurantId: restaurantId } };
  operatorNodes.operatorInfo(OrderType.Restaurant, user.uid).set(newOperator);
  return { status: ServerResponseStatus.Success }
})


let restaurantTemplateInJson = `{
  "details": {
    "schedule": {
      "friday": {
        "from": "8:00",
        "isOpen": true,
        "to": "20:00"
      },
      "monday": {
        "from": "8:00",
        "isOpen": true,
        "to": "20:00"
      },
      "saturday": {
        "from": "8:00",
        "isOpen": true,
        "to": "19:00"
      },
      "sunday": {
        "from": "8:00",
        "isOpen": true,
        "to": "16:00"
      },
      "thursday": {
        "from": "8:00",
        "isOpen": true,
        "to": "20:00"
      },
      "tuesday": {
        "from": "8:00",
        "isOpen": true,
        "to": "20:00"
      },
      "wednesday": {
        "from": "8:00",
        "isOpen": true,
        "to": "20:00"
      }
    },
    "description":{
      "en": "description",
      "es": "descripcion"
    }
  },
  "info": {
    "id": null,
    "image": "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d",
    "location": {
      "address": "Boulevard Lic. José Murat a un costado del Hotel Yurimar, Puerto Escondido, México, 70934",
      "lat": 15.861492064236634,
      "lng": -97.05935736662569  
    },
    "name": null
  },
  "state": {
    "authorizationStatus": "authorized",
    "available": false,
    "open": false,
    "operators": {}
  }
}`;

