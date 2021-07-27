const String taxiOpenOrdersNode = "openOrders/taxi";
String taxiAuthNode(String? uid) {
  return 'taxiDrivers/$uid';
}

String notificationsNode(String? uid) {
  return 'notifications/taxi/$uid';
}

String orderChatNode(String orderId) {
  return 'chat/${orderId}';
}

String taxiIsLookingField(String uid) => "${taxiAuthNode(uid)}/state/isLooking";

String orderId(String? orderId) {
  return 'orders/taxi/$orderId';
}

String userInfo(String? userId) {
  return 'users/$userId/info';
}

String userLanguage(String? userId) {
  return 'users/$userId/info/language';
}
