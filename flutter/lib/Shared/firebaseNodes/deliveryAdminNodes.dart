String adminNode(String uid) {
  return 'deliveryAdmins/info/$uid';
}

String adminNotificationInfoNode(String uid) {
  return adminNode(uid) + '/notificationInfo';
}

String adminAppVersionNode(String uid) {
  return adminNode(uid) + '/versionNumber';
}

String adminNotificationsNode(String uid) {
  return 'notifications/deliveryAdmin/$uid';
}
