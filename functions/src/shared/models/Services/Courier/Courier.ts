import { OrderStripeInfo } from "../../../../utilities/stripe/model";
import { DeliveryOrder, DeliveryOrderStatus } from "../../Generic/Delivery";
import { Location } from "../../Generic/Generic";
import { PaymentType } from "../../Generic/Order";
import { OrderNotification } from "../../Notification";

export interface CourierOrder {
    id: number;
    fromLocationGps?: Location;
    fromLocationText?: string;
    toLocation: Location;
    deliveryOrder: DeliveryOrder;
    items: Array<CourierItem>;
    customerId: number;
    orderTime: string;
    stripeInfo?: OrderStripeInfo;
    PaymentType: PaymentType;
    tax?: number;
    stripeFees?: number;
    discountValue?: number;
}

export interface CourierItem {
    id?: number;
    name: string;
    image?: string;
    estimatedCost?: number;
    notes?: string;
    unavailable?: boolean;
    orderId?: number;
    actualCost?: number;
}

export interface CourierOrderStatusChangeNotification extends OrderNotification {
    status: DeliveryOrderStatus
}

export function orderInProcess(status: DeliveryOrderStatus): boolean {
    return !(status == DeliveryOrderStatus.CancelledByAdmin ||
      status == DeliveryOrderStatus.CancelledByCustomer ||
      status == DeliveryOrderStatus.Delivered)
}