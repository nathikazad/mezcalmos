import { HttpsError } from "firebase-functions/v1/auth";
import { deleteRestaurantOperator } from "../shared/graphql/restaurant/operators/deleteOperator";
import {
  getRestaurantOperator,
  getRestaurantOperatorByUserId,
} from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { updateRestaurantOperatorStatusToAuthorized } from "../shared/graphql/restaurant/operators/updateOperatorStatus";
import { ParticipantType } from "../shared/models/Generic/Chat";
import {
  Notification,
  NotificationAction,
  NotificationType,
} from "../shared/models/Notification";
import { RestaurantOperatorApprovedNotification } from "../shared/models/Services/Restaurant/Restaurant";
import { Operator } from "../shared/models/Services/Service";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface AuthorizeDetails {
  newOperatorId: number;
  approved: boolean;
}

export async function authorizeRestaurantOperator(ownerUserId: number, authorizeDetails: AuthorizeDetails) {

  console.log("Starting authorize restaurant operator");
  let operator: Operator = await getRestaurantOperator(authorizeDetails.newOperatorId);

  let restaurantOwner: Operator = await getRestaurantOperatorByUserId(ownerUserId);
  console.log("hasura fetch");
  if (!restaurantOwner.owner) {
    throw new HttpsError("internal", "Only owner can add operators");
  }
  if (authorizeDetails.approved) {
    await updateRestaurantOperatorStatusToAuthorized(
      authorizeDetails.newOperatorId
    );
  } else {
    await deleteRestaurantOperator(authorizeDetails.newOperatorId);
  }

  let notification: Notification = {
    foreground: <RestaurantOperatorApprovedNotification>{
      operatorId: authorizeDetails.newOperatorId,
      approved: authorizeDetails.approved,
      time: new Date().toISOString(),
      notificationType: NotificationType.OperatorApproved,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background: authorizeDetails.approved
      ? {
          en: {
            title: `Authorized`,
            body: `You have been approved as an operator`,
          },
          es: {
            title: `Autorizado`,
            body: `Has sido aprobado como operador`,
          },
        }
      : {
          en: {
            title: `Not approved`,
            body: `Your request to become an operator has been denied`,
          },
          es: {
            title: `No aprovado`,
            body: `Tu solicitud para convertirte en operador ha sido denegada`,
          },
        },
    linkUrl: `/`,
  };
  if (operator.user) {
    pushNotification(
      operator.user.firebaseId,
      notification,
      operator.notificationInfo,
      ParticipantType.RestaurantOperator,
      operator.user.language
    );
  }
}
