String userLanguage(String? userId) {
  return 'users/$userId/info/language';
}

String userInfo(String? userId) {
  return 'users/$userId/info';
}

String orderChatNode(String orderId) {
  return 'chat/$orderId';
}
