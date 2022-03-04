import { OrderType } from "../../models/Generic/Order";
import { serviceProviderInfo, serviceProviderInProcessOrders, serviceProviderPastOrders } from "./serviceProvider";

export function inProcessOrders(providerId: string, orderId?: string) {
  return serviceProviderInProcessOrders(OrderType.Laundry, providerId, orderId);
}

export function pastOrders(providerId: string, orderId?: string) {
  return serviceProviderPastOrders(OrderType.Laundry, providerId, orderId);
}

export function info(providerId: string) {
  return serviceProviderInfo(OrderType.Laundry, providerId);
}


