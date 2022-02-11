String adminNode(String uid) {
  return 'deliveryAdmins/info/$uid';
}

String adminNotificationInfoNode(String uid) {
  return 'deliveryAdmins/info/$uid/notificationInfo';
}

String adminAppVersionNode(String uid) {
  return 'deliveryAdmins/info/$uid/versionNumber';
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
