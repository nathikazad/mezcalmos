import { OrderType } from "../../models/Generic/Order";
import { serviceProviderInfo, serviceProviderInProcessOrders, serviceProviderPastOrders, serviceProviderState } from "./serviceProvider";

export function inProcessOrders(providerId: string, orderId?: string) {
  return serviceProviderInProcessOrders(OrderType.Laundry, providerId, orderId);
}

export function pastOrders(providerId: string, orderId?: string) {
  return serviceProviderPastOrders(OrderType.Laundry, providerId, orderId);
}

export function info(providerId?: string) {
  return serviceProviderInfo(OrderType.Laundry, providerId);
}

export function laundryOperators(providerId: string, userId?: string) {
  let ret = serviceProviderState(OrderType.Laundry, providerId).child("/operators");
  if (userId != null)
    ret = ret.child(userId);
  return ret;
}
export function laundryDrivers(providerId: string, userId?: string) {
  let ret = serviceProviderState(OrderType.Laundry, providerId).child("/drivers");
  if (userId != null)
    ret = ret.child(userId);
  return ret;
}
