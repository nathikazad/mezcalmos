import { Order } from '../../Generic/Order';
import { OrderNotification } from '../../Notification';
import { Language, Location } from '../../Generic/Generic';
import { Restaurant } from './Restaurant';
import { DeliveryOrderStatus } from '../../Generic/Delivery';

export interface RestaurantOrder extends Order {
  restaurantId: number;
  toLocation: Location;
  estimatedFoodReadyTime?: string;
  actualFoodReadyTime?: string;
  status: RestaurantOrderStatus;
  items: Array<OrderItem>;
  itemsCost?: number;
  totalCost?: number;
  restaurant?: Restaurant;
}
export interface OrderItem {
  orderItemId?: number;
  itemId: number;
  name: any;
  image?:string;
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
  PreparingOrder = "preparing",
  ReadyForPickup = "ready",
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

export function orderInProcess(status: RestaurantOrderStatus): boolean {
  return !(status == RestaurantOrderStatus.CancelledByAdmin ||
    status == RestaurantOrderStatus.CancelledByCustomer ||
    status == RestaurantOrderStatus.Delivered)
}

export interface NewRestaurantOrderNotification extends OrderNotification {
  restaurant?: {
    name: string,
    image: string,
    id: number
  }
}

export interface RestaurantOrderStatusChangeNotification extends OrderNotification {
  status: RestaurantOrderStatus
  deliveryOrderStatus: DeliveryOrderStatus
}