import { setCourierChatInfo } from "../shared/graphql/chat/setChatInfo";
import { createNewCourierOrder } from "../shared/graphql/delivery/courier/createOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { notifyDeliveryCompany } from "../shared/helper";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { CustomerAppType, Language, Location } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType, OrderNotification } from "../shared/models/Notification";
import { CourierItem, CourierOrder } from "../shared/models/Services/Courier/Courier";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface CourierRequest {
    toLocation: Location,
    fromLocationGps?: Location,
    fromLocationText?: string,
    items: Array<CourierItem>;
    deliveryCompanyId: number;
    deliveryCost: number,
    customerAppType: CustomerAppType,
    tax?: number,
    scheduledTime?: string,
    stripeFees?: number,
    discountValue?: number,
    tripDistance: number,
    tripDuration: number,
    tripPolyline: string
    distanceFromBase?: number,
    refundAmount?: number,
}
export interface CreateCourierResponse {
    orderId: number
}
export async function createCourierOrder(customerId: number, courierRequest: CourierRequest): Promise<CreateCourierResponse> {

    let response = await Promise.all([getCustomer(customerId), getMezAdmins()])
    let customer: CustomerInfo = response[0];
    let mezAdmins: MezAdmin[] = response[1]

    let courierOrder: CourierOrder = await createNewCourierOrder(customerId, courierRequest, mezAdmins);

    setCourierChatInfo(courierOrder, customer)

    notifyDeliveryCompany(courierOrder.deliveryOrder, courierRequest.deliveryCompanyId, OrderType.Courier)
    notifyAdmins(mezAdmins, courierOrder.id)
    
    return {
        orderId: courierOrder.id
    }
}

function notifyAdmins(mezAdmins: MezAdmin[], orderId: number) {

    let notification: Notification = {
      foreground: <OrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: OrderType.Courier,
        orderId: orderId,
        notificationAction: NotificationAction.ShowSnackBarAlways,
      },
      background: {
        [Language.ES]: {
          title: "Nueva Pedido",
          body: `Hay un nuevo pedido de mensajería`
        },
        [Language.EN]: {
          title: "New Order",
          body: `There is a new courier order`
        }
      },
      linkUrl: orderUrl(OrderType.Courier, orderId)
    }
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
  }