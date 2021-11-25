String adminNode(String uid) {
  return 'deliveryAdmins/$uid';
}

String adminNotificationInfoNode(String uid) {
  return 'deliveryAdmins/$uid/info/notificationInfo';
}

String adminAppVersionNode(String uid) {
  return 'deliveryAdmins/$uid/info/versionNumber';
}

String notificationsNode(String uid) {
  return 'notifications/deliveryAdmin/$uid';
}

String inProcessOrdersNode() {
  return 'orders/inProcess/restaurant';
}

String pastOrdersNode() {
  return 'orders/past/restaurant';
}
