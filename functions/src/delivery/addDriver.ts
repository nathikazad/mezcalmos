import { createDeliveryDriver } from "../shared/graphql/delivery/driver/createDeliveryDriver";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { MezError, NotificationInfo } from "../shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { AuthorizeDriverNotification, DeliveryDriver, DeliveryOperator, DeliveryServiceProviderType } from "../shared/models/Generic/Delivery";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Operator } from "../shared/models/Services/Service";
import { getLaundryOperators } from "../shared/graphql/laundry/operator/getLaundryOperator";

export interface AddDriverDetails {
    deliveryCompanyId: number,
    notificationInfo?: NotificationInfo,
    deliveryServiceProviderType: DeliveryServiceProviderType
}
export interface AddDriverResponse {
    success: boolean,
    error?: AddDriverError
    unhandledError?: string
}
enum AddDriverError {
    DriverAlreadyExists = "driverAlreadyExists",
    DriverCreationError = "driverCreationError"
}

export async function addDriver(userId: number, addDriverDetails: AddDriverDetails): Promise<AddDriverResponse> {
    //first mutation
    //second notify operators of the company
    try {
        let deliveryDriver: DeliveryDriver = await createDeliveryDriver(userId, addDriverDetails, addDriverDetails.deliveryServiceProviderType);

        notify(deliveryDriver, addDriverDetails.deliveryServiceProviderType, addDriverDetails);

        return {
            success: true
        }
    } catch (e: any) {
        if (e instanceof MezError) {
            if (Object.values(AddDriverError).includes(e.message as any)) {
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
            let restaurantOperators: Operator[] = await getRestaurantOperators(addDriverDetails.deliveryCompanyId);
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
            case DeliveryServiceProviderType.Laundry:
            let laundryOperators: Operator[] = await getLaundryOperators(addDriverDetails.deliveryCompanyId);
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
