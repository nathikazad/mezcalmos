import { OrderType } from "../../models/Generic/Order";
import { serviceProviderInfo, serviceProviderInProcessOrders, serviceProviderPastOrders, serviceProviderState } from "./serviceProvider";

export function inProcessOrders(providerId: string, orderId?: string) {
  return serviceProviderInProcessOrders(OrderType.Restaurant, providerId, orderId);
}

export function pastOrders(providerId: string, orderId?: string) {
  return serviceProviderPastOrders(OrderType.Restaurant, providerId, orderId);
}

export function info(providerId?: string) {
  return serviceProviderInfo(OrderType.Restaurant, providerId);
}


export function restaurantOperators(providerId: string, userId?: string) {
  let ret = serviceProviderState(OrderType.Restaurant, providerId).child("/operators");
  if (userId != null)
    ret = ret.child(userId);
  return ret;
}export function restaurantDrivers(providerId: string, userId?: string) {
  let ret = serviceProviderState(OrderType.Restaurant, providerId).child("/drivers");
  if (userId != null)
    ret = ret.child(userId);
  return ret;
}
