import { getBusinessOperators } from "../shared/graphql/business/operator/getBusinessOperator";
import { getBusinessOrderRequest } from "../shared/graphql/business/order/getOrderRequest";
import { updateBusinessOrderRequest } from "../shared/graphql/business/order/updateOrderRequest";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language, MezError } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { MezAdmin } from "../shared/models/Generic/User";
import { NotificationType, NotificationAction, Notification } from "../shared/models/Notification";
import { BusinessOrder, BusinessOrderRequestStatus, BusinessStatusChangeNotification } from "../shared/models/Services/Business/BusinessOrder";
import { Operator } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";

interface CustomerHandleRequestDetails {
    orderRequestId: number,
    requestConfirmed: boolean,
}
export interface CustomerHandleRequestResponse {
    success: boolean,
    error?: CustomerHandleRequestError
    unhandledError?: string
}
enum CustomerHandleRequestError {
    UnhandledError = "unhandledError",
    OrderRequestNotFound = "orderRequestNotFound",
    BusinessNotFound = "businessNotFound",
    IncorrectOrderRequestId = "incorrectOrderRequestId",
    RequestAlreadyConfirmedOrCancelled = "requestAlreadyConfirmedOrCancelled",
    UpdateStatusError = "updateStatusError"
}

export async function handleOrderRequestFromCustomer(userId: number, handleRequestDetails: CustomerHandleRequestDetails): Promise<CustomerHandleRequestResponse> {
    try {
        let order: BusinessOrder = await getBusinessOrderRequest(handleRequestDetails.orderRequestId);

        let promiseResponse = await Promise.all([
            getMezAdmins(), 
            getBusinessOperators(order.businessId)
        ]);

        let mezAdmins: MezAdmin[] = promiseResponse[0];
        let businessOperators: Operator[] = promiseResponse[1];

        errorChecks(order, userId, handleRequestDetails); 

        if(handleRequestDetails.requestConfirmed) {
            order.status = BusinessOrderRequestStatus.ConfirmedByCustomer;
        } else {
            order.status = BusinessOrderRequestStatus.CancelledByCustomer;
        }
        updateBusinessOrderRequest(order);

        notify(mezAdmins, businessOperators, order);

        return {
            success: true
        }
    } catch (e: any) {
        if (e instanceof MezError) {
            if (Object.values(CustomerHandleRequestError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: CustomerHandleRequestError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}

function errorChecks(order: BusinessOrder, userId: number, handleRequestDetails: CustomerHandleRequestDetails) {
    if (order.orderDetails.customerId != userId) {
        throw new MezError(CustomerHandleRequestError.IncorrectOrderRequestId);
    }
    if (handleRequestDetails.requestConfirmed && order.status != BusinessOrderRequestStatus.ApprovedByBusiness) {
        throw new MezError(CustomerHandleRequestError.RequestAlreadyConfirmedOrCancelled);
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
            orderId: order.orderDetails.orderId
      },
        background: order.status == BusinessOrderRequestStatus.ConfirmedByCustomer ? {
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
        linkUrl: orderUrl(OrderType.Business, order.orderDetails.orderId)
    };
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
    businessOperators.forEach((r) => {
        pushNotification(r.user?.firebaseId!, notification, r.notificationInfo, ParticipantType.BusinessOperator);
    });
    return notification;
  }
  