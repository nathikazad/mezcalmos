import { MezError } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { orderInProcess, TaxiOrder, TaxiOrderStatus, TaxiOrderStatusChangeNotification, } from "../shared/models/Services/Taxi/TaxiOrder";
import { getTaxiOrder } from "../shared/graphql/taxi/order/getTaxiOrder";
import { isMezAdmin, notifyTaxiDrivers } from "../shared/helper";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { CustomerInfo } from "../shared/models/Generic/User";
import { unassignTaxiDriver, updateTaxiOrderStatus } from "../shared/graphql/taxi/order/updateOrder";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";
// import { ParticipantType } from "../shared/models/Generic/Chat";

const statusArrayInSeq: Array<TaxiOrderStatus> = [
    TaxiOrderStatus.OrderReceived,
    TaxiOrderStatus.OnTheWayToPickup,
    TaxiOrderStatus.AtPickup,
    TaxiOrderStatus.OnTheWayToDropoff,
    TaxiOrderStatus.AtDropoff,
    TaxiOrderStatus.RideComplete
];

function checkExpectedStatus(currentStatus: TaxiOrderStatus, newStatus: TaxiOrderStatus) {
    // if(newStatus == TaxiOrderStatus.CancelledByAdmin 
    //     || newStatus == TaxiOrderStatus.CancelledByDriver 
    //     || newStatus == TaxiOrderStatus.CancelledByCustomer
    // ) {
    //     if(!statusArrayInSeq.slice(0, -1).includes(currentStatus)) {
    //         throw new MezError(ChangeTaxiStatusError.OrderNotInProcess);
    //     }
    //     return;
    // }
    if (currentStatus != statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == newStatus) - 1]) {
        throw new MezError(ChangeTaxiStatusError.InvalidStatus);
    }
}

export interface ChangeTaxiStatusDetails {
    orderId: number,
    newStatus: TaxiOrderStatus
}
export interface ChangeTaxiStatusResponse {
    success: boolean,
    error?: ChangeTaxiStatusError
    unhandledError?: string,
}

enum ChangeTaxiStatusError {
    UnhandledError = "unhandledError",
    OrderNotFound = "orderNotFound",
    CannotCancelByDriver = "cannotCancelByDriver",
    UnauthorizedAccess = "unauthorizedAccess",
    DriverNotAssigned = "driverNotAssigned",
    CustomerNotFound = "customerNotFound",
    OrderNotInProcess = "orderNotInProcess",
    InvalidStatus = "invalidStatus",
    NoTaxiCompanyFound = "noTaxiCompanyFound",
    TaxiCompaniesHaveNoDrivers  = "taxiCompaniesHaveNoDrivers",
    // OrderStripeInfoNotDefined = "orderStripeInfoNotDefined",
    // ServiceProviderStripeAccountDoesNotExist = "serviceProviderStripeAccountDoesNotExist",
    // UpdateOrderStripeError = "updateOrderStripeError",
}


export async function changeTaxiStatus(userId: number, changeTaxiStatusDetails: ChangeTaxiStatusDetails): Promise<ChangeTaxiStatusResponse> {
    try {
        let order: TaxiOrder = await getTaxiOrder(changeTaxiStatusDetails.orderId);

        await errorChecks(order, userId, changeTaxiStatusDetails.newStatus);

        let customer: CustomerInfo = await getCustomer(order.customerId);

        checkExpectedStatus(order.status, changeTaxiStatusDetails.newStatus);

        order.status = changeTaxiStatusDetails.newStatus;

        if(order.status == TaxiOrderStatus.CancelledByDriver) {
            unassignTaxiDriver(order.id);
            notifyTaxiDrivers(order)
        } else {
            updateTaxiOrderStatus(order);
        }
        notifyTaxiStatusChange(order, customer);

        return {
            success: true
        }
    } catch (e: any) {
        if (e instanceof MezError) {
            if (Object.values(ChangeTaxiStatusError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: ChangeTaxiStatusError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}

async function errorChecks(order: TaxiOrder, userId: number, newStatus: TaxiOrderStatus) {
    if (!orderInProcess(order.status)) {
        throw new MezError(ChangeTaxiStatusError.OrderNotInProcess);
    }
    if (!(await isMezAdmin(userId))) {
        if (order.customerId == userId) {
            if(newStatus != TaxiOrderStatus.CancelledByCustomer)
                throw new MezError(ChangeTaxiStatusError.UnauthorizedAccess);
            return;
        }
        if (order.driver == null) {
            throw new MezError(ChangeTaxiStatusError.DriverNotAssigned);
        }
        if(userId != order.driver.userId)
            throw new MezError(ChangeTaxiStatusError.UnauthorizedAccess);
        else if(newStatus == TaxiOrderStatus.CancelledByDriver && statusArrayInSeq.findIndex((element) => element == order.status) > 2)
            throw new MezError(ChangeTaxiStatusError.CannotCancelByDriver);
    }
}

async function notifyTaxiStatusChange(taxiOrder: TaxiOrder, customer: CustomerInfo) {
    let notification: Notification = {
        foreground: <TaxiOrderStatusChangeNotification>{
            status: taxiOrder.status,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.OrderStatusChange,
            orderType: OrderType.Taxi,
            notificationAction: NotificationAction.ShowSnackBarAlways,
            orderId: taxiOrder.id
        },
        // todo @SanchitUke fix the background message based on Restaurant Order Status
        background: taxiOrderStatusChangeMessages[taxiOrder.status],
        linkUrl: orderUrl(OrderType.Taxi, taxiOrder.id)
    };
    if(taxiOrder.status != TaxiOrderStatus.CancelledByCustomer) {
        pushNotification(
            customer.firebaseId,
            notification,
            customer.notificationInfo,
            ParticipantType.Customer,
            customer.language
        );
    }
    if((taxiOrder.status == TaxiOrderStatus.CancelledByAdmin || taxiOrder.status == TaxiOrderStatus.CancelledByCustomer) && taxiOrder.driver?.user) {
        notification.linkUrl = `/orders/${taxiOrder.id}`;
        pushNotification(taxiOrder.driver.user.firebaseId,
            notification,
            taxiOrder.driver.notificationInfo,
            ParticipantType.TaxiDriver,
            taxiOrder.driver.user.language
        );
    }
}
