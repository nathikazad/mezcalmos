String customerNode(String uid) {
  return 'customers/info/$uid/';
}

String customerCart(String uid) {
  return 'customers/info/${uid}/cart';
}

String customerPastOrders(String uid) {
  return 'customers/pastOrders/${uid}';
}

String savedLocationsNode(String uid) {
  return 'customers/info/$uid/savedLocations';
}

String savedLocationNode(String uid, String locationId) {
  return 'customers/info/$uid/savedLocations/${locationId}';
}

String customerInProcessOrders(String uid) {
  return 'customers/inProcessOrders/${uid}';
}

String customerAppVersionNode(String uid) {
  return 'customers/info/${uid}/versionNumber';
}

String customerNotificationInfoNode(String uid) {
  return 'customers/info/${uid}/notificationInfo';
}

String notificationsNode(String uid) {
  return 'notifications/customer/$uid';
}
