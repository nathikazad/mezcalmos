import { HttpsError } from "firebase-functions/v1/auth";
import { DeliveryDriver, DeliveryOperatorStatus, DeliveryServiceProviderType, DriverApprovedNotification } from "../shared/models/Generic/Delivery";
import { getRestaurantOperatorByUserId } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { updateDriverStatustoAuthorized } from "../shared/graphql/delivery/driver/updateDriverStatus";
import { deleteDeliveryDriver } from "../shared/graphql/delivery/driver/deleteDriver";
import { getDeliveryOperatorByUserId } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { OperatorStatus } from "../shared/models/Services/Service";

export interface AuthorizeDetails {
    deliveryDriverId: number,
    approved: boolean
}

export async function authorizeDriver(userId: number, authorizeDetails: AuthorizeDetails, deliveryServiceProviderType: DeliveryServiceProviderType) {
  let deliveryDriver = await getDeliveryDriver(authorizeDetails.deliveryDriverId)//, ParticipantType.DeliveryDriver);

  await checkAuthorization();

  if(authorizeDetails.approved) {
      await updateDriverStatustoAuthorized(authorizeDetails.deliveryDriverId)
  } else {
      await deleteDeliveryDriver(authorizeDetails.deliveryDriverId);
  }
  
  sendNotification(authorizeDetails, deliveryDriver);

  async function checkAuthorization() {
    switch (deliveryServiceProviderType) {
      case DeliveryServiceProviderType.Restaurant:
        let restaurantOperator = await getRestaurantOperatorByUserId(userId);
        if (!restaurantOperator.owner || restaurantOperator.status != OperatorStatus.Authorized) {
          throw new HttpsError(
            "internal",
            "Only authorized restaurant owners can add drivers"
          );
        }
        break;
      case DeliveryServiceProviderType.DeliveryCompany:
        let deliveryOperator = await getDeliveryOperatorByUserId(userId);
        if (!deliveryOperator.owner || deliveryOperator.status != DeliveryOperatorStatus.Authorized) {
          throw new HttpsError(
            "internal",
            "Only authorized delivery owners can add drivers"
          );
        }
      default:
        break;
    }
  }
}

function sendNotification(authorizeDetails: AuthorizeDetails, deliveryDriver: DeliveryDriver) {
  let notification: Notification = {
    foreground: <DriverApprovedNotification>{
      approved: authorizeDetails.approved,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.DriverApproved,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background: (authorizeDetails.approved) ? {
      en: {
        title: `Authorized`,
        body: `You have been approved`
      },
      es: {
        title: `Autorizado`,
        body: `has sido aprobado`
      }
    } : {
      en: {
        title: `Not approved`,
        body: `Your request to become an driver has been denied`
      },
      es: {
        title: `No aprovado`,
        body: `Su solicitud para convertirse en conductor ha sido denegada`
      }
    },
    linkUrl: `/`
  };
  if (deliveryDriver.user) {
    pushNotification(
      deliveryDriver.user.firebaseId,
      notification,
      deliveryDriver.notificationInfo,
      ParticipantType.DeliveryDriver,
      deliveryDriver.user.language
    );
  }
}
