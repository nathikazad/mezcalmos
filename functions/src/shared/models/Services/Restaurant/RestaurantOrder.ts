import { PaymentType } from '../../Generic/Order';
// import { CustomerInfo, UserInfo } from '../../Generic/User';
import { OrderNotification } from '../../Notification';
import { AppType, Language, Location } from '../../Generic/Generic';
// import { Restaurant } from './Restaurant';
// import { Delivery } from '../../Generic/Delivery';

export interface RestaurantOrder {
  orderId?: number;
  customerId: number;
  restaurantId: number;
  paymentType: PaymentType;
  toLocation: Location;
  estimatedFoodReadyTime?: string;
  actualFoodReadyTime?: string;
  stripePaymentId?: number;
  refundAmount?: number;
  deliveryId?: number;
  status: RestaurantOrderStatus;
  reviewId?: number;
  orderType: RestaurantOrderType;
  orderTime?: string;
  firebaseId?: string;
  customerAppType: AppType;
  notes?: string;
  tax?: number;
  items: Array<OrderItem>;
  deliveryCost: number;
  itemsCost?: number;
  totalCost?: number;
  chatId?: number;
  // customer?: CustomerInfo;
  // delivery?: Delivery;
}
export interface OrderItem {
  orderItemId?: number;
  itemId: number;
  name?: Record<Language, string>;
  selectedOptions?: Array<SelectedOption>;
  reviewId?: number;
  notes?: string;
  unavailable?: boolean;
  quantity: number;
  orderId?: number;
  costPerOne: number;
}

export interface SelectedOption {
  optionId: number;
  optionNames: Record<Language, string>;
  selectedChoices: Record<Language, string[]>;
  //TODO choice costs
}

export enum RestaurantOrderStatus {
  OrderReceived = "orderReceived",
  PreparingOrder = "preparingOrder",
  ReadyForPickup = "readyForPickup",
  OnTheWay = "onTheWay",
  Delivered = "delivered",
  CancelledByAdmin = "cancelledByAdmin",
  CancelledByCustomer = "cancelledByCustomer"
}
export enum DeliveryMode {
  ForwardedToMezCalmos = "forwardedToMezCalmos",
  SelfDeliveryByRestaurant = "selfDeliveryByRestaurant",
  SelfDeliveryByDriver = "SelfDeliveryByDriver",
  None = "none",
}

export enum RestaurantOrderType {
  Pickup = "pickup",
  Delivery = "delivery",
}

// interface ConstructRestaurantOrderParameters {
//   cart: Cart,
//   customer: UserInfo,
//   restaurant: UserInfo,
//   stripeFees: number
// }
// export function constructRestaurantOrder(
//   params: ConstructRestaurantOrderParameters): RestaurantOrder {
//   return <RestaurantOrder>{
//     ...params.cart,
//     customer: params.customer,
//     restaurant: params.restaurant,
//     orderType: OrderType.Restaurant,
//     status: RestaurantOrderStatus.OrderReceieved,
//     orderTime: (new Date()).toISOString(),
//     dropOffShippingCost: params.cart.shippingCost,
//     totalCostBeforeShipping: params.cart.cost - params.cart.shippingCost - params.stripeFees,
//     totalCost: params.cart.cost,
//     refundAmount: 0,
//     costToCustomer: params.cart.cost
//   }
// }

export function orderInProcess(status: RestaurantOrderStatus): boolean {
  return !(status == RestaurantOrderStatus.CancelledByAdmin ||
    status == RestaurantOrderStatus.CancelledByCustomer ||
    status == RestaurantOrderStatus.Delivered)
}

export interface NewRestaurantOrderNotification extends OrderNotification {
  restaurant: {
    name: string,
    image: string,
    id: number
  }
}

export interface RestaurantOrderStatusChangeNotification extends OrderNotification {
  status: RestaurantOrderStatus
}