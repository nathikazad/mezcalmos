import { HttpsError } from "firebase-functions/v1/auth";
import { DeliveryCompanyType, DeliveryDriverType, DeliveryOperatorStatus, DriverApprovedNotification } from "../shared/models/Generic/Delivery";
import { getRestaurantOperatorByUserId } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { updateDriverStatustoAuthorized } from "../shared/graphql/delivery/driver/updateDriverStatus";
import { deleteDeliveryDriver } from "../shared/graphql/delivery/driver/deleteDriver";
import { getDeliveryOperatorByUserId } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";

export interface AuthorizeDetails {
    deliveryDriverId: number,
    approved: boolean
}

export async function authorizeDriver(userId: number, authorizeDetails: AuthorizeDetails, deliveryCompanyType: DeliveryCompanyType) {
  try {
    let deliveryDriver = await getDeliveryDriver(authorizeDetails.deliveryDriverId, DeliveryDriverType.DeliveryDriver);

    if(deliveryCompanyType == DeliveryCompanyType.Restaurant) {

      let restaurantOperator = await getRestaurantOperatorByUserId(userId)
      if(!(restaurantOperator.owner)) {
        throw new HttpsError(
          "internal",
          "Only owner can add drivers"
        );
      }
    } else {
      let deliveryOperator = await getDeliveryOperatorByUserId(userId)
      if(deliveryOperator.status != DeliveryOperatorStatus.Authorized) {
          throw new HttpsError(
              "internal",
              "Only authorized delivery operators can add drivers"
          );
      }
      if(deliveryDriver.deliveryCompanyId != deliveryOperator.deliveryCompanyId) {
        throw new HttpsError(
          "internal",
          "Delivery company id mismatch"
        );
      }
    }
    
    if(authorizeDetails.approved) {
        await updateDriverStatustoAuthorized(authorizeDetails.deliveryDriverId)
    } else {
        await deleteDeliveryDriver(authorizeDetails.deliveryDriverId);
    }
    let notification: Notification = {
        foreground: <DriverApprovedNotification>{
          approved: authorizeDetails.approved,
          time: (new Date()).toISOString(),
          notificationType: NotificationType.DriverApproved,
          notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
        },
        background: (authorizeDetails.approved) ? {
          en: {
            title:  `Authorized`,
            body: `You have been approved`
          },
          es: {
            title: `Authorized`,
            body: `You have been approved`
          }
        } : {
          en: {
            title: `Not approved`,
            body: `Your request to become an driver has been denied`
          },
          es: {
            title: `Not approved`,
            body: `Your request to become an driver has been denied`
          }
        },
        linkUrl: `/`
      }
    if(deliveryDriver.user) {
        pushNotification(
            deliveryDriver.user.firebaseId, 
            notification, 
            deliveryDriver.notificationInfo, 
            ParticipantType.DeliveryDriver,
            deliveryDriver.user.language,
        );
    }
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