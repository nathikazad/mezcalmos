import { AuthorizationStatus, NotificationInfo } from "../Generic/Generic";
import { OrderType } from "../Generic/Order";

export interface State {
  authorizationStatus: AuthorizationStatus;
  isOnline: boolean;
  serviceProviderType?: OrderType;
  serviceProviderId?: string;
}

export interface DeliveryDriver {

  state: State;
  notificationInfo: NotificationInfo;
}

// export enum DeliveryDriverType {
//   RestaurantOperator = "restaurantOperator",
//   DeliveryDriver = "deliveryDriver"
// }
