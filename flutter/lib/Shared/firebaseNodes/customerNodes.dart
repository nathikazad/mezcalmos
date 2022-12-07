String customerNode(String uid) {
  return 'customers/info/$uid/';
}

String customerCart(String uid) {
  return 'customers/info/$uid/cart';
}

String customerInfoNode(String uid) {
  return 'customers/info/$uid/info';
}

String customerAppVersionNode(String uid) {
  return 'customers/info/$uid/versionNumber';
}

String customerStripeNode(String uid) {
  return 'customers/info/$uid/stripe';
}

String customerCardsNode(String uid) {
  return 'customers/info/$uid/stripe/cards/';
}

String customerNotificationInfoNode(String uid) {
  return 'customers/info/$uid/notificationInfo';
}

String customerPastOrders(String uid) {
  return 'customers/pastOrders/$uid';
}

String customerInProcessOrders(String uid) {
  return 'customers/inProcessOrders/$uid';
}

String savedLocationsNode(String uid) {
  return 'customers/info/$uid/savedLocations';
}

String savedLocationNode(String uid, String locationId) {
  return 'customers/info/$uid/savedLocations/$locationId';
}

String customerNotificationsNode(String uid) {
  return 'notifications/customer/$uid';
}

String customerInProcessOrderReadNode(
    String orderId, String customerId, String driverId) {
  return 'customers/inProcessOrders/$customerId/$orderId/notificationStatus/$driverId/read';
}

String customerInProcessOrderReceivedNode(
    String orderId, String customerId, String driverId) {
  return 'customers/inProcessOrders/$customerId/$orderId/notificationStatus/$driverId/received/value';
}

String customerInProcessOrderDriverLocationNode(
    {required String orderId,
    required String customerId,
    String driverAddress = "driver"}) {
  return 'customers/inProcessOrders/$customerId/$orderId/$driverAddress/location';
}

String customerInProcessOrder({
  required String orderId,
  required String customerId,
}) {
  return 'customers/inProcessOrders/$customerId/$orderId';
}

String customersCounterOfferNode(int orderId, int customerId, int driverId) {
  return 'customers/inProcessOrders/$customerId/$orderId/counterOffers/$driverId';
}

String customerCounterOfferNodeStatus(
    int orderId, int customerId, int driverId) {
  return customersCounterOfferNode(orderId, customerId, driverId) + "/status";
}
