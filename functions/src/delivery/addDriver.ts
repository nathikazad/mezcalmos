import { createDeliveryDriver } from "../shared/graphql/delivery/driver/createDeliveryDriver";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { AuthorizeDriverNotification, DeliveryDriver, DeliveryOperator } from "../shared/models/Generic/Delivery";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Operator, ServiceProvider, ServiceProviderType } from "../shared/models/Services/Service";
import { getLaundryOperators } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { getServiceProviderFromUniqueId } from "../shared/graphql/getServiceProvider";
import { HttpsError } from "firebase-functions/v1/auth";

export interface AddDriverDetails {
    uniqueId: string,
    notificationToken?: string,
}

export async function addDriver(userId: number, addDriverDetails: AddDriverDetails) {
    //first mutation
    //second notify operators of the company
    try {
        let serviceProvider: ServiceProvider = await getServiceProviderFromUniqueId(addDriverDetails.uniqueId)
        let deliveryDriver: DeliveryDriver = await createDeliveryDriver(userId, serviceProvider, addDriverDetails);
    
        await notify(deliveryDriver, serviceProvider);
    } catch(err) {
        console.log("Error: ", err);
        throw new HttpsError(
            "internal",
            "Error in add driver"
        );
    }
}

async function notify(deliveryDriver: DeliveryDriver, serviceProvider: ServiceProvider) {
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
    switch (serviceProvider.serviceProviderType) {
        case ServiceProviderType.Delivery:
            let deliveryOperators: DeliveryOperator[] = await getDeliveryOperators(serviceProvider.id);
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
        case ServiceProviderType.Restaurant:
            let restaurantOperators: Operator[] = await getRestaurantOperators(serviceProvider.id);
            restaurantOperators.forEach((o) => {
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
            case ServiceProviderType.Laundry:
            let laundryOperators: Operator[] = await getLaundryOperators(serviceProvider.id);
            laundryOperators.forEach((o) => {
                if (o.owner && o.user) {
                    pushNotification(
                        o.user.firebaseId,
                        notification,
                        o.notificationInfo,
                        ParticipantType.LaundryOperator,
                        o.user.language
                    );
                }
            });
            break;
        default:
            break;
    }
}
