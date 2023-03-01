import { HttpsError } from "firebase-functions/v1/auth";
import { getBusiness } from "../shared/graphql/business/getBusiness";
import { getBusinessCart } from "../shared/graphql/business/cart/getCart";
import { createOrderRequest } from "../shared/graphql/business/order/createOrderRequest";
import { setBusinessOrderRequestChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { CustomerAppType, Language } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Business } from "../shared/models/Services/Business/Business";
import { BusinessOrder, NewBusinessOrderRequestNotification } from "../shared/models/Services/Business/BusinessOrder";
import { BusinessCart } from "../shared/models/Services/Business/Cart";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { clearBusinessCart } from "../shared/graphql/business/cart/clearCart";

export interface OrderRequestDetails {
    businessId: number,
    customerAppType: CustomerAppType,
    notes?: string,
} 
export interface OrderReqResponse {
    orderId: number
}

export async function requestOrder(customerId: number, orderRequestDetails: OrderRequestDetails): Promise<OrderReqResponse> {
    let response = await Promise.all([
        getBusiness(orderRequestDetails.businessId), 
        getCustomer(customerId),
        getMezAdmins(),
        getBusinessCart(customerId)
    ])
    let business: Business = response[0];
    let customer: CustomerInfo = response[1];
    let mezAdmins: MezAdmin[] = response[2];
    let cart: BusinessCart = response[3];

    errorChecks(business, cart);
    
    let order: BusinessOrder = await createOrderRequest(customerId, orderRequestDetails, business, mezAdmins, cart);

    setBusinessOrderRequestChatInfo(order, business, customer);

    notify(order, business, mezAdmins);

    clearBusinessCart(customerId);
    
    return {
        orderId: order.orderId
    }
}

function errorChecks(business: Business, cart: BusinessCart) {

    if(business.approved == false) {
      throw new HttpsError(
        "internal",
        "business is not approved and taking order requests right now"
      );
    }
    if(business.openStatus != "open") {
      throw new HttpsError(
        "internal",
        "business is closed"
      );
    }
    if((cart.items.length ?? 0) == 0) {
        throw new HttpsError(
          "internal",
          "Empty cart"
        );
      }
}

async function notify(order: BusinessOrder, business: Business, mezAdmins: MezAdmin[]) {

    let notification: Notification = {
        foreground: <NewBusinessOrderRequestNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.NewOrder,
            orderType: OrderType.Business,
            orderId: order.orderId,
            notificationAction: NotificationAction.ShowSnackBarAlways,
            business: {
                name: business.name,
                image: business.image,
                id: business.id
            }
        },
        background: {
            [Language.ES]: {
                title: "Nueva Pedido",
                body: `Hay un nuevo orden comercial`
            },
            [Language.EN]: {
                title: "New Order",
                body: `There is a new business order`
            }
        },
        linkUrl: orderUrl(OrderType.Business, order.orderId)
    }
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
    if(business.operators != undefined) {
        business.operators.forEach((l) => {
          if(l.user) {
            pushNotification(l.user.firebaseId, notification, l.notificationInfo, ParticipantType.BusinessOperator);
          }
        });
    }
}
  