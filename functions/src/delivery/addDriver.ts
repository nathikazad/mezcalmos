import { createDeliveryDriver } from "../shared/graphql/delivery/driver/createDeliveryDriver";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { NotificationInfo } from "../shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { AuthorizeDriverNotification, DeliveryCompanyType, DeliveryDriver, DeliveryDriverType } from "../shared/models/Services/Delivery/DeliveryOrder";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface AddDriverDetails {
    deliveryCompanyId: number,
    notificationInfo?: NotificationInfo,
}

export async function addDriver(userId: number, addDriverDetails: AddDriverDetails, deliveryCompanyType: DeliveryCompanyType ) {
    //first mutation
    //second notify operators of the company
    let deliveryDriver: DeliveryDriver = {
        userId,
        deliveryCompanyType: deliveryCompanyType,
        deliveryCompanyId: addDriverDetails.deliveryCompanyId,
        notificationInfo: addDriverDetails.notificationInfo,
        deliveryDriverType: DeliveryDriverType.DeliveryDriver
    }
    await createDeliveryDriver(deliveryDriver);

    let notification: Notification = {
        foreground: <AuthorizeDriverNotification>{
            newDriverName: deliveryDriver.user?.name,
            newDriverImage: deliveryDriver.user?.image,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.NewDriver,
            notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
        },
        background:{
            en: {
                title: `Authorize driver`,
                body: `Driver ${deliveryDriver.user?.name} is requesting to join`
            },
            es: {
                title: `Authorize driver`,
                body: `Driver ${deliveryDriver.user?.name} is requesting to join`
            }
        },
        linkUrl: `/`
    }
    if(deliveryCompanyType == DeliveryCompanyType.DeliveryCompany) {
        
        let deliveryOperators = await getDeliveryOperators(addDriverDetails.deliveryCompanyId);
        deliveryOperators.forEach((d) => {
            if(d.user) {
                pushNotification(
                    d.user.firebaseId, 
                    notification, 
                    d.notificationInfo, 
                    ParticipantType.DeliveryOperator
                );
            }
        });
    } else {
        let operators = await getRestaurantOperators(addDriverDetails.deliveryCompanyId);
        // console.log(operators);
        operators.forEach((o) => {
            if(o.owner && o.user) {
                pushNotification(
                    o.user.firebaseId, 
                    notification, 
                    o.notificationInfo, 
                    ParticipantType.RestaurantOperator,
                    o.user.language,
                );
            }
        })
    }

}