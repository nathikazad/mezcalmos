import { createDeliveryDriver } from "../shared/graphql/delivery/driver/createDeliveryDriver";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { MezError } from "../shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { AuthorizeDriverNotification, DeliveryDriver, DeliveryOperator } from "../shared/models/Generic/Delivery";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Operator, ServiceProvider, ServiceProviderType } from "../shared/models/Services/Service";
import { getLaundryOperators } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { getServiceProviderFromUniqueId } from "../shared/graphql/getServiceProvider";

export interface AddDriverDetails {
    uniqueId: string,
    notificationToken?: string,
}
export interface AddDriverResponse {
    success: boolean,
    error?: AddDriverError
    unhandledError?: string
}
export enum AddDriverError {
    UnhandledError = "unhandledError",
    DriverAlreadyExists = "driverAlreadyExists",
    DriverCreationError = "driverCreationError",
    InvalidServiceProviderType = "invalidServiceProviderType"
}

export async function addDriver(userId: number, addDriverDetails: AddDriverDetails): Promise<AddDriverResponse> {
    //first mutation
    //second notify operators of the company
    try {
        let serviceProvider: ServiceProvider = await getServiceProviderFromUniqueId(addDriverDetails.uniqueId)
        let deliveryDriver: DeliveryDriver = await createDeliveryDriver(userId, serviceProvider, addDriverDetails);

        await notify(deliveryDriver, serviceProvider);

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
                    error: AddDriverError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
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
        case ServiceProviderType.DeliveryCompany:
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
