import { HttpsError } from "firebase-functions/v1/auth";
import { getCourierOrder } from "../shared/graphql/delivery/courier/getCourierOrder"
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { DeliveryOperator, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { OrderType } from "../shared/models/Generic/Order";
import { MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { CourierOrder, CourierOrderStatusChangeNotification, orderInProcess } from "../shared/models/Services/Courier/Courier"

import { pushNotification } from "../utilities/senders/notifyUser";
import { deliveryOrderStatusChangeMessages } from "./bgNotificationMessages";


interface CancelOrderDetails {
    orderId: number
}
  
export async function cancelCourierFromCustomer(userId: number, cancelOrderDetails: CancelOrderDetails) {
    
    let courierOrder: CourierOrder = await getCourierOrder(cancelOrderDetails.orderId);
    
    if (courierOrder.customerId != userId) {
        throw new HttpsError(
          "internal",
          `Order does not belong to customer`,
        );
    }
    if (!orderInProcess(courierOrder.deliveryOrder.status)) {
        throw new HttpsError(
          "internal",
          `Order cannot be cancelled because it is not in process`,
        );
    }

    courierOrder.deliveryOrder.status = DeliveryOrderStatus.CancelledByCustomer;
    updateDeliveryOrderStatus(courierOrder.deliveryOrder);

    notify(courierOrder, cancelOrderDetails);
}

async function notify(courierOrder: CourierOrder, cancelOrderDetails: CancelOrderDetails) {
    let promiseResponse = await Promise.all([getMezAdmins(), getDeliveryOperators(courierOrder.deliveryOrder.serviceProviderId)]);
    let mezAdmins: MezAdmin[] = promiseResponse[0];
    let deliveryOperators: DeliveryOperator[] = promiseResponse[1];

    let notification: Notification = {
        foreground: <CourierOrderStatusChangeNotification>{
            status: DeliveryOrderStatus.CancelledByCustomer,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.OrderStatusChange,
            orderType: OrderType.Courier,
            notificationAction: NotificationAction.ShowPopUp,
            orderId: cancelOrderDetails.orderId
        },
        background: deliveryOrderStatusChangeMessages[courierOrder.deliveryOrder.status],
        linkUrl: '/'
    };
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
    deliveryOperators.forEach((d) => {
        pushNotification(d.user?.firebaseId!,
            notification,
            d.notificationInfo,
            ParticipantType.DeliveryOperator,
            d.user?.language
        );
    });
    if (courierOrder.deliveryOrder.deliveryDriver) {
        pushNotification(courierOrder.deliveryOrder.deliveryDriver.user?.firebaseId!,
            notification,
            courierOrder.deliveryOrder.deliveryDriver.notificationInfo,
            ParticipantType.DeliveryDriver,
            courierOrder.deliveryOrder.deliveryDriver.user?.language
        );
    }
}
