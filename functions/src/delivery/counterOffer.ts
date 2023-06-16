import { getCourierOrderFromDelivery } from "../shared/graphql/delivery/courier/getCourierOrder";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { updateDeliveryCounterOffers } from "../shared/graphql/delivery/updateDelivery";
import { getLaundryOrderFromDelivery } from "../shared/graphql/laundry/order/getLaundryOrder";
import { getRestaurantOrderFromDelivery } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { CounterOfferStatus, DeliveryDriver, DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { AuthorizationStatus, MezError } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { CustomerInfo } from "../shared/models/Generic/User";
import { OrderNotification, NotificationType, NotificationAction, Notification } from "../shared/models/Notification";
import { CourierOrder } from "../shared/models/Services/Courier/Courier";
import { LaundryOrder } from "../shared/models/Services/Laundry/LaundryOrder";
import { RestaurantOrder } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface CounterOfferRequest {
    deliveryOrderId: number,
    deliveryDriverId: number,
    newPrice: number,
}
export interface CounterOfferResponse {
    success: boolean,
    error?: CounterOfferError
    unhandledError?: string,

}
export enum CounterOfferError {
    UnhandledError = "unhandledError",
    OrderNotFound = "orderNotFound",
    DriverNotFound = "driverNotFound",
    DriverAlreadyAssigned = "driverAlreadyAssigned",
    InvalidDriverId = "invalidDriverId",
    StatusNotOrderReceived = "statusNotOrderReceived",
    DriverUnAuthorized = "driverUnAuthorized",
    DriverCompanyNotChosen = "driverCompanyNotChosen",
    CustomerNotFound = "customerNotFound",
}
export async function requestCounterOffer(userId: number, counterOfferRequest: CounterOfferRequest): Promise<CounterOfferResponse> {
    try {
        let deliveryOrder: DeliveryOrder = await getDeliveryOrder(counterOfferRequest.deliveryOrderId);
        let deliveryDriver: DeliveryDriver = await getDeliveryDriver(counterOfferRequest.deliveryDriverId);

        counterOfferErrorCheck(deliveryOrder, deliveryDriver, userId);

        deliveryOrder.counterOffers = deliveryOrder.counterOffers || {};
        deliveryOrder.counterOffers[deliveryDriver.id] = {
            price: counterOfferRequest.newPrice,
            status: CounterOfferStatus.Requested,
            time: (new Date()).toISOString(),
            expiryTime: (new Date(Date.now() + 1000 * 60 * 5)).toISOString(),
        }
        
        updateDeliveryCounterOffers(deliveryOrder);

        notifyCounterOffer(deliveryOrder)
        return {
            success: true,
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(CounterOfferError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: CounterOfferError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
        throw e
        }
    }
}

function counterOfferErrorCheck(deliveryOrder: DeliveryOrder, deliveryDriver: DeliveryDriver, userId: number) {
    if(deliveryOrder.deliveryDriver) {
        throw new MezError(CounterOfferError.DriverAlreadyAssigned);
    }
    if(deliveryDriver.userId != userId) {
        throw new MezError(CounterOfferError.InvalidDriverId);
    }
    if (deliveryOrder.status != DeliveryOrderStatus.OrderReceived) {
        throw new MezError(CounterOfferError.StatusNotOrderReceived);
    }
    if(deliveryDriver.status != AuthorizationStatus.Authorized) {
        throw new MezError(CounterOfferError.DriverUnAuthorized);
    }
    if(deliveryOrder.chosenCompanies?.find(id => id == deliveryDriver.deliveryCompanyId) == undefined) {
        throw new MezError(CounterOfferError.DriverCompanyNotChosen);
    }
}

async function notifyCounterOffer(deliveryOrder: DeliveryOrder) {
    let customer: CustomerInfo = await getCustomer(deliveryOrder.customerId);
    let orderId: number;
    let linkUrlForCustomer: string;
    switch (deliveryOrder.orderType) {
        case OrderType.Restaurant:
            let restaurantOrder: RestaurantOrder = await getRestaurantOrderFromDelivery(deliveryOrder.deliveryId);
            orderId = restaurantOrder.orderId;
            linkUrlForCustomer = `/restaurantOrders/${orderId}`;
            break;
        case OrderType.Laundry:
            let laundryOrder: LaundryOrder = await getLaundryOrderFromDelivery(deliveryOrder);
            orderId = laundryOrder.orderId;
            linkUrlForCustomer = `/laundryOrders/${orderId}`;
            break;
        default:
            let courierOrder: CourierOrder = await getCourierOrderFromDelivery(deliveryOrder);
            orderId = courierOrder.id;
            linkUrlForCustomer = `/courierOrders/${orderId}`;
            break;
    }

    let notification: Notification = {
        foreground: <OrderNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.NewCounterOffer,
            orderType: deliveryOrder.orderType,
            notificationAction: NotificationAction.NavigteToLinkUrl,
            orderId
        },
        background: {
            en: {
                title: `Delivery Counter Offer`,
                body: `Driver is requesting counter offer in delivery price`
            },
            es: {
                title: `Oferta de mostrador de entrega`,
                body: `El conductor está solicitando una contraoferta en el precio de entrega.`
            }
        },
        linkUrl: linkUrlForCustomer
    };
    pushNotification(
        customer.firebaseId,
        notification,
        customer.notificationInfo,
        ParticipantType.Customer,
        customer.language
    );

}