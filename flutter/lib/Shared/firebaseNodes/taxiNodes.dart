String taxiAuthNode(String uid) {
  return 'taxis/info/$uid';
}

String taxiStateNode(String uid) {
  return 'taxis/info/$uid/state';
}

String onlineTaxiStateNode(String uid) {
  return 'online/taxi/$uid/';
}

String taxiDriverAppVersionNode(String uid) {
  return taxiAuthNode(uid) + '/versionNumber';
}

String taxiNotificationsNode(String uid) {
  return 'notifications/taxi/$uid';
}

String taxiIsLookingField(String uid) => "${taxiAuthNode(uid)}/state/isLooking";

String taxiPastOrdersNode(String uid) {
  return 'taxis/pastOrders/$uid';
}

String taxiInProcessOrderNode(String uid) {
  return 'taxis/inProcessOrders/$uid';
}

String taxiInProcessOrderDriverLocationNode(
    {required String orderId, required String taxiId}) {
  return taxiInProcessOrderNode(taxiId) + '/$orderId/driver/location';
}
