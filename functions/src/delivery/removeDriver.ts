import { HttpsError } from "firebase-functions/v1/auth";
import { DeliveryDriver, DeliveryOperator, DeliveryServiceProviderType } from "../shared/models/Generic/Delivery";
import { getRestaurantOperatorByUserId } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { deleteDeliveryDriver } from "../shared/graphql/delivery/driver/deleteDriver";
import { getDeliveryOperatorByUserId } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { ForegroundNotification, Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { AuthorizationStatus } from "../shared/models/Generic/Generic";
import { getLaundryOperatorByUserId } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { Operator } from "../shared/models/Services/Service";
import { isMezAdmin } from "../shared/helper";

export interface RemoveDriverDetails {
    deliveryDriverId: number,
    deliveryServiceProviderType: DeliveryServiceProviderType
}

export async function removeDriver(userId: number, removeDriverDetails: RemoveDriverDetails) {

    await checkAuthorization();

    let driver: DeliveryDriver =  await deleteDeliveryDriver(removeDriverDetails.deliveryDriverId);
  
    sendNotification(driver);

    async function checkAuthorization() {
        if((await isMezAdmin(userId)) == true)
            return;
        
        switch (removeDriverDetails.deliveryServiceProviderType) {
            case DeliveryServiceProviderType.Restaurant:
                let restaurantOperator: Operator = await getRestaurantOperatorByUserId(userId);
                if (!restaurantOperator.owner || restaurantOperator.status != AuthorizationStatus.Authorized) {
                    throw new HttpsError(
                        "internal",
                        "Only authorized restaurant owners can add drivers"
                    );
                }
                break;
            case DeliveryServiceProviderType.Laundry:
                let laundryOperator: Operator = await getLaundryOperatorByUserId(userId);
                if (!laundryOperator.owner || laundryOperator.status != AuthorizationStatus.Authorized) {
                    throw new HttpsError(
                        "internal",
                        "Only authorized laundry owners can add drivers"
                    );
                }
                break;
            case DeliveryServiceProviderType.DeliveryCompany:
                let deliveryOperator: DeliveryOperator = await getDeliveryOperatorByUserId(userId);
                if (!deliveryOperator.owner || deliveryOperator.status != AuthorizationStatus.Authorized) {
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

function sendNotification(driver: DeliveryDriver) {
    let notification: Notification = {
        foreground: <ForegroundNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.DriverRemoved,
            notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
        },
        background: {
            en: {
                title: `Fired`,
                body: `You have been removed as an driver`
            },
            es: {
                title: `Despedido`,
                body: `Has sido eliminado como conductor`
            }     
        },
        linkUrl: `/`
    };
    if(driver.user)
        pushNotification(
            driver.user.firebaseId,
            notification,
            driver.notificationInfo,
            ParticipantType.DeliveryDriver,
            driver.user.language
        );
}
