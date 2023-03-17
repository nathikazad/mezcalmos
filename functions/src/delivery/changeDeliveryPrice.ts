import { HttpsError } from "firebase-functions/v1/auth";
import { getCourierOrder, getCourierOrderFromDelivery } from "../shared/graphql/delivery/courier/getCourierOrder";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { updateDeliveryChangePriceRequest } from "../shared/graphql/delivery/updateDelivery";
import { getLaundryOperators } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { getLaundryOrder, getLaundryOrderFromDelivery } from "../shared/graphql/laundry/order/getLaundryOrder";
import { updateLaundryOrderDeliveryCost } from "../shared/graphql/laundry/order/updateOrder";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { getRestaurantOrder, getRestaurantOrderFromDelivery } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { updateRestaurantOrderDeliveryCost } from "../shared/graphql/restaurant/order/updateOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { ChangePriceStatus, DeliveryDriver, DeliveryOperator, DeliveryOrder, DeliveryOrderStatus, DeliveryServiceProviderType, PriceChangeApprovalNotification } from "../shared/models/Generic/Delivery";
import { OrderType } from "../shared/models/Generic/Order";
import { CustomerInfo } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType, OrderNotification } from "../shared/models/Notification";
import { CourierOrder } from "../shared/models/Services/Courier/Courier";
import { LaundryOrder } from "../shared/models/Services/Laundry/LaundryOrder";
import { RestaurantOrder } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { Operator } from "../shared/models/Services/Service";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface ChangePriceDetails {
    deliveryOrderId: number,
    newPrice: number,
    reason: string,
}

export async function changeDeliveryPrice(userId: number, changePriceDetails: ChangePriceDetails) {
    
    let deliveryOrder: DeliveryOrder = await getDeliveryOrder(changePriceDetails.deliveryOrderId);

    priceChangeRequestErrorCheck(deliveryOrder, userId);

    deliveryOrder.changePriceRequest = {
        newPrice: changePriceDetails.newPrice,
        oldPrice: deliveryOrder.deliveryCost,
        reason: changePriceDetails.reason,
        status: ChangePriceStatus.Requested
    }
    await updateDeliveryChangePriceRequest(deliveryOrder);

    await notifyPriceChangeRequest(deliveryOrder);
}

interface ChangePriceResponseDetails {
    accepted: boolean,
    orderId: number,
    orderType: OrderType,
}

export async function changeDeliveryPriceResponse(userId: number, changePriceResponseDetails: ChangePriceResponseDetails) {
    //check order
    //accepted -> mutation to change delivery price of delivery and sp order
    //rejected -> remove driver
    //notify driver

    let customerId: number;
    let deliveryOrder: DeliveryOrder;
    switch (changePriceResponseDetails.orderType) {
        case OrderType.Restaurant:
            let restaurantOrder: RestaurantOrder = await getRestaurantOrder(changePriceResponseDetails.orderId);
            customerId = restaurantOrder.customerId;
            deliveryOrder = await getDeliveryOrder(restaurantOrder.deliveryId!);
            break;
        case OrderType.Laundry:
            let laundryOrder: LaundryOrder = await getLaundryOrder(changePriceResponseDetails.orderId);
            customerId = laundryOrder.customerId;
            if(laundryOrder.toCustomerDeliveryId)
                deliveryOrder = await getDeliveryOrder(laundryOrder.toCustomerDeliveryId);
            else
                deliveryOrder = await getDeliveryOrder(laundryOrder.fromCustomerDeliveryId!);
            break;
        default:
            let courierOrder: CourierOrder = await getCourierOrder(changePriceResponseDetails.orderId);
            customerId = courierOrder.customerId;
            deliveryOrder = courierOrder.deliveryOrder;
            break;
    }
    if(userId != customerId) {
        throw new HttpsError(
            "internal",
            `Order does not belong to this customer`,
        );
    }
    if(deliveryOrder.changePriceRequest == null) {
        throw new HttpsError(
            "internal",
            `change price request not set`,
        );
    }
    if(changePriceResponseDetails.accepted) {

        deliveryOrder.changePriceRequest.status = ChangePriceStatus.Accepted;
        deliveryOrder.deliveryCost = deliveryOrder.changePriceRequest.newPrice;
        updateDeliveryChangePriceRequest(deliveryOrder);

        switch (changePriceResponseDetails.orderType) {
            case OrderType.Restaurant:
                updateRestaurantOrderDeliveryCost(changePriceResponseDetails.orderId, deliveryOrder.deliveryCost);
                break;
            case OrderType.Laundry:
                updateLaundryOrderDeliveryCost(changePriceResponseDetails.orderId, deliveryOrder);
                break;
            default:
                break;
        }
    } else {
        deliveryOrder.changePriceRequest.status = ChangePriceStatus.Rejected;
        updateDeliveryChangePriceRequest(deliveryOrder);
    }

    notifyDriver(deliveryOrder.deliveryDriverId!, changePriceResponseDetails.accepted);
}

async function notifyDriver(deliveryDriverId: number, accepted: boolean) {
    let deliveryDriver: DeliveryDriver = await getDeliveryDriver(deliveryDriverId);

    let notification: Notification = {
        foreground: <PriceChangeApprovalNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.PriceChange,
            notificationAction: NotificationAction.ShowPopUp,
            accepted: accepted
            // deliveryDriverType: assignDriverDetails.deliveryDriverType
        },
        background: (accepted) ? {
            en: {
                title: `Price change approved`,
                body: `Your request to change delivery price has been accepted`
            },
            es: {
                title: `Cambio de precio aprobado`,
                body: `Su solicitud para cambiar el precio de envío ha sido aceptada`
            }
        } : {
            en: {
                title: `Price change rejected`,
                body: `Your request to change delivery price has been denied`
            },
            es: {
                title: `Cambio de precio rechazado`,
                body: `Su solicitud para cambiar el precio de envío ha sido denegada`
            }
        },
        linkUrl: '/'
    };

    pushNotification(
        deliveryDriver.user!.firebaseId!,
        notification,
        deliveryDriver.notificationInfo,
        ParticipantType.DeliveryDriver
    );
}

async function notifyPriceChangeRequest(deliveryOrder: DeliveryOrder) {
    let orderId: number;
    switch (deliveryOrder.orderType) {
        case OrderType.Restaurant:
            let restaurantOrder: RestaurantOrder = await getRestaurantOrderFromDelivery(deliveryOrder.deliveryId);
            orderId = restaurantOrder.orderId;
            break;
        case OrderType.Laundry:
            let laundryOrder: LaundryOrder = await getLaundryOrderFromDelivery(deliveryOrder);
            orderId = laundryOrder.orderId;
            break;
        default:
            let courierOrder: CourierOrder = await getCourierOrderFromDelivery(deliveryOrder);
            orderId = courierOrder.id;
            break;
    }
    let customer: CustomerInfo = await getCustomer(deliveryOrder.customerId);
    let notification: Notification = {
        foreground: <OrderNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.PriceChange,
            orderType: deliveryOrder.orderType,
            notificationAction: NotificationAction.ShowSnackBarAlways,
            orderId
        },
        background: {
            en: {
                title: `Delivery price change request`,
                body: `Driver is requesting change in delivery price`
            },
            es: {
                title: `Solicitud de cambio de precio de entrega`,
                body: `El conductor está solicitando un cambio en el precio de entrega`
            }
        },
        linkUrl: `/`
    };
    pushNotification(
        customer.firebaseId,
        notification,
        customer.notificationInfo,
        ParticipantType.Customer,
        customer.language
    );
    notification = {
        foreground: <OrderNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.PriceChange,
            notificationAction: NotificationAction.ShowSnackBarAlways,
            orderId: deliveryOrder.deliveryId
        },
        background: {
            en: {
                title: `Delivery price change request`,
                body: `Driver is requesting change in delivery price`
            },
            es: {
                title: `Solicitud de cambio de precio de entrega`,
                body: `El conductor está solicitando un cambio en el precio de entrega`
            }
        },
        linkUrl: `/`
    };
    switch (deliveryOrder.serviceProviderType) {
        case DeliveryServiceProviderType.DeliveryCompany:
            let deliveryOperators: DeliveryOperator[] = await getDeliveryOperators(deliveryOrder.serviceProviderId);
            deliveryOperators.forEach((d) => {
                if (d.user) {
                    pushNotification(
                        d.user.firebaseId,
                        notification,
                        d.notificationInfo,
                        ParticipantType.DeliveryOperator
                    );
                }
            });
            break;
        case DeliveryServiceProviderType.Restaurant:
            let restaurantOperators: Operator[] = await getRestaurantOperators(deliveryOrder.serviceProviderId);
            restaurantOperators.forEach((o) => {
                if (o.owner && o.user) {
                    pushNotification(
                        o.user.firebaseId,
                        notification,
                        o.notificationInfo,
                        ParticipantType.RestaurantOperator,
                        o.user.language
                    );
                }
            });
            break;
            case DeliveryServiceProviderType.Laundry:
            let laundryOperators: Operator[] = await getLaundryOperators(deliveryOrder.serviceProviderId);
            laundryOperators.forEach((o) => {
                if (o.owner && o.user) {
                    pushNotification(
                        o.user.firebaseId,
                        notification,
                        o.notificationInfo,
                        ParticipantType.LaundryOperator,
                        o.user.language
                    );
                }
            });
            break;
        default:
            break;
    }
}

function priceChangeRequestErrorCheck(deliveryOrder: DeliveryOrder, userId: number) {
    if (deliveryOrder.deliveryDriver == null || deliveryOrder.deliveryDriver.userId != userId) {
        throw new HttpsError(
            "internal",
            `Driver ID order ID mismatch`
        );
    }
    if (deliveryOrder.status != DeliveryOrderStatus.OrderReceived) {
        throw new HttpsError(
            "internal",
            `Status not order received`
        );
    }
    if (deliveryOrder.changePriceRequest) {
        throw new HttpsError(
            "internal",
            `price change already requested`
        );
    }
}