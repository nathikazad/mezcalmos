
import { Order, OrderType, PaymentType } from '../../shared/models/Order';
import { UserInfo } from '../../shared/models/User';
import { OrderNotification } from '../../shared/models/Notification';
import { Location } from "../../shared/models/Generic";

export interface LaundryOrder extends Order {
  quantity?: number;
  notes?: string;
  weight?: number;
  status: LaundryOrderStatus;
  orderTime: string;
}

export enum LaundryOrderStatus {
  OrderReceieved = "orderReceieved",
  OtwPickup = "otwPickup",
  PickedUp = "pickedUp",
  AtLaundry = "atLaundry",
  ReadyForDelivery = "readyForDelivery",
  OtwDelivery = "otwDelivery",
  Delivered = "delivered",
  CancelledByAdmin = "cancelledByAdmin",
  CancelledByCustomer = "cancelledByCustomer"
}

export interface ConstructLaundryOrderParameters {
  customer: UserInfo,
  notes?: string,
  paymentType: PaymentType,
  to: Location
}
export function constructLaundryOrder(
  params: ConstructLaundryOrderParameters): LaundryOrder {
  return <LaundryOrder>{
    customer: params.customer,
    orderType: OrderType.Laundry,
    status: LaundryOrderStatus.OrderReceieved,
    orderTime: (new Date()).toISOString(),
    notes: params.notes,
    cost: 0,
    paymentType: params.paymentType,
    to: params.to
  }
}

export function orderInProcess(status: LaundryOrderStatus): boolean {
  return !(status == LaundryOrderStatus.CancelledByAdmin ||
    status == LaundryOrderStatus.CancelledByCustomer ||
    status == LaundryOrderStatus.Delivered)
}

export interface NewLaundryOrderNotification extends OrderNotification {
}

export interface LaundryOrderStatusChangeNotification extends OrderNotification {
  status: LaundryOrderStatus
}