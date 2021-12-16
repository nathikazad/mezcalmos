String taxiAuthNode(String uid) {
  return 'taxis/info/$uid';
}

String taxiStateNode(String uid) {
  return 'taxis/info/$uid/state';
}

String notificationStatusReceivedNode(String orderId, String uid) {
  return 'orders/open/taxi/$orderId/notificationStatus/$uid/received';
}

String notificationStatusReadNode(String orderId, String uid) {
  return 'orders/open/taxi/$orderId/notificationStatus/$uid/read';
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
  return 'taxis/pastOrders/$uid';
}

String taxiInProcessOrderNode(String uid) {
  return 'taxis/inProcessOrders/$uid';
}

String taxiInProcessOrderDriverLocationNode(
    {required String orderId, required String taxiId}) {
  return taxiInProcessOrderNode(taxiId) + '/$orderId/driver/location';
}
