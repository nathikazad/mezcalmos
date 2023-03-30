import { DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { CustomerInfo } from "../shared/models/Generic/User";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { OrderType } from "../shared/models/Generic/Order";
import { changeRestaurantOrderStatus } from "./restaurantStatusChange";
import { changeLaundryOrderStatus } from "./laundryStatusChange";
import { CourierOrderStatusChangeNotification } from "../shared/models/Services/Courier/Courier";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { deliveryOrderStatusChangeMessages } from "./bgNotificationMessages";
import { isMezAdmin } from "../shared/helper";
import { MezError } from "../shared/models/Generic/Generic";

let statusArrayInSeq: Array<DeliveryOrderStatus> = [
  DeliveryOrderStatus.OrderReceived,
  DeliveryOrderStatus.OnTheWayToPickup,
  DeliveryOrderStatus.AtPickup,
  DeliveryOrderStatus.OnTheWayToDropoff,
  DeliveryOrderStatus.AtDropoff,
  DeliveryOrderStatus.Delivered
]

function checkExpectedStatus(currentStatus: DeliveryOrderStatus, newStatus: DeliveryOrderStatus) {
  if(newStatus == DeliveryOrderStatus.CancelledByAdmin) {
    if(!statusArrayInSeq.slice(0, -1).includes(currentStatus)) {
      throw new MezError(ChangeDeliveryStatusError.OrderNotInProcess);
    }
    return;
  }
  if ((newStatus == DeliveryOrderStatus.OnTheWayToPickup)
    && (currentStatus != DeliveryOrderStatus.OrderReceived)
  ) {
    throw new MezError(ChangeDeliveryStatusError.InvalidStatus);

  } else if (currentStatus != statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == newStatus) - 1]) {
    throw new MezError(ChangeDeliveryStatusError.InvalidStatus);
  }
}

export interface ChangeDeliveryStatusDetails {
  deliveryId: number,
  newStatus: DeliveryOrderStatus
}
export interface ChangeDeliveryStatusResponse {
  success: boolean,
  error?: ChangeDeliveryStatusError
  unhandledError?: string,
}

enum ChangeDeliveryStatusError {
  UnhandledError = "unhandledError",
  OrderNotFound = "orderNotFound",
  DriverNotAssigned = "driverNotAssigned",
  OrderNotInProcess = "orderNotInProcess",
  UnAuthorizedAccess = "unAuthorizedAccess",
  OrderDriverMismatch = "orderDriverMismatch",
  CustomerNotFound = "customerNotFound",
  InvalidStatus = "invalidStatus",
  RestaurantNotfound = "restaurantNotfound",
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  OrderStripeInfoNotDefined = "orderStripeInfoNotDefined",
  ServiceProviderStripeAccountDoesNotExist = "serviceProviderStripeAccountDoesNotExist",
  UpdateOrderStripeError = "updateOrderStripeError",
  LaundryStoreNotfound = "laundryStoreNotfound",
  OrderCreationError = "orderCreationError",
  NoDeliveryChatWithStoreId = " noDeliveryChatWithStoreId",
  DeliveryCompanyOperatorsNotFound = "deliveryCompanyOperatorsNotFound"
}

export async function changeDeliveryStatus(userId: number, changeDeliveryStatusDetails: ChangeDeliveryStatusDetails): Promise<ChangeDeliveryStatusResponse> {
  try {
    let deliveryOrder: DeliveryOrder = await getDeliveryOrder(changeDeliveryStatusDetails.deliveryId);

    await errorChecks(deliveryOrder, userId, changeDeliveryStatusDetails.newStatus);

    let customer: CustomerInfo = await getCustomer(deliveryOrder.customerId);

    checkExpectedStatus(deliveryOrder.status, changeDeliveryStatusDetails.newStatus);

    deliveryOrder.status = changeDeliveryStatusDetails.newStatus;
    updateDeliveryOrderStatus(deliveryOrder);

    switch (deliveryOrder.orderType) {
      case OrderType.Restaurant:
        changeRestaurantOrderStatus(customer, deliveryOrder)
        break;
      case OrderType.Laundry:
        changeLaundryOrderStatus(customer, deliveryOrder)
        break;
      case OrderType.Courier:
        notifyCourierStatusChange(deliveryOrder, customer);
      default:
        break;
    }
    return {
      success: true
    }
  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(ChangeDeliveryStatusError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: ChangeDeliveryStatusError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
}

async function errorChecks(deliveryOrder: DeliveryOrder, userId: number, newStatus: DeliveryOrderStatus) {
  if (deliveryOrder.deliveryDriver == null) {
    throw new MezError(ChangeDeliveryStatusError.DriverNotAssigned);
  }
  if (deliveryOrder.status == (DeliveryOrderStatus.Delivered
    || DeliveryOrderStatus.CancelledByCustomer
    || DeliveryOrderStatus.CancelledByDeliverer
    || DeliveryOrderStatus.CancelledByServiceProvider
  )) {
    throw new MezError(ChangeDeliveryStatusError.UnAuthorizedAccess);
  }
  if (userId != deliveryOrder.deliveryDriver.userId && !(await isMezAdmin(userId))) {
    throw new MezError(ChangeDeliveryStatusError.UnAuthorizedAccess);
  }

}

function notifyCourierStatusChange(deliveryOrder: DeliveryOrder, customer: CustomerInfo) {

  let notification: Notification = {
    foreground: <CourierOrderStatusChangeNotification>{
      status: deliveryOrder.status,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Courier,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      orderId: deliveryOrder.deliveryId
    },
    // todo @SanchitUke fix the background message based on Restaurant Order Status
    background: deliveryOrderStatusChangeMessages[deliveryOrder.status],
    linkUrl: '/'
  };

  pushNotification(
    customer.firebaseId,
    notification,
    customer.notificationInfo,
    ParticipantType.Customer,
    customer.language
  );
  if(deliveryOrder.status == DeliveryOrderStatus.CancelledByAdmin && deliveryOrder.deliveryDriver) {
    pushNotification(deliveryOrder.deliveryDriver.user?.firebaseId!,
      notification,
      deliveryOrder.deliveryDriver.notificationInfo,
      ParticipantType.DeliveryDriver,
      deliveryOrder.deliveryDriver.user?.language
    );
  }
}