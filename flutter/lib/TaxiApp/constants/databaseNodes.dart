const String taxiOpenOrdersNode = "openOrders/taxi";
String taxiAuthNode(String uid) {
  return 'taxiDrivers/$uid';
}

String taxiStateNode(String uid) {
  return 'taxiDrivers/$uid/state';
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

String orderId(String orderId) {
  return 'orders/taxi/$orderId';
}
