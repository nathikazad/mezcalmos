import { DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { CustomerInfo } from "../shared/models/Generic/User";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { OrderType } from "../shared/models/Generic/Order";
import { changeRestaurantOrderStatus } from "./restaurantStatusChange";
import { changeLaundryOrderStatus } from "./laundryStatusChange";
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
  OrderNotFound = "orderNotFound",
  DriverNotAssigned = "driverNotAssigned",
  OrderNotInProcess = "orderNotInProcess",
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

    errorChecks(deliveryOrder, userId);

    let customer: CustomerInfo = await getCustomer(deliveryOrder.customerId);

    checkExpectedStatus(deliveryOrder.status, changeDeliveryStatusDetails.newStatus);

    deliveryOrder.status = changeDeliveryStatusDetails.newStatus;
    updateDeliveryOrderStatus(deliveryOrder);

    switch (deliveryOrder.orderType) {
      case OrderType.Restaurant:
        await changeRestaurantOrderStatus(changeDeliveryStatusDetails, customer, deliveryOrder)
        break;
      case OrderType.Laundry:
        await changeLaundryOrderStatus(changeDeliveryStatusDetails, customer, deliveryOrder)
        break;
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
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }
  }
}

function errorChecks(deliveryOrder: DeliveryOrder, userId: number) {
  if (deliveryOrder.deliveryDriver == null) {
    throw new MezError(ChangeDeliveryStatusError.DriverNotAssigned);
  }
  if (deliveryOrder.status == (DeliveryOrderStatus.Delivered
    || DeliveryOrderStatus.CancelledByCustomer
    || DeliveryOrderStatus.CancelledByDeliverer
    || DeliveryOrderStatus.CancelledByServiceProvider
  )) {
    throw new MezError(ChangeDeliveryStatusError.OrderNotInProcess);
  }
  if (userId != deliveryOrder.deliveryDriver.userId) {
    throw new MezError(ChangeDeliveryStatusError.OrderDriverMismatch);
  }
}
