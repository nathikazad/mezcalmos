import { createRestaurantOperator } from "../shared/graphql/restaurant/operators/createRestaurantOperator"
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators"
import { getUser } from "../shared/graphql/user/getUser"
import { ParticipantType } from "../shared/models/Generic/Chat"
import { NotificationInfo } from "../shared/models/Generic/Generic"
import { UserInfo } from "../shared/models/Generic/User"
import { AuthorizeOperatorNotification, Notification, NotificationAction, NotificationType } from "../shared/models/Notification"
import { pushNotification } from "../utilities/senders/notifyUser"

interface AddOperatorDetails {
  serviceProviderId: number,
  participantType: ParticipantType
  notificationInfo?: NotificationInfo,
  appVersion?: string
}

export async function addRestaurantOperator(operatorUserId: number, addOpDetails: AddOperatorDetails) {
  let operatorUserInfo: UserInfo = await getUser(operatorUserId);
  
  await createRestaurantOperator(operatorUserId, addOpDetails);
  
  let notification: Notification = {
    foreground: <AuthorizeOperatorNotification>{
      newOperatorName: operatorUserInfo.name,
      newOperatorImage: operatorUserInfo.image,
      serviceProviderId: addOpDetails.serviceProviderId,
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
  let operators = await getRestaurantOperators(addOpDetails.serviceProviderId);
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