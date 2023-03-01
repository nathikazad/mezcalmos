import { HttpsError } from "firebase-functions/v1/auth";
import { getBusinessOperators } from "../shared/graphql/business/operator/getBusinessOperator";
import { getBusinessOrderRequest } from "../shared/graphql/business/order/getOrderRequest";
import { updateBusinessOrderRequest } from "../shared/graphql/business/order/updateOrderRequest";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { MezAdmin } from "../shared/models/Generic/User";
import { NotificationType, NotificationAction, Notification } from "../shared/models/Notification";
import { BusinessOrder, BusinessOrderRequestStatus, BusinessStatusChangeNotification } from "../shared/models/Services/Business/BusinessOrder";
import { Operator } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";

interface HandleRequestDetails {
    orderRequestId: number,
    requestConfirmed: boolean,
}

export async function handleOrderRequestFromCustomer(userId: number, handleRequestDetails: HandleRequestDetails) {

    let order: BusinessOrder = await getBusinessOrderRequest(handleRequestDetails.orderRequestId);

    let promiseResponse = await Promise.all([
        getMezAdmins(), 
        getBusinessOperators(order.businessId)
    ]);

    let mezAdmins: MezAdmin[] = promiseResponse[0];
    let businessOperators: Operator[] = promiseResponse[1];

    errorChecks(order, userId, handleRequestDetails); 

    if(handleRequestDetails.requestConfirmed) {
        order.status = BusinessOrderRequestStatus.RequestConfirmedByCustomer;
    } else {
        order.status = BusinessOrderRequestStatus.RequestCancelledByCustomer;
    }
    updateBusinessOrderRequest(order);

    notify(mezAdmins, businessOperators, order);
}

function errorChecks(order: BusinessOrder, userId: number, handleRequestDetails: HandleRequestDetails) {
    if (order.customerId != userId) {
        throw new HttpsError(
            "internal",
            `Order does not belong to customer`
        );
    }
    if (handleRequestDetails.requestConfirmed && order.status != BusinessOrderRequestStatus.RequestApprovedByBusiness) {
        throw new HttpsError(
            "internal",
            "request already confirmed or cancelled"
        );
    }
}

function notify(mezAdmins: MezAdmin[], businessOperators: Operator[], order: BusinessOrder) {
    let notification: Notification = {
      foreground: <BusinessStatusChangeNotification>{
            status: order.status,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.OrderStatusChange,
            orderType: OrderType.Business,
            notificationAction: NotificationAction.ShowPopUp,
            orderId: order.orderId
      },
        background: order.status == BusinessOrderRequestStatus.RequestConfirmedByCustomer ? {
            [Language.ES]: {
                title: "Solicitud confirmada",
                body: `La solicitud de pedido ha sido confirmada por el cliente.`
            },
            [Language.EN]: {
                title: "Request confirmed",
                body: `Order request has been confirmed by the customer`
            }
        } : {
            [Language.ES]: {
                title: "Solicitud cancelada",
                body: `La solicitud de pedido ha sido cancelada por el cliente.`
            },
            [Language.EN]: {
                title: "Request cancelled",
                body: `Order request has been cancelled by the customer`
            }
        },
        linkUrl: orderUrl(OrderType.Business, order.orderId)
    };
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
    businessOperators.forEach((r) => {
        pushNotification(r.user?.firebaseId!, notification, r.notificationInfo, ParticipantType.BusinessOperator);
    });
    return notification;
  }
  