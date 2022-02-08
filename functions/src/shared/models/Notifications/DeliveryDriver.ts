import { DeliveryDriverType } from "../Drivers/DeliveryDriver";
import { OrderNotification } from "../Generic/Notification";

export interface NewDeliveryOrderNotification extends OrderNotification {
  deliveryDriverType: DeliveryDriverType
}