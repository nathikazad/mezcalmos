import { HttpsError } from "firebase-functions/v1/auth";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { updateDeliveryOrderCompany } from "../shared/graphql/delivery/updateDelivery";
import { getRestaurantOrder } from "../shared/graphql/restaurant/order/getRestaurantOrder"
import { OrderType } from "../shared/models/Generic/Order";
import { Notification, NotificationAction, NotificationType, OrderNotification } from "../shared/models/Notification";
import { deliveryNewOrderMessage } from "../delivery/bgNotificationMessages"
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";

export interface AssignCompanyDetails {
    deliveryCompanyId: number,
    restaurantOrderId: number
}

export async function assignDeliveryCompany(operatorUserId: number | undefined, assignDetails: AssignCompanyDetails) {

    let restaurantOrder = await getRestaurantOrder(assignDetails.restaurantOrderId);

    if(!(restaurantOrder.deliveryId)) {
        throw new HttpsError(
            "internal",
            "restaurant order delivery id is not set"
        );
    }
    updateDeliveryOrderCompany(restaurantOrder.deliveryId, assignDetails.deliveryCompanyId);

    //notify delivery operator  
    let deliveryOperators = await getDeliveryOperators(assignDetails.deliveryCompanyId);

    let notification: Notification = {
        foreground: <OrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: OrderType.Restaurant,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: restaurantOrder.deliveryId
        },
        background: deliveryNewOrderMessage,
        linkUrl: orderUrl(OrderType.Restaurant, assignDetails.restaurantOrderId)
    }

    deliveryOperators.forEach((d) => {
        pushNotification(d.user?.firebaseId!, notification, d.notificationInfo, ParticipantType.DeliveryOperator);
    });
    return { status: ServerResponseStatus.Success }
}