import { AuthorizationStatus } from "../Generic/Generic";
// import { OrderNotification } from "../Notification";
// import { DeliveryDriverType } from "../Services/Delivery/DeliveryOrder";

export interface State {
  authorizationStatus: AuthorizationStatus;
  isOnline: boolean;
}

// export interface DeliveryDriver {
//   state: State;
//   notificationInfo: NotificationInfo;
// }

// export enum DeliveryDriverType {
//   RestaurantOperator = "restaurantOperator",
//   DeliveryDriver = "deliveryDriver"
// }
