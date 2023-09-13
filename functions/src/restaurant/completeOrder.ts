import { RestaurantOrder, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { getRestaurantOrder } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { updateRestaurantOrderStatus } from "../shared/graphql/restaurant/order/updateOrder"
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { OrderType } from "../shared/models/Generic/Order";
import { restaurantOrderStatusChangeMessages } from "./bgNotificationMessages";
import { orderUrl } from "../utilities/senders/appRoutes";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { CustomerInfo } from "../shared/models/Generic/User";
import { Operator } from "../shared/models/Services/Service";
import { MezError } from "../shared/models/Generic/Generic";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";

// Customer Canceling
interface CompleteOrderDetails {
  orderId: number
}
export interface CompleteRestaurantOrderResponse {
  success: boolean,
  error?: CompleteOrderError
  unhandledError?: string,
}
enum CompleteOrderError {
  UnhandledError = "unhandledError",
  OrderNotFound = "orderNotFound",
  RestaurantNotfound = "restaurantNotfound",
  IncorrectOrderId = "incorrectOrderId",
  OrderNotInProcess = "orderNotInProcess",
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  UnauthorizedAccess = "unauthorizedAccess"
}
export async function completeOrder(userId: number, data: CompleteOrderDetails): Promise<CompleteRestaurantOrderResponse> {
  try {

    let order: RestaurantOrder = await getRestaurantOrder(data.orderId);
    console.log("[+] getRestaurantOrder " , order);

    let restaurantOperators: Operator[] = await  getRestaurantOperators(order.restaurantId);
    
    if(restaurantOperators.find((r) => r.userId == userId) == undefined) {
      throw new MezError(CompleteOrderError.UnauthorizedAccess);
    }

    if (order.status != RestaurantOrderStatus.InProcess) {
      throw new MezError(CompleteOrderError.OrderNotInProcess);
    }

    order.status = RestaurantOrderStatus.Delivered;

    updateRestaurantOrderStatus(order)
    
    
    let notification: Notification = {
      foreground: <RestaurantOrderStatusChangeNotification>{
        status: RestaurantOrderStatus.Delivered,
        time: (new Date()).toISOString(),
        notificationType: NotificationType.OrderStatusChange,
        orderType: OrderType.Restaurant,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: data.orderId
      },
      background: restaurantOrderStatusChangeMessages[RestaurantOrderStatus.Delivered],
      linkUrl: orderUrl(OrderType.Restaurant, data.orderId)
    }
    let customer: CustomerInfo = await getCustomer(order.customerId);
    
    pushNotification(
      customer.firebaseId, 
      notification, 
      customer.notificationInfo,
      ParticipantType.Customer, 
      customer.language
    )

    return {
      success: true
    }
  } catch(e: any) {
    if (e instanceof MezError) {
      if (Object.values(CompleteOrderError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: CompleteOrderError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
};