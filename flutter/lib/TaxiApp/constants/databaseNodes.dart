const String taxiOpenOrdersNode = "orders/open/taxi";
String taxiAuthNode(String uid) {
  return 'taxis/info/$uid';
}

String taxiStateNode(String uid) {
  return 'taxis/info/$uid/state';
}

String notificationStatusReadNode(String orderId, String uid) {
  return 'notificationStatus/taxi/$orderId/$uid/read';
}

String taxiDriverAppVersionNode(String uid) {
  return taxiAuthNode(uid) + '/versionNumber';
}

String notificationsNode(String uid) {
  return 'notifications/taxi/$uid';
}

String taxiIsLookingField(String uid) => "${taxiAuthNode(uid)}/state/isLooking";

String rootInProcessOrderDriverLocationNode(String orderId) {
  return 'orders/inProcess/taxi/$orderId/driver/location';
}

String customerInProcessOrderDriverLocationNode(
    String orderId, String customerId) {
  return 'customers/inProcessOrders/$customerId/$orderId/driver/location';
}

String taxiPastOrdersNode(String uid) {
  return '/taxi/pastOrders/$uid';
}

String taxiInProcessOrderNode(String uid) {
  return 'taxi/inProcessOrders/$uid';
}
