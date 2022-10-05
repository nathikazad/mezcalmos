String userLanguageNode(String userId) {
  return 'users/$userId/info/language';
}

String notificationQueueNode([String? notificationId]) {
  String address = 'notificationQueue';
  if (notificationId != null) address += '/$notificationId';
  return address;
}

String userInfoNode(String userId) {
  return 'users/$userId/info';
}

String appStoreIdNode(String appName) {
  return 'metadata/appStoreIds/$appName';
}

String baseShippingPriceNode() {
  return 'metadata/baseShippingPrice';
}

String minShippingPriceNode() {
  return 'metadata/shippingCost/minPrice';
}

String perKmShippingPriceNode() {
  return 'metadata/shippingCost/perKm';
}

String metaDataNode() {
  return 'metadata';
}

String userDeletedNode(String userId) {
  return '/users/$userId/info/deleted';
}
