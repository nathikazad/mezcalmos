const String taxiOpenOrdersNode = "openOrders/taxi";
String taxiAuthNode(String? uid) {
  return 'taxiDrivers/$uid';
}

String taxiIsLookingField(String uid) => "${taxiAuthNode(uid)}/state/isLooking";

String orderId(String? orderId) {
  return 'orders/taxi/$orderId';
}

String userInfo(String? userId) {
  return 'users/$userId/info';
}
