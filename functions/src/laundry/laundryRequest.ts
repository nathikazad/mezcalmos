import { HttpsError } from "firebase-functions/v1/auth";
import { setLaundryOrderChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getLaundryStore } from "../shared/graphql/laundry/getLaundry";
import { createLaundryOrder } from "../shared/graphql/laundry/order/createLaundryOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { DeliveryOrder } from "../shared/models/Generic/Delivery";
import { CustomerAppType, Language, Location } from "../shared/models/Generic/Generic";
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Laundry } from "../shared/models/Services/Laundry/Laundry";
import { LaundryOrder, LaundryOrderStatus, NewLaundryOrderNotification, OrderCategory } from "../shared/models/Services/Laundry/LaundryOrder";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface LaundryRequestDetails {
    storeId: number,
    paymentType: PaymentType,  
    deliveryType: DeliveryType,
    customerLocation: Location,
    deliveryCost: number,
    status: LaundryOrderStatus,
    categories: Array<number>,
    customerAppType: CustomerAppType,
    notes?: string,
    tax?: number,
    scheduledTime?: string,
    stripeFees?: number,
    discountValue?: number,
    tripDistance: number,
    tripDuration: number,
    tripPolyline: string
}
export interface ReqLaundryResponse {
    orderId: number
}

export async function requestLaundry(customerId: number, laundryRequestDetails: LaundryRequestDetails): Promise<ReqLaundryResponse> {
    let laundryStore: Laundry = await getLaundryStore(laundryRequestDetails.storeId);
    let mezAdmins: MezAdmin[] = await getMezAdmins();
    let customer: CustomerInfo = await getCustomer(customerId);


    errorChecks(laundryStore, laundryRequestDetails);
    
    let categories: OrderCategory[] = laundryRequestDetails.categories.map((c) => {
        return {
            categoryId: c,
        }
    })
    let laundryOrder: LaundryOrder = {
        customerId,
        storeId: laundryRequestDetails.storeId,
        paymentType: laundryRequestDetails.paymentType,
        deliveryType: laundryRequestDetails.deliveryType,
        customerAppType: laundryRequestDetails.customerAppType,
        notes: laundryRequestDetails.notes,
        tax: laundryRequestDetails.tax,
        scheduledTime: laundryRequestDetails.scheduledTime,
        stripeFees: laundryRequestDetails.stripeFees,
        discountValue: laundryRequestDetails.discountValue,
        customerLocation: laundryRequestDetails.customerLocation,
        deliveryCost: laundryRequestDetails.deliveryCost,
        status: LaundryOrderStatus.OrderReceived,
        categories
    }
    let deliveryOrder: DeliveryOrder = await createLaundryOrder(laundryOrder, laundryStore, mezAdmins, laundryRequestDetails);

    setLaundryOrderChatInfo(laundryOrder, laundryStore, deliveryOrder, customer);

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
                body: `There is a new laundry order`
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
    if(laundryStore.laundryOperators != undefined) {
        laundryStore.laundryOperators.forEach((l) => {
          if(l.user) {
            pushNotification(l.user.firebaseId, notification, l.notificationInfo, ParticipantType.LaundryOperator);
          }
        });
    }

    // assign delivery company
    // payment
    return {
        orderId: laundryOrder.orderId!
    }
}

function errorChecks(laundryStore: Laundry, laundryRequestDetails: LaundryRequestDetails) {

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
    if((laundryRequestDetails.categories.length ?? 0) == 0) {
      throw new HttpsError(
        "internal",
        "No category selected"
      );
    }
    if(laundryRequestDetails.deliveryType == DeliveryType.Delivery) {
        if(laundryStore.delivery) {
            if(!(laundryStore.selfDelivery)) {
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