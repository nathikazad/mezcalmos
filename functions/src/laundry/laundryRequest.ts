import { HttpsError } from "firebase-functions/v1/auth";
import { deliveryNewOrderMessage } from "../delivery/bgNotificationMessages";
import { setLaundryOrderChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { updateDeliveryOrderCompany } from "../shared/graphql/delivery/updateDelivery";
import { getLaundryStore } from "../shared/graphql/laundry/getLaundry";
import { createLaundryOrder } from "../shared/graphql/laundry/order/createLaundryOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { CustomerAppType, Language, Location } from "../shared/models/Generic/Generic";
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType, OrderNotification } from "../shared/models/Notification";
import { LaundryOrder, NewLaundryOrderNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import { ServiceProvider } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { PaymentDetails, updateOrderIdAndFetchPaymentInfo } from "../utilities/stripe/payment";

export interface LaundryRequestDetails {
    storeId: number,
    paymentType: PaymentType,  
    deliveryType: DeliveryType,
    customerLocation: Location,
    deliveryCost: number,
    customerAppType: CustomerAppType,
    notes?: string,
    tax?: number,
    scheduledTime?: string,
    stripeFees?: number,
    stripePaymentId?: string,
    discountValue?: number,
    tripDistance: number,
    tripDuration: number,
    tripPolyline: string
}
export interface ReqLaundryResponse {
    orderId: number
}

export async function requestLaundry(customerId: number, laundryRequestDetails: LaundryRequestDetails): Promise<ReqLaundryResponse> {
    let response = await Promise.all([
        getLaundryStore(laundryRequestDetails.storeId), 
        getCustomer(customerId),
        getMezAdmins()
    ])
    let laundryStore: ServiceProvider = response[0];
    let customer: CustomerInfo = response[1];
    let mezAdmins: MezAdmin[] = response[2];

    errorChecks(laundryStore, laundryRequestDetails);
    
    let orderResponse = await createLaundryOrder(customerId, laundryRequestDetails, laundryStore, mezAdmins);

    setLaundryOrderChatInfo(orderResponse.laundryOrder, laundryStore, orderResponse.fromCustomerDeliveryOrder, customer);

    // assign delivery company 
    if(orderResponse.laundryOrder.deliveryType == DeliveryType.Delivery && laundryStore.deliveryDetails.selfDelivery == false) {

        updateDeliveryOrderCompany(orderResponse.laundryOrder.fromCustomerDeliveryId!, laundryStore.deliveryPartnerId!);
    }

    notify(orderResponse.laundryOrder, laundryStore, mezAdmins);

    // payment
    if(laundryRequestDetails.paymentType == PaymentType.Card) {
        let paymentDetails: PaymentDetails = {
            orderId: orderResponse.laundryOrder.orderId!,
            serviceProviderDetailsId: laundryStore.serviceProviderDetailsId
        }
        await updateOrderIdAndFetchPaymentInfo(paymentDetails, laundryRequestDetails.stripePaymentId!, laundryRequestDetails.stripeFees ?? 0)
    }
    
    return {
        orderId: orderResponse.laundryOrder.orderId!
    }
}

function errorChecks(laundryStore: ServiceProvider, laundryRequestDetails: LaundryRequestDetails) {

    if(laundryStore.approved == false) {
      throw new HttpsError(
        "internal",
        "Laundry store is not approved and taking orders right now"
      );
    }
    if(laundryStore.openStatus != "open") {
      throw new HttpsError(
        "internal",
        "Laundry store is closed"
      );
    }
    if(laundryRequestDetails.deliveryType == DeliveryType.Delivery) {
        if(laundryStore.deliveryDetails.deliveryAvailable) {
            if(!(laundryStore.deliveryDetails.selfDelivery)) {
                if(laundryStore.deliveryPartnerId == null) {
                    throw new HttpsError(
                        "internal",
                        "No delivery partner"
                    );
                }
            }
        } else {
            throw new HttpsError(
                "internal",
                "Laundry store not accepting delivery orders"
            );
        }
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
    if(laundryOrder.deliveryType == DeliveryType.Delivery && laundryStore.deliveryDetails.selfDelivery == false) {
        let deliveryOperators = await getDeliveryOperators(laundryStore.deliveryPartnerId!);

        let fromCustomerNotification: Notification = {
            foreground: <OrderNotification>{
                time: (new Date()).toISOString(),
                notificationType: NotificationType.NewOrder,
                orderType: OrderType.Laundry,
                notificationAction: NotificationAction.ShowPopUp,
                orderId: laundryOrder.fromCustomerDeliveryId
            },
            background: deliveryNewOrderMessage,
            linkUrl: `/orders/${laundryOrder.fromCustomerDeliveryId}`
        }
        deliveryOperators.forEach((d) => {
            pushNotification(d.user?.firebaseId!, fromCustomerNotification, d.notificationInfo, ParticipantType.DeliveryOperator);
        });
    }

}
  