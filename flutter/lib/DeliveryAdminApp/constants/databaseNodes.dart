String adminNode(String uid) {
  return 'deliveryAdmins/info/$uid';
}

String adminNotificationInfoNode(String uid) {
  return adminNode(uid) + '/notificationInfo';
}

String adminAppVersionNode(String uid) {
  return adminNode(uid) + '/versionNumber';
}

String notificationsNode(String uid) {
  return 'notifications/deliveryAdmin/$uid';
}

String restaurantInProcessOrdersNode() {
  return 'orders/inProcess/restaurant';
}

String restaurantPastOrdersNode() {
  return 'orders/past/restaurant';
}

String laundryInProcessOrdersNode() {
  return 'orders/inProcess/laundry';
}

String laundryPastOrdersNode() {
  return 'orders/past/laundry';
}
