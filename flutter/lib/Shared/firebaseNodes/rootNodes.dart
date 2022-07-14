String chatNode(String chatId) {
  return 'chat/$chatId';
}

String userLanguageNode(String userId) {
  return 'users/$userId/info/language';
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

String userDeletedNode(String userId) {
  return '/users/$userId/info/deleted';
}
