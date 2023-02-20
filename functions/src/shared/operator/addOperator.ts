import { pushNotification } from "../../utilities/senders/notifyUser";
import { createRestaurantOperator } from "../graphql/restaurant/operators/createRestaurantOperator";
import { getRestaurantOperators } from "../graphql/restaurant/operators/getRestaurantOperators";
import { getUser } from "../graphql/user/getUser";
import { ParticipantType } from "../models/Generic/Chat";
import { NotificationInfo } from "../models/Generic/Generic";
import { UserInfo } from "../models/Generic/User";
import { AuthorizeOperatorNotification, NotificationType, NotificationAction, Notification } from "../models/Notification";


export interface AddOperatorDetails {
    restaurantId: number,
    notificationInfo?: NotificationInfo,
    appVersion?: string
}
export async function addOperator(operatorUserId: number, addOpDetails: AddOperatorDetails) {
  let operatorUserInfo: UserInfo = await getUser(operatorUserId);
  
  await createRestaurantOperator(operatorUserId, addOpDetails);
  
  let notification: Notification = {
    foreground: <AuthorizeOperatorNotification>{
      newOperatorName: operatorUserInfo.name,
      newOperatorImage: operatorUserInfo.image,
      serviceProviderId: addOpDetails.restaurantId,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.AuthorizeOperator,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background:{
      en: {
        title: `Authorize Operator`,
        body: `An operator named ${operatorUserInfo.name} is requesting to join`
      },
      es: {
        title: `Authorize Operator`,
        body: `An operator named ${operatorUserInfo.name} is requesting to join`
      }
    },
    linkUrl: `/`
  }
  let operators = await getRestaurantOperators(addOpDetails.restaurantId);
  operators.forEach((o) => {
    if(o.owner && o.user) {
      pushNotification(
        o.user.firebaseId, 
        notification, 
        o.notificationInfo, 
        ParticipantType.RestaurantOperator,
        o.user.language,
      );
    }
  })
}