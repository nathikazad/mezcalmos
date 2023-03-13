import { Language, Location } from "../shared/models/Generic/Generic";
import { HttpsError } from "firebase-functions/v1/auth";
// import * as operatorNodes from "../shared/databaseNodes/operators/operator";
// import { OrderType } from "../shared/models/Generic/Order";
import { MezAdmin } from "../shared/models/Generic/User";
import { DeliveryDetails } from "../shared/models/Generic/Delivery";
import { getUser } from "../shared/graphql/user/getUser";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ServiceProvider } from "../shared/models/Services/Service";
import { createLaundryStore } from "../shared/graphql/laundry/createLaundry";
import { NewLaundryNotification } from "../shared/models/Services/Laundry/Laundry";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { laundryUrl } from "../utilities/senders/appRoutes";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface LaundryDetails {
  name: string,
  image: string,
  location: Location,
  schedule:JSON,
  laundryOperatorNotificationToken?: string,
  firebaseId?: string,
  deliveryPartnerId?: number,
  deliveryDetails: DeliveryDetails,
  language: Record<Language, boolean>,
  uniqueId?: string
}

export async function createLaundry(userId: number, laundryDetails: LaundryDetails) {

  if(laundryDetails.deliveryDetails.deliveryAvailable) {
    if(laundryDetails.deliveryDetails.selfDelivery && !(laundryDetails.deliveryDetails.radius)) {
      throw new HttpsError(
        "unknown",
        "laundry delivery radius or cost is not set for self delivery"
      );
    } else if(!(laundryDetails.deliveryDetails.selfDelivery) && !(laundryDetails.deliveryPartnerId)) {
      throw new HttpsError(
        "unknown",
        "delivery partner not specified"
      );
    }
  }

  let userPromise = getUser(userId);
  let mezAdminsPromise = getMezAdmins();
  let promiseResponse = await Promise.all([userPromise, mezAdminsPromise]);
  let mezAdmins: MezAdmin[] = promiseResponse[1];

  // let laundryStore: ServiceProvider = {
  //   name: laundryDetails.name,
  //   image: laundryDetails.image,
  //   location: laundryDetails.location,
  //   schedule: laundryDetails.schedule,
  //   selfDelivery: laundryDetails.selfDelivery ?? false,
  //   customerPickup: laundryDetails.customerPickup,
  //   delivery: laundryDetails.delivery,
  //   deliveryPartnerId: laundryDetails.deliveryPartnerId,
  //   deliveryDetails: laundryDetails.deliveryDetails,
  //   language: laundryDetails.language,
  //   firebaseId: laundryDetails.firebaseId
  // }

  let laundryStore: ServiceProvider = await createLaundryStore(laundryDetails, userId);

  notifyAdmins(laundryStore, mezAdmins);

};

function notifyAdmins(laundryStore: ServiceProvider, mezAdmins: MezAdmin[]) {
  let notification: Notification = {
    foreground: <NewLaundryNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      name: laundryStore.name,
      image: laundryStore.image,
      id: laundryStore.id
    },
    background: {
      [Language.ES]: {
        title: "Nueva Lavandería",
        body: `Hay una nueva Lavandería`
      },
      [Language.EN]: {
        title: "New Laundry Store",
        body: `There is a new Laundry Store`
      }
    },
    linkUrl: laundryUrl(laundryStore.id!)
  };
  mezAdmins.forEach((m) => {
    pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
  });
}

export const laundryTemplateInJson = `{
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
    "operators": {}
  }
}`;

