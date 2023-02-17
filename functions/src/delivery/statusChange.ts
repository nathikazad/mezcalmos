import { DeliveryOrder, DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { HttpsError } from "firebase-functions/v1/auth";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { CustomerInfo } from "../shared/models/Generic/User";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { OrderType } from "../shared/models/Generic/Order";
import { changeRestaurantOrderStatus } from "./restaurantStatusChange";
// import { ParticipantType } from "../shared/models/Generic/Chat";
import { changeLaundryOrderStatus } from "./laundryStatusChange";

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
  newStatus: DeliveryOrderStatus
}

export async function changeDeliveryStatus(userId: number, changeDeliveryStatusDetails: ChangeDeliveryStatusDetails) {

  let deliveryOrder: DeliveryOrder = await getDeliveryOrder(changeDeliveryStatusDetails.deliveryId);

  errorChecks(deliveryOrder, userId);

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

function errorChecks(deliveryOrder: DeliveryOrder, userId: number) {
  if (deliveryOrder.deliveryDriver == null) {
    throw new HttpsError(
      "internal",
      "No driver assigned to delivery order"
    );
  }
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
  if (userId != deliveryOrder.deliveryDriver.userId) {
    throw new HttpsError(
      "internal",
      "order driver mismatch"
    );
  }
}
