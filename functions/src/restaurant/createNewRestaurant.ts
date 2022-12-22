import { Language, Location, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { NewRestaurantNotification, Restaurant } from "../shared/models/Services/Restaurant/Restaurant";
import { createRestaurant } from "../shared/graphql/restaurant/createRestaurant";
import { getUser } from "../shared/graphql/user/getUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { MezAdmin } from "../shared/models/Generic/User";
import { NotificationType, NotificationAction, Notification } from "../shared/models/Notification";
import { restaurantUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmins";
import { HttpsError } from "firebase-functions/v1/auth";

export interface RestaurantDetails {
  name: string,
  image: string,
  location: Location,
  schedule:JSON,
  restaurantOperatorNotificationToken?: string,
  firebaseId?: string
}

export async function createNewRestaurant(userId: number, restaurantDetails: RestaurantDetails) {
  try {
    let userPromise = getUser(userId);
    let mezAdminsPromise = getMezAdmins();
    let promiseResponse = await Promise.all([userPromise, mezAdminsPromise]);
    let mezAdmins: MezAdmin[] = promiseResponse[1];

    let restaurant: Restaurant = {
      name: restaurantDetails.name,
      image: restaurantDetails.image,
      location: restaurantDetails.location,
      schedule: restaurantDetails.schedule,
      
    
    }
    if(restaurantDetails.firebaseId != undefined) {
      restaurant.firebaseId = restaurantDetails.firebaseId
    }

      await createRestaurant(restaurant, userId, restaurantDetails.restaurantOperatorNotificationToken);
    

    notifyAdmins(mezAdmins, restaurant);

    return { status: ServerResponseStatus.Success };
  } catch(error) {
    console.log("error =>", error);
    throw new HttpsError(
      "unknown",
      "Request was not authenticated.",
      error
    );
  }
};

function notifyAdmins(mezAdmins: MezAdmin[], restaurant: Restaurant) {

  if(restaurant.restaurantId == undefined)
    return
  let notification: Notification = {
    foreground: <NewRestaurantNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      name: restaurant.name,
      image: restaurant.image,
      id: restaurant.restaurantId
    },
    background: {
      [Language.ES]: {
        title: "Nuevo restaurante",
        body: `Hay un nuevo restaurante`
      },
      [Language.EN]: {
        title: "New Restaurant",
        body: `There is a new restaurant`
      }
    },
    linkUrl: restaurantUrl(restaurant.restaurantId)
  }
  mezAdmins.forEach((m) => {
    pushNotification(m.user?.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
  });
}
//TODO
/*
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
      "en": "",
      "es": ""
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
*/