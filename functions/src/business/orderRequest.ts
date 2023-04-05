import { getBusiness } from "../shared/graphql/business/getBusiness";
import { getBusinessCart } from "../shared/graphql/business/cart/getCart";
import { createOrderRequest } from "../shared/graphql/business/order/createOrderRequest";
import { setBusinessOrderRequestChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { CustomerAppType, Language, MezError } from "../shared/models/Generic/Generic";
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
  success: boolean,
  error?: OrderReqError
  unhandledError?: string
  orderId?: number
}
enum OrderReqError {
  UnhandledError = "unhandledError",
  BusinessNotFound = "businessNotFound",
  CustomerNotFound = "customerNotFound",
  CartNotFound = "cartNotFound",
  BusinessNotApproved  = "businessNotApproved",
  BusinessClosed = "businessClosed",
  EmptyCart = "emptyCart",
  OrderCreationError = "orderCreationError",
}

export async function requestOrder(customerId: number, orderRequestDetails: OrderRequestDetails): Promise<OrderReqResponse> {
  try {
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
      success: true,
      orderId: order.orderDetails.orderId
    }
  } catch (e: any) {
    if (e instanceof MezError) {
        if (Object.values(OrderReqError).includes(e.message as any)) {
            return {
                success: false,
                error: e.message as any
            }
        } else {
            return {
                success: false,
                error: OrderReqError.UnhandledError,
                unhandledError: e.message as any
            }
        }
    } else {
        throw e
    }
  }
}

function errorChecks(business: Business, cart: BusinessCart) {
  if(business.details.approved == false) {
    throw new MezError(OrderReqError.BusinessNotApproved);
  }
  if(business.details.openStatus != "open") {
    throw new MezError(OrderReqError.BusinessClosed);
  }
  if((cart.items.length ?? 0) == 0) {
    throw new MezError(OrderReqError.EmptyCart);
  }
}

async function notify(order: BusinessOrder, business: Business, mezAdmins: MezAdmin[]) {

    let notification: Notification = {
        foreground: <NewBusinessOrderRequestNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.NewOrder,
            orderType: OrderType.Business,
            orderId: order.orderDetails.orderId,
            notificationAction: NotificationAction.ShowSnackBarAlways,
            business: {
                name: business.details.name,
                image: business.details.image,
                id: business.details.id
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
        linkUrl: orderUrl(OrderType.Business, order.orderDetails.orderId)
    }
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
    if(business.details.operators != undefined) {
        business.details.operators.forEach((l) => {
          if(l.user) {
            pushNotification(l.user.firebaseId, notification, l.notificationInfo, ParticipantType.BusinessOperator);
          }
        });
    }
}
  