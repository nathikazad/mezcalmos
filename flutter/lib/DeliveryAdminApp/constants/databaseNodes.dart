String adminNode(String uid) {
  return 'deliveryAdmins/$uid/';
}

String adminNotificationInfoNode(String uid) {
  return 'deliveryAdmins/${uid}/notificationInfo';
}

String adminAppVersionNode(String uid) {
  return 'deliveryAdmins/${uid}/versionNumber';
}

String notificationsNode(String uid) {
  return 'notifications/deliveryAdmin/$uid';
}

String inProcessOrdersNode() {
  return 'inProcessOrders/restaurant';
}
