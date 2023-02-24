import { createDeliveryOperator } from "../shared/graphql/delivery/operator/createDeliveryOperator"
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator"
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

export async function addDeliveryOperator(operatorUserId: number, addOperatorDetails: AddOperatorDetails) {

  let operatorUserInfo: UserInfo = await getUser(operatorUserId);
  let notification: Notification = {
    foreground: <AuthorizeOperatorNotification>{
      newOperatorName: operatorUserInfo.name,
      newOperatorImage: operatorUserInfo.image,
      serviceProviderId: addOperatorDetails.serviceProviderId,
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
  await createDeliveryOperator(operatorUserId, addOperatorDetails)

  let operators = await getDeliveryOperators(addOperatorDetails.serviceProviderId);
  operators.forEach((o) => {
    if(o.owner && o.user) {
      pushNotification(
        o.user.firebaseId, 
        notification, 
        o.notificationInfo, 
        ParticipantType.DeliveryOperator,
        o.user.language,
      );
    }
  })
}