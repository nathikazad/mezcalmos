import { DeliveryDriver, DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { HttpsError } from "firebase-functions/v1/auth";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { CustomerInfo } from "../shared/models/Generic/User";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { OrderType } from "../shared/models/Generic/Order";
import { changeRestaurantOrderStatus } from "./restaurantStatusChange";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { changeLaundryOrderStatus } from "./laundryStatusChange";

let statusArrayInSeq: Array<DeliveryOrderStatus> = [
  DeliveryOrderStatus.OrderReceived,
  DeliveryOrderStatus.OnTheWayToPickup,
  DeliveryOrderStatus.PackageReady,
  DeliveryOrderStatus.AtPickup,
  DeliveryOrderStatus.OnTheWayToDropoff,
  DeliveryOrderStatus.AtDropoff,
  DeliveryOrderStatus.Delivered
]

function checkExpectedStatus(currentStatus: DeliveryOrderStatus, newStatus: DeliveryOrderStatus) {
  if ((newStatus == DeliveryOrderStatus.OnTheWayToPickup)
    && (currentStatus != DeliveryOrderStatus.OrderReceived)
    && (currentStatus != DeliveryOrderStatus.PackageReady)
  ) {
    throw new HttpsError(
      "internal",
      "invalid delivery order status"
    );
  } else if (currentStatus != statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == newStatus) - 1]) {
    throw new HttpsError(
      "internal",
      "invalid delivery order status"
    );
  }
}

export interface ChangeDeliveryStatusDetails {
  deliveryId: number,
  deliveryDriverId: number,
  deliveryDriverType: ParticipantType,
  newStatus: DeliveryOrderStatus
}

export async function changeDeliveryStatus(userId: number, changeDeliveryStatusDetails: ChangeDeliveryStatusDetails) {

  let deliveryOrderPromise = getDeliveryOrder(changeDeliveryStatusDetails.deliveryId);
  let deliveryDriverPromise = getDeliveryDriver(changeDeliveryStatusDetails.deliveryDriverId)//, changeDeliveryStatusDetails.deliveryDriverType);
  let promiseResponse = await Promise.all([deliveryOrderPromise, deliveryDriverPromise]);
  let deliveryOrder: DeliveryOrder = promiseResponse[0];
  let deliveryDriver: DeliveryDriver = promiseResponse[1];

  if (deliveryOrder.status == (DeliveryOrderStatus.Delivered
    || DeliveryOrderStatus.CancelledByCustomer
    || DeliveryOrderStatus.CancelledByDeliverer
    || DeliveryOrderStatus.CancelledByServiceProvider
  )) {
    throw new HttpsError(
      "internal",
      "delivery order is complete or cancelled"
    );
  }
  if (deliveryDriver.userId != userId) {
    throw new HttpsError(
      "internal",
      "invalid delivery driver user id"
    );
  }

  let customer: CustomerInfo = await getCustomer(deliveryOrder.customerId);

  checkExpectedStatus(deliveryOrder.status, changeDeliveryStatusDetails.newStatus);

  deliveryOrder.status = changeDeliveryStatusDetails.newStatus;
  updateDeliveryOrderStatus(deliveryOrder);

  switch (deliveryOrder.orderType) {
    case OrderType.Restaurant:
      changeRestaurantOrderStatus(changeDeliveryStatusDetails, customer, deliveryOrder)
      break;
    case OrderType.Laundry:
      changeLaundryOrderStatus(changeDeliveryStatusDetails, customer, deliveryOrder)
      break;
    default:
      break;
  }
}