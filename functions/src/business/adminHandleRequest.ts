import { getBusinessOperatorByUserId } from "../shared/graphql/business/operator/getBusinessOperator";
import { getBusinessOrderRequest } from "../shared/graphql/business/order/getOrderRequest";
import { updateBusinessOrderRequest } from "../shared/graphql/business/order/updateOrderRequest";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { isMezAdmin } from "../shared/helper";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language, MezError } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { CustomerInfo } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { BusinessOrder, BusinessOrderRequestStatus, BusinessStatusChangeNotification } from "../shared/models/Services/Business/BusinessOrder";
import { Operator } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface HandleRequestDetails {
    orderRequestId: number,
    newStatus: BusinessOrderRequestStatus
}
export interface HandleRequestResponse {
    success: boolean,
    error?: HandleRequestError
    unhandledError?: string
    orderId?: number
}
enum HandleRequestError {
    UnhandledError = "unhandledError",
    OrderRequestNotFound = "orderRequestNotFound",
    CustomerNotFound = "customerNotFound",
    BusinessOperatorNotFound = "businessOperatorNotFound",
    IncorrectOrderRequestId = "incorrectOrderRequestId",
    RequestAlreadyConfirmedOrCancelled = "requestAlreadyConfirmedOrCancelled",
    UpdateOrderError = "updateOrderError",
    InvalidStatus = "invalidStatus",
}

export async function handleOrderRequestByAdmin(userId: number, handleRequestDetails: HandleRequestDetails): Promise<HandleRequestResponse> {
    try {
        let order: BusinessOrder = await getBusinessOrderRequest(handleRequestDetails.orderRequestId);
        let customer: CustomerInfo = await getCustomer(order.customerId);

        await errorChecks(userId, order, handleRequestDetails);

        order.status = handleRequestDetails.newStatus;
        updateBusinessOrderRequest(order);

        notifyCustomer(order, customer);
        return {
            success: true
        }
    } catch (e: any) {
        if (e instanceof MezError) {
            if (Object.values(HandleRequestError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: HandleRequestError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
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
        background: order.status == BusinessOrderRequestStatus.Confirmed ? {
            [Language.ES]: {
                title: "Solicitud confirmada",
                body: `Su solicitud de pedido ha sido confirmada`
            },
            [Language.EN]: {
                title: "Request confirmed",
                body: `Your order request has been confirmed`
            }
        } : order.status == BusinessOrderRequestStatus.ModificationRequestByBusiness ? {
            [Language.ES]: {
                title: "Solicitar actualización",
                body: `Su solicitud de pedido tiene algunos cambios. Por favor, compruebe los detalles y confirme la solicitud de nuevo`
            },
            [Language.EN]: {
                title: "Request update",
                body: `Your order request has some changes. Please check the details and confirm the request again`
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
            throw new MezError(HandleRequestError.IncorrectOrderRequestId);
        }
    }
    if (handleRequestDetails.newStatus != BusinessOrderRequestStatus.Confirmed 
        &&  handleRequestDetails.newStatus != BusinessOrderRequestStatus.CancelledByBusiness
        &&  handleRequestDetails.newStatus != BusinessOrderRequestStatus.ModificationRequestByBusiness) {
        throw new MezError(HandleRequestError.InvalidStatus);
    }
    if (handleRequestDetails.newStatus != BusinessOrderRequestStatus.CancelledByBusiness 
        && order.status != BusinessOrderRequestStatus.RequestReceived) {
        throw new MezError(HandleRequestError.RequestAlreadyConfirmedOrCancelled);
    }
    
}
