import { DeliveryDriver, DeliveryServiceProviderType } from "../shared/models/Generic/Delivery";
import { deleteDeliveryDriver } from "../shared/graphql/delivery/driver/deleteDriver";
import { ForegroundNotification, Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { MezError } from "../shared/models/Generic/Generic";
import { checkOperatorAuthorization } from "../shared/helper";

export interface RemoveDriverDetails {
  deliveryDriverId: number,
  deliveryServiceProviderType: DeliveryServiceProviderType
}
export interface RemoveDriverResponse {
  success: boolean,
  error?: RemoveDriverError
  unhandledError?: string,
}
export enum RemoveDriverError {
    UnhandledError = "unhandledError",
    DriverNotFound = "driverNotFound",
    OperatorNotFound = "operatorNotFound",
    UnauthorizedAccess = "unauthorizedAccess"
}

export async function removeDriver(userId: number, removeDetails: RemoveDriverDetails): Promise<RemoveDriverResponse> {
  try {
    let deliveryDriver: DeliveryDriver = await getDeliveryDriver(removeDetails.deliveryDriverId)//, ParticipantType.DeliveryDriver);

    await checkOperatorAuthorization(userId, removeDetails.deliveryServiceProviderType);

    await deleteDeliveryDriver(removeDetails.deliveryDriverId);

    sendNotification(deliveryDriver);
    return {
      success: true
    }
  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(RemoveDriverError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: RemoveDriverError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
}

function sendNotification(deliveryDriver: DeliveryDriver) {
  let notification: Notification = {
    foreground: <ForegroundNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.DriverRemoved,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background: {
      en: {
        title: `Terminated`,
        body: `You are no longer a delivery driver`
      },
      es: {
        title: `terminado`,
        body: `Ya no eres un conductor de entrega`
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
