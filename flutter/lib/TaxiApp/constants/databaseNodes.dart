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

String inProcessOrder(String orderId) {
  return 'orders/inProcess/taxi/$orderId';
}

String pastOrder(String orderId) {
  return 'orders/past/taxi/$orderId';
}

String inProcessOrderStatus(String orderId) {
  return 'orders/inProcess/taxi/$orderId/status';
}
