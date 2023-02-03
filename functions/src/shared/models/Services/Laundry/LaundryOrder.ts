
import { Order, OrderType, PaymentType } from '../../Generic/Order';
import { UserInfo } from '../../Generic/User';
import { OrderNotification } from '../../Notification';
import { Location } from "../../Generic/Generic";
import { RouteInformation } from '../../Generic/RouteInformation';
import { Laundry } from './Laundry';

export interface LaundryOrder extends Order {
  storeId: number;
  customerLocation: Location;
  estimatedReadyTime?: string;
  actualReadyTime?: string;
  fromCustomerDeliveryId?: number;
  toCustomerDeliveryId?: number;
  status: LaundryOrderStatus;
  categories: Array<OrderCategory>;
  laundryStore?: Laundry;
  // routeInformation?: RouteInformation;
  // costsByType?: CostsByType;
}
export interface OrderCategory {
  orderCategoryId?: number;
  categoryId: number;
  orderId?: number;
  weightInKilo?: number;
  costByKilo?: number;
}
export interface CostsByType {
  byType: any;
  weighedCost: number;
}

export enum LaundryOrderStatus {
  OrderReceived = "orderReceived",
  OtwPickupFromCustomer = "otwPickupFromCustomer",
  PickedUpFromCustomer = "pickedUpFromCustomer",
  AtLaundry = "atLaundry",
  ReadyForDelivery = "readyForDelivery",
  OtwPickupFromLaundry = "otwPickupFromLaundry",
  PickedUpFromLaundry = "pickedUpFromLaundry",
  Delivered = "delivered",
  CancelledByAdmin = "cancelledByAdmin",
  CancelledByCustomer = "cancelledByCustomer"
}

export interface ConstructLaundryOrderParameters {
  routeInformation?: RouteInformation,
  notes?: string,
  paymentType: PaymentType,
  to: Location,
  shippingCost : number
}

export function constructLaundryOrder(
  params: ConstructLaundryOrderParameters, customer: UserInfo, laundry: UserInfo): LaundryOrder {
  return <LaundryOrder><unknown>{
    customer: customer,
    orderType: OrderType.Laundry,
    status: LaundryOrderStatus.OrderReceived,
    orderTime: (new Date()).toISOString(),
    notes: params.notes,
    laundry: laundry,
    serviceProviderId: laundry.id,
    cost: 0,
    paymentType: params.paymentType,
    to: params.to,
    shippingCost: params.shippingCost || 0,
    costPerKilo: 20,
    routeInformation: params.routeInformation
  }
}

export function orderInProcess(status: LaundryOrderStatus): boolean {
  return !(status == LaundryOrderStatus.CancelledByAdmin ||
    status == LaundryOrderStatus.CancelledByCustomer ||
    status == LaundryOrderStatus.Delivered)
}

export interface NewLaundryOrderNotification extends OrderNotification {
  laundryStore?: {
    name: string,
    image: string,
    id: number
  }
}

export interface LaundryOrderStatusChangeNotification extends OrderNotification {
  status: LaundryOrderStatus
}