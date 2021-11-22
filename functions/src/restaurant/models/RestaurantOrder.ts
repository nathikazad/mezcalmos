
import { Item, Cart } from './Cart';
import { OrderType, PaymentType } from '../../shared/models/Order';
import { GenericUser } from '../../shared/models/User';

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
  restaurant: GenericUser;
  customer: GenericUser;
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
  customer: GenericUser,
  restaurant: GenericUser
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