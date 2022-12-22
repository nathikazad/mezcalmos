import { HttpsError } from "firebase-functions/v1/auth"
import { createDeliveryOperator } from "../shared/graphql/delivery/operator/createDeliveryOperator"
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator"
import { getUser } from "../shared/graphql/user/getUser"
import { ParticipantType } from "../shared/models/Generic/Chat"
import { NotificationInfo, ServerResponseStatus } from "../shared/models/Generic/Generic"
import { UserInfo } from "../shared/models/Generic/User"
import { AuthorizeOperatorNotification, Notification, NotificationAction, NotificationType } from "../shared/models/Notification"
import { DeliveryOperator, DeliveryOperatorStatus } from "../shared/models/Services/Delivery/DeliveryOrder"
import { pushNotification } from "../utilities/senders/notifyUser"

export interface AddOperatorDetails {
    deliveryCompanyId: number,
    notificationInfo?: NotificationInfo,
}
export async function addDeliveryOperator(operatorUserId: number, addDriverDetails: AddOperatorDetails) {
  try {
    let operatorUserInfo: UserInfo = await getUser(operatorUserId);
    let notification: Notification = {
      foreground: <AuthorizeOperatorNotification>{
        newOperatorName: operatorUserInfo.name,
        newOperatorImage: operatorUserInfo.image,
        serviceProviderId: addDriverDetails.deliveryCompanyId,
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
    let newOperator: DeliveryOperator = {
      userId: operatorUserId,
      deliveryCompanyId: addDriverDetails.deliveryCompanyId,
      status: DeliveryOperatorStatus.AwaitingApproval,
      notificationInfo: addDriverDetails.notificationInfo,
      owner: false,
    }
    await createDeliveryOperator(newOperator)

    let operators = await getDeliveryOperators(addDriverDetails.deliveryCompanyId);
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
    return { status: ServerResponseStatus.Success }
  } catch(error) {
    console.log("error =>", error);
    throw new HttpsError(
      "unknown",
      "Request was not authenticated.",
      error
    );
  }
}