import { createDeliveryDriver } from "../shared/graphql/delivery/driver/createDeliveryDriver";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { NotificationInfo } from "../shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { AuthorizeDriverNotification, DeliveryDriver, DeliveryOperator, DeliveryServiceProviderType } from "../shared/models/Generic/Delivery";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Operator } from "../shared/models/Services/Service";

export interface AddDriverDetails {
    deliveryCompanyId: number,
    notificationInfo?: NotificationInfo,
}

export async function addDriver(userId: number, addDriverDetails: AddDriverDetails, deliveryServiceProviderType: DeliveryServiceProviderType ) {
    //first mutation
    //second notify operators of the company
    let deliveryDriver: DeliveryDriver = {
        userId,
        deliveryCompanyType: deliveryServiceProviderType,
        deliveryCompanyId: addDriverDetails.deliveryCompanyId,
        notificationInfo: addDriverDetails.notificationInfo,
        deliveryDriverType: ParticipantType.DeliveryDriver
    }
    await createDeliveryDriver(deliveryDriver);

    notify(deliveryDriver, deliveryServiceProviderType, addDriverDetails);
}

async function notify(deliveryDriver: DeliveryDriver, deliveryCompanyType: DeliveryServiceProviderType, addDriverDetails: AddDriverDetails) {
    let notification: Notification = {
        foreground: <AuthorizeDriverNotification>{
            newDriverName: deliveryDriver.user?.name,
            newDriverImage: deliveryDriver.user?.image,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.NewDriver,
            notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
        },
        background: {
            en: {
                title: `Authorize driver`,
                body: `Driver ${deliveryDriver.user?.name} is requesting to join`
            },
            es: {
                title: `Autorizar conductor`,
                body: `Conductor ${deliveryDriver.user?.name} está solicitando unirse`
            }
        },
        linkUrl: `/`
    };
    switch (deliveryCompanyType) {
        case DeliveryServiceProviderType.DeliveryCompany:
            let deliveryOperators: DeliveryOperator[] = await getDeliveryOperators(addDriverDetails.deliveryCompanyId);
            deliveryOperators.forEach((d) => {
                if (d.user) {
                    pushNotification(
                        d.user.firebaseId,
                        notification,
                        d.notificationInfo,
                        ParticipantType.DeliveryOperator
                    );
                }
            });
            break;
        case DeliveryServiceProviderType.Restaurant:
            let operators: Operator[] = await getRestaurantOperators(addDriverDetails.deliveryCompanyId);
            operators.forEach((o) => {
                if (o.owner && o.user) {
                    pushNotification(
                        o.user.firebaseId,
                        notification,
                        o.notificationInfo,
                        ParticipantType.RestaurantOperator,
                        o.user.language
                    );
                }
            });
            break;
        default:
            break;
    }
}
