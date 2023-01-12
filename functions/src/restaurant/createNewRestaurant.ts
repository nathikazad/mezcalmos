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
      selfDelivery: false,
      
    
   
  }
    restaurant.firebaseId = restaurantDetails.firebaseId


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
    pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
  });
}