import { setLaundryOrderChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getLaundryStore } from "../shared/graphql/laundry/getLaundry";
import { createLaundryOrder } from "../shared/graphql/laundry/order/createLaundryOrder";
import { getLaundryOrder } from "../shared/graphql/laundry/order/getLaundryOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { notifyDeliveryDrivers } from "../shared/helper";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language, MezError } from "../shared/models/Generic/Generic";
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { LaundryOrder, NewLaundryOrderNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import { ServiceProvider } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { PaymentDetails, updateOrderIdAndFetchPaymentInfo } from "../utilities/stripe/payment";

export interface DeliveryRequestDetails {
    orderId: number,
}
export interface ReqDeliveryResponse {
    success: boolean,
    error?: ReqDeliveryError
    unhandledError?: string,
    orderId?: number
}
export enum ReqDeliveryError {
    UnhandledError = "unhandledError",
    
}

export async function requestLaundryDelivery(customerId: number, deliveryRequestDetails: DeliveryRequestDetails): Promise<ReqDeliveryResponse> {
    try {
        let response = await Promise.all([
            getLaundryOrder(deliveryRequestDetails.orderId), 
            getCustomer(customerId),
        ])
        let laundryOrder: LaundryOrder = response[0];
        let customer: CustomerInfo = response[1];

        errorChecks(laundryStore, deliveryRequestDetails);
        
        

        setLaundryOrderChatInfo(orderResponse.laundryOrder, laundryStore, orderResponse.fromCustomerDeliveryOrder, customer);

        // assign delivery company 
        if(orderResponse.laundryOrder.deliveryType == DeliveryType.Delivery && laundryStore.deliveryDetails.selfDelivery == false) {

            notifyDeliveryDrivers(orderResponse.fromCustomerDeliveryOrder);
        }

        notify(orderResponse.laundryOrder, laundryStore, mezAdmins);

        // payment
        if(deliveryRequestDetails.paymentType == PaymentType.Card) {
            let paymentDetails: PaymentDetails = {
                orderId: orderResponse.laundryOrder.orderId!,
                serviceProviderDetailsId: laundryStore.serviceProviderDetailsId
            }
            await updateOrderIdAndFetchPaymentInfo(paymentDetails, deliveryRequestDetails.stripePaymentId!, deliveryRequestDetails.stripeFees ?? 0)
        }
        
        return {
            success: true,
            orderId: orderResponse.laundryOrder.orderId
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(ReqDeliveryError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: ReqDeliveryError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}

function errorChecks(laundryStore: ServiceProvider, laundryRequestDetails: LaundryRequestDetails) {

    if(laundryStore.approved == false) {
        throw new MezError(ReqLaundryError.LaundryStoreNotApproved);
    }
    if(laundryStore.openStatus != "open") {
        throw new MezError(ReqLaundryError.StoreClosed);
    }
    if(laundryRequestDetails.deliveryType == DeliveryType.Delivery && laundryStore.deliveryDetails.deliveryAvailable == false) {
        throw new MezError(ReqLaundryError.DeliveryNotAvailable);
    }
}
async function notify(laundryOrder: LaundryOrder, laundryStore: ServiceProvider, mezAdmins: MezAdmin[]) {

    let notification: Notification = {
        foreground: <NewLaundryOrderNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.NewOrder,
            orderType: OrderType.Laundry,
            orderId: laundryOrder.orderId,
            notificationAction: NotificationAction.ShowSnackBarAlways,
            laundryStore: {
                name: laundryStore.name,
                image: laundryStore.image,
                id: laundryStore.id
            }
        },
        background: {
            [Language.ES]: {
                title: "Nueva Pedido",
                body: `Hay un nuevo pedido de lavandería.`
            },
            [Language.EN]: {
                title: "New Order",
                body: `There is a new laundry order`
            }
        },
        linkUrl: orderUrl(OrderType.Laundry, laundryOrder.orderId!)
    }
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
    if(laundryStore.operators != undefined) {
        laundryStore.operators.forEach((l) => {
          if(l.user) {
            pushNotification(l.user.firebaseId, notification, l.notificationInfo, ParticipantType.LaundryOperator);
          }
        });
    }
}
  

let laundryStore: ServiceProvider = await getLaundryStore(order.storeId);
        
        let toCustomerDeliveryOrder: DeliveryOrder = await createLaundryToCustomerDeliveryOrder(order, laundryStore, fromCustomerDeliveryOrder);
        setLaundryToCustomerDeliveryOrderChatInfo(order, laundryStore, toCustomerDeliveryOrder, customer);

        if(laundryStore.deliveryDetails.selfDelivery == false)
          notifyDeliveryDrivers(toCustomerDeliveryOrder);
        notify(customer);