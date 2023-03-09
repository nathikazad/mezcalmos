import { Language, Location } from "../shared/models/Generic/Generic";
import { NewRestaurantNotification } from "../shared/models/Services/Restaurant/Restaurant";
import { createRestaurant } from "../shared/graphql/restaurant/createRestaurant";
import { getUser } from "../shared/graphql/user/getUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { MezAdmin } from "../shared/models/Generic/User";
import { NotificationType, NotificationAction, Notification } from "../shared/models/Notification";
import { restaurantUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { HttpsError } from "firebase-functions/v1/auth";
import { DeliveryDetails } from "../shared/models/Generic/Delivery";
import { ServiceProvider } from "../shared/models/Services/Service";

export interface RestaurantDetails {
  name: string,
  image: string,
  location: Location,
  schedule:JSON,
  restaurantOperatorNotificationToken?: string,
  firebaseId?: string,
  deliveryPartnerId?: number,
  deliveryDetails: DeliveryDetails,
  language: Record<Language, boolean>,
  uniqueId: string
}

export async function createNewRestaurant(userId: number, restaurantDetails: RestaurantDetails) {

  if(restaurantDetails.deliveryDetails.deliveryAvailable) {
    if(restaurantDetails.deliveryDetails.deliveryAvailable && restaurantDetails.deliveryDetails.radius == 0) {
      throw new HttpsError(
        "unknown",
        "Restaurant delivery details not set"
      );
    } else if(!(restaurantDetails.deliveryDetails.selfDelivery) && !(restaurantDetails.deliveryPartnerId)) {
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

    
  let restaurant: ServiceProvider = await createRestaurant(restaurantDetails, userId);
  
  let notification: Notification = {
    foreground: <NewRestaurantNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      name: restaurant.name,
      image: restaurant.image,
      id: restaurant.id
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
    linkUrl: restaurantUrl(restaurant.id!)
  }
  mezAdmins.forEach((m) => {
    pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
  });
}