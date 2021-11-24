
import { Item, Cart } from './Cart';
import { OrderType, PaymentType } from '../../shared/models/Order';
import { UserInfo } from '../../shared/models/User';
import { Location } from '../../shared/models/Generic';
import { OrderNotification } from '../../shared/models/Notification';

export interface RestaurantOrder {
  quantity: number;
  cost: number;
  notes?: number;
  paymentType: PaymentType;
  serviceProviderId: string;
  status: RestaurantOrderStatus;
  orderTime: string;
  to: Location;
  orderType: OrderType.Restaurant;
  items: Record<string, Item>;
  restaurant: UserInfo;
  customer: UserInfo;
}

export enum RestaurantOrderStatus {
  OrderReceieved = "orderReceieved",
  PreparingOrder = "preparingOrder",
  ReadyForPickup = "readyForPickup",
  OnTheWay = "onTheWay",
  Delivered = "delivered",
  CancelledByAdmin = "cancelledByAdmin",
  CancelledByCustomer = "cancelledByCustomer"
}

interface ConstructRestaurantOrderParameters {
  cart: Cart,
  customer: UserInfo,
  restaurant: UserInfo
}
export function constructRestaurantOrder(
  params: ConstructRestaurantOrderParameters): RestaurantOrder {
  return <RestaurantOrder>{
    ...params.cart,
    customer: params.customer,
    restaurant: params.restaurant,
    orderType: OrderType.Restaurant,
    status: RestaurantOrderStatus.OrderReceieved,
    orderTime: (new Date()).toISOString(),
  }
}

export function orderInProcess(status: RestaurantOrderStatus): boolean {
  return !(status == RestaurantOrderStatus.CancelledByAdmin ||
    status == RestaurantOrderStatus.CancelledByCustomer ||
    status == RestaurantOrderStatus.Delivered)
}

export interface NewRestaurantOrderNotification extends OrderNotification {
  restaurant: UserInfo
}

export interface RestaurantOrderStatusChangeNotification extends OrderNotification {
  status: RestaurantOrderStatus
}