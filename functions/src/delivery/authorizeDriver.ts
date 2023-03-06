import { DeliveryDriver, DeliveryOperator, DeliveryServiceProviderType, DriverApprovedNotification } from "../shared/models/Generic/Delivery";
import { getRestaurantOperatorByUserId } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { updateDriverStatustoAuthorized } from "../shared/graphql/delivery/driver/updateDriverStatus";
import { deleteDeliveryDriver } from "../shared/graphql/delivery/driver/deleteDriver";
import { getDeliveryOperatorByUserId } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { AuthorizationStatus, MezError } from "../shared/models/Generic/Generic";
import { getLaundryOperatorByUserId } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { Operator } from "../shared/models/Services/Service";

export interface AuthorizeDetails {
  deliveryDriverId: number,
  approved: boolean,
  deliveryServiceProviderType: DeliveryServiceProviderType
}
export interface AuthorizeDriverResponse {
  success: boolean,
  error?: AuthorizeDriverError
  unhandledError?: string,
}

enum AuthorizeDriverError {
  DriverNotFound = "driverNotFound",
  OperatorNotFound = "operatorNotFound",
  UnauthorizedAccess = "unauthorizedAccess"
}

export async function authorizeDriver(userId: number, authorizeDetails: AuthorizeDetails): Promise<AuthorizeDriverResponse> {
  try {
    let deliveryDriver = await getDeliveryDriver(authorizeDetails.deliveryDriverId)//, ParticipantType.DeliveryDriver);

    await checkAuthorization();

    if(authorizeDetails.approved) {
      await updateDriverStatustoAuthorized(authorizeDetails.deliveryDriverId)
    } else {
      await deleteDeliveryDriver(authorizeDetails.deliveryDriverId);
    }
    
    sendNotification(authorizeDetails, deliveryDriver);
    return {
      success: true
    }
  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(AuthorizeDriverError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }

  async function checkAuthorization() {
    switch (authorizeDetails.deliveryServiceProviderType) {
      case DeliveryServiceProviderType.Restaurant:
        let restaurantOperator: Operator = await getRestaurantOperatorByUserId(userId);
        if (!restaurantOperator.owner || restaurantOperator.status != AuthorizationStatus.Authorized) {
          throw new MezError(AuthorizeDriverError.UnauthorizedAccess);
        }
        break;
      case DeliveryServiceProviderType.Laundry:
        let laundryOperator: Operator = await getLaundryOperatorByUserId(userId);
        if (!laundryOperator.owner || laundryOperator.status != AuthorizationStatus.Authorized) {
          throw new MezError(AuthorizeDriverError.UnauthorizedAccess);
        }
        break;
      case DeliveryServiceProviderType.DeliveryCompany:
        let deliveryOperator: DeliveryOperator = await getDeliveryOperatorByUserId(userId);
        if (!deliveryOperator.owner || deliveryOperator.status != AuthorizationStatus.Authorized) {
          throw new MezError(AuthorizeDriverError.UnauthorizedAccess);
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
