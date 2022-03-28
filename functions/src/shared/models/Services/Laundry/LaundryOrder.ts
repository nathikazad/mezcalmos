
import { OrderType, PaymentType, TwoWayDeliverableOrder } from '../../Generic/Order';
import { UserInfo } from '../../Generic/User';
import { OrderNotification } from '../../Notification';
import { Location } from "../../Generic/Generic";

export interface LaundryOrder extends TwoWayDeliverableOrder {
  laundry: UserInfo;
  notes?: string;
  weight?: number;
  status: LaundryOrderStatus;
  shippingCost: number;
  costPerKilo: number;
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
  notes?: string,
  paymentType: PaymentType,
  to: Location
}

export function constructLaundryOrder(
  params: ConstructLaundryOrderParameters, customer: UserInfo): LaundryOrder {
  return <LaundryOrder>{
    customer: customer,
    orderType: OrderType.Laundry,
    status: LaundryOrderStatus.OrderReceieved,
    orderTime: (new Date()).toISOString(),
    notes: params.notes,
    cost: 0,
    paymentType: params.paymentType,
    to: params.to,
    shippingCost: 50,
    costPerKilo: 20
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