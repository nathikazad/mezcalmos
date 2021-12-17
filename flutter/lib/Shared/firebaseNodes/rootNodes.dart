String orderChatNode(String orderId) {
  return 'chat/$orderId';
}

String userLanguage(String? userId) {
  return 'users/$userId/info/language';
}

String userInfo(String? userId) {
  return 'users/$userId/info';
}
