String deliveryDriversNode() {
  return 'deliveryDrivers/info/';
}

String deliveryDriverAuthNode(String uid) {
  return 'deliveryDrivers/info/$uid';
}

String deliveryDriverStateNode(String uid) {
  return 'deliveryDrivers/info/$uid/state';
}

String deliveryDriverInfoNode(String uid) {
  return 'deliveryDrivers/info/$uid/info';
}

String deliveryDriverAppVersionNode(String uid) {
  return deliveryDriverAuthNode(uid) + '/versionNumber';
}

String deliveryDriverNotificationsNode(String uid) {
  return 'notifications/deliveryDriver/$uid';
}

String deliveryDriverIsOnlineField(String uid) =>
    "${deliveryDriverAuthNode(uid)}/state/isOnline";

String deliveryDriversPastOrdersNode(String uid) {
  return 'deliveryDrivers/pastOrders/$uid';
}

String deliveryDriversInProcessOrdersNode(String uid) {
  return 'deliveryDrivers/inProcessOrders/$uid';
}

String deliveryDriverInProcessOrderDriverLocationNode(
    {required String orderId,
    required String deliveryDriverId,
    String driverAddress = "driver"}) {
  return deliveryDriversInProcessOrdersNode(deliveryDriverId) +
      '/$orderId/$driverAddress/location';
}
