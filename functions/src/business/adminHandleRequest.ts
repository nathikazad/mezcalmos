import { HttpsError } from "firebase-functions/v1/auth";
import { getBusinessOperatorByUserId } from "../shared/graphql/business/operator/getBusinessOperator";
import { getBusinessOrderRequest } from "../shared/graphql/business/order/getOrderRequest";
import { confirmBusinessOrderFromOperator, updateBusinessOrderRequest } from "../shared/graphql/business/order/updateOrderRequest";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { isMezAdmin } from "../shared/helper";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { CustomerInfo } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { BusinessOrder, BusinessOrderRequestItem, BusinessOrderRequestStatus, BusinessStatusChangeNotification } from "../shared/models/Services/Business/BusinessOrder";
import { Operator } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface HandleRequestDetails {
    orderRequestId: number,
    requestConfirmed: boolean,
    items?: Array<BusinessOrderRequestItem>;
}

export async function handleOrderRequestByAdmin(userId: number, handleRequestDetails: HandleRequestDetails) {

    let order: BusinessOrder = await getBusinessOrderRequest(handleRequestDetails.orderRequestId);
    let customer: CustomerInfo = await getCustomer(order.customerId);

    await errorChecks(userId, order, handleRequestDetails)

    if(handleRequestDetails.requestConfirmed) {
         
        order.status = BusinessOrderRequestStatus.ApprovedByBusiness;

        handleRequestDetails.items?.forEach((i) => {
            let itemIdx = order.items.findIndex((j) => (i.serviceId == j.serviceId && i.serviceType == j.serviceType));
            order.items[itemIdx].finalCostPerOne = i.finalCostPerOne;
        });
        confirmBusinessOrderFromOperator(order);
    } else {
        order.status = BusinessOrderRequestStatus.CancelledByBusiness;
        updateBusinessOrderRequest(order)
    }

    notifyCustomer(order, customer);
}

function notifyCustomer(order: BusinessOrder, customer: CustomerInfo) {
    let notification: Notification = {
        foreground: <BusinessStatusChangeNotification>{
            status: order.status,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.OrderStatusChange,
            orderType: OrderType.Business,
            notificationAction: order.status != BusinessOrderRequestStatus.CancelledByBusiness
                ? NotificationAction.ShowSnackBarAlways : NotificationAction.ShowPopUp,
            orderId: order.orderId,
        },
        background: order.status == BusinessOrderRequestStatus.ApprovedByBusiness ? {
            [Language.ES]: {
                title: "Solicitud confirmada",
                body: `Su solicitud de pedido ha sido confirmada`
            },
            [Language.EN]: {
                title: "Request confirmed",
                body: `Your order request has been confirmed`
            }
        } : {
            [Language.ES]: {
                title: "Solicitud cancelada",
                body: `Su solicitud de pedido ha sido cancelada`
            },
            [Language.EN]: {
                title: "Request cancelled",
                body: `Your order request has been cancelled`
            }
        },
        linkUrl: orderUrl(OrderType.Business, order.orderId)
    };

    pushNotification(
        customer.firebaseId,
        notification,
        customer.notificationInfo,
        ParticipantType.Customer,
        customer.language
    );
}

async function errorChecks(userId: number, order: BusinessOrder, handleRequestDetails: HandleRequestDetails) {

    if((await isMezAdmin(userId)) == false) {
        let operator: Operator = await getBusinessOperatorByUserId(userId);

        if(operator.serviceProviderId != order.businessId) {
            throw new HttpsError(
                "internal",
                "Only authorized business operators can run this operation"
            );
        }
    }
    if(handleRequestDetails.requestConfirmed) {

        if (order.status != BusinessOrderRequestStatus.RequestReceived) {
            throw new HttpsError(
                "internal",
                "request already confirmed or cancelled"
            );
        } 
    }
}