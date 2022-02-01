String customerNode(String uid) {
  return 'customers/info/$uid/';
}

String customerCart(String uid) {
  return 'customers/info/${uid}/cart';
}

String customerAppVersionNode(String uid) {
  return 'customers/info/${uid}/versionNumber';
}

String customerNotificationInfoNode(String uid) {
  return 'customers/info/${uid}/notificationInfo';
}

String customerPastOrders(String uid) {
  return 'customers/pastOrders/${uid}';
}

String customerInProcessOrders(String uid) {
  return 'customers/inProcessOrders/${uid}';
}

String savedLocationsNode(String uid) {
  return 'customers/info/$uid/savedLocations';
}

String savedLocationNode(String uid, String locationId) {
  return 'customers/info/$uid/savedLocations/${locationId}';
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
    String orderId, String customerId) {
  return 'customers/inProcessOrders/$customerId/$orderId/driver/location';
}


