String customerNode(String? uid) {
  return 'customers/$uid';
}

String notificationStatusReadNode(String? orderId, String? uid) {
  return 'notificationStatus/taxi/$orderId/$uid/read';
}

String customerCart(String? uid) {
  return 'customers/${uid}/cart';
}

String customerAppVersionNode(String? uid) {
  return 'customers/${uid}/versionNumber';
}

String customerNotificationInfoNode(String? uid) {
  return 'customers/${uid}/notificationInfo';
}

// String notificationsNode(String? uid) {
//   return 'notifications/taxi/$uid';
// }


// String orderId(String? orderId) {
//   return 'orders/taxi/$orderId';
// }
