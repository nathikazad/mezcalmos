import { PaymentType } from '../../Generic/Order';
import { OrderNotification } from '../../Notification';
import { AppType, Language, Location } from '../../Generic/Generic';
import { Restaurant } from './Restaurant';
import { OrderStripeInfo } from '../../../../utilities/stripe/model';

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
  scheduledTime?: string;
  restaurant?: Restaurant;
  stripeInfo?: OrderStripeInfo;
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

export enum RestaurantOrderType {
  Pickup = "pickup",
  Delivery = "delivery",
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
}