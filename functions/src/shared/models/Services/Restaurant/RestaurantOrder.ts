
import { Item, Cart } from './Cart';
import { DeliverableOrder, OrderType } from '../../Generic/Order';
import { UserInfo } from '../../Generic/User';
import { OrderNotification } from '../../Notification';

export interface RestaurantOrder extends DeliverableOrder {
  quantity: number;
  notes?: number;
  status: RestaurantOrderStatus;
  orderTime: string;
  items: Record<string, Item>;
  restaurant: UserInfo;
  itemsCost: number;
 
  shippingCost: number;
  estimatedFoodReadyTime: string;
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
  restaurant: UserInfo,
  stripeFees: number
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
    dropOffShippingCost: params.cart.shippingCost,
    totalCostBeforeShipping: params.cart.cost - params.cart.shippingCost - params.stripeFees,
    totalCost: params.cart.cost,
    refundAmount: 0,
    costToCustomer: params.cart.cost
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