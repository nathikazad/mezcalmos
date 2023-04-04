import { getBusinessOperatorByUserId } from "../shared/graphql/business/operator/getBusinessOperator";
import { getBusinessOrderRequest } from "../shared/graphql/business/order/getOrderRequest";
import { confirmBusinessOrderFromOperator, updateBusinessOrderRequest } from "../shared/graphql/business/order/updateOrderRequest";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { isMezAdmin } from "../shared/helper";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language, MezError } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { CustomerInfo } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { TimeUnit } from "../shared/models/Services/Business/Business";
import { BusinessOrder, BusinessOrderRequestStatus, BusinessStatusChangeNotification } from "../shared/models/Services/Business/BusinessOrder";
import { Operator } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface HandleRequestDetails {
    orderRequestId: number,
    requestConfirmed: boolean,
    itemIdToFinalCostPerOne?: Record<number, number>;
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
    UpdateStatusError = "updateStatusError",
    FinalCostsNotSet = "finalCostsNotSet"
}

export async function handleOrderRequestByAdmin(userId: number, handleRequestDetails: HandleRequestDetails): Promise<HandleRequestResponse> {
    try {
        let order: BusinessOrder = await getBusinessOrderRequest(handleRequestDetails.orderRequestId);
        let customer: CustomerInfo = await getCustomer(order.orderDetails.customerId);

        await errorChecks(userId, order, handleRequestDetails);

        if(handleRequestDetails.requestConfirmed) {
            
            order.status = BusinessOrderRequestStatus.ApprovedByBusiness;
            let finalCost = 0;
            order.items.forEach((i) => {
                i.cost.finalCostPerOne = handleRequestDetails.itemIdToFinalCostPerOne![i.id];
                switch (i.cost.timeUnit) {
                    case TimeUnit.PerHour:
                        finalCost += (i.cost.finalCostPerOne 
                                    * Math.ceil((new Date(i.cost.fromTime).valueOf() - new Date(i.cost.toTime).valueOf()) / (1000 * 60 * 60)) 
                                    * i.cost.quantity);
                        break;
                    case TimeUnit.PerDay:
                        finalCost += (i.cost.finalCostPerOne 
                                    * Math.ceil((new Date(i.cost.fromTime).valueOf() - new Date(i.cost.toTime).valueOf()) / (1000 * 60 * 60 * 24)) 
                                    * i.cost.quantity);
                        break;
                    default:
                        finalCost += i.cost.finalCostPerOne * i.cost.quantity;
                        break;
                }
            });
            order.finalCost = finalCost;
            confirmBusinessOrderFromOperator(order);
        } else {
            order.status = BusinessOrderRequestStatus.CancelledByBusiness;
            updateBusinessOrderRequest(order)
        }

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
            orderId: order.orderDetails.orderId,
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
        linkUrl: orderUrl(OrderType.Business, order.orderDetails.orderId)
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
    if(handleRequestDetails.requestConfirmed) {
        if (order.status != BusinessOrderRequestStatus.RequestReceived) {
            throw new MezError(HandleRequestError.RequestAlreadyConfirmedOrCancelled);
        }
        if(handleRequestDetails.itemIdToFinalCostPerOne == null) {
            throw new MezError(HandleRequestError.FinalCostsNotSet);
        }
    }
}