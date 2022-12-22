import { createRestaurantOperator } from "../shared/graphql/restaurant/operators/createRestaurantOperator"
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators"
import { getUser } from "../shared/graphql/user/getUser"
import { ParticipantType } from "../shared/models/Generic/Chat"
import { NotificationInfo, ServerResponseStatus } from "../shared/models/Generic/Generic"
import { UserInfo } from "../shared/models/Generic/User"
import { AuthorizeOperatorNotification, Notification, NotificationAction, NotificationType } from "../shared/models/Notification"
import { OperatorStatus, RestaurantOperator } from "../shared/models/Services/Restaurant/Restaurant"
import { pushNotification } from "../utilities/senders/notifyUser"

export interface AddOperatorDetails {
    restaurantId: number,
    notificationInfo?: NotificationInfo,
}
export async function addRestaurantOperator(operatorUserId: number, addDriverDetails: AddOperatorDetails) {

  let operatorUserInfo: UserInfo = await getUser(operatorUserId);
  let notification: Notification = {
    foreground: <AuthorizeOperatorNotification>{
      newOperatorName: operatorUserInfo.name,
      newOperatorImage: operatorUserInfo.image,
      serviceProviderId: addDriverDetails.restaurantId,
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
  let newOperator: RestaurantOperator = {
    userId: operatorUserId,
    restaurantId: addDriverDetails.restaurantId,
    status: OperatorStatus.AwaitingApproval,
    notificationInfo: addDriverDetails.notificationInfo
  }
  await createRestaurantOperator(newOperator);

  let operators = await getRestaurantOperators(addDriverDetails.restaurantId);
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
  return { status: ServerResponseStatus.Success }
}