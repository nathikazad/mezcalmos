import { Language, Location, MezError } from "../shared/models/Generic/Generic";
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
export interface LaundryResponse {
  success: boolean,
  error?: LaundryError
  unhandledError?: string,
}
export enum LaundryError {
  DeliveryDetailsNotSet = "deliveryDetailsNotSet",
  NoDeliveryPartner = "noDeliveryPartner",
  UserNotFound = "userNotFound",
  DeepLinkError = "deepLinkError",
  QRGenerationError = "qrGenerationError",
  LaundryCreationError = "laundryCreationError"
}

export async function createLaundry(userId: number, laundryDetails: LaundryDetails): Promise<LaundryResponse> {
  try {
    if(laundryDetails.deliveryDetails.deliveryAvailable) {
      if(laundryDetails.deliveryDetails.selfDelivery && !(laundryDetails.deliveryDetails.radius)) {
        throw new MezError(LaundryError.DeliveryDetailsNotSet);
      } else if(!(laundryDetails.deliveryDetails.selfDelivery) && !(laundryDetails.deliveryPartnerId)) {
        throw new MezError(LaundryError.NoDeliveryPartner);
      }
    }
  
    let userPromise = getUser(userId);
    let mezAdminsPromise = getMezAdmins();
    let promiseResponse = await Promise.all([userPromise, mezAdminsPromise]);
    let mezAdmins: MezAdmin[] = promiseResponse[1];
  
    let laundryStore: ServiceProvider = await createLaundryStore(laundryDetails, userId);
  
    notifyAdmins(laundryStore, mezAdmins);  
    return {
      success: true
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(LaundryError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
  
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

