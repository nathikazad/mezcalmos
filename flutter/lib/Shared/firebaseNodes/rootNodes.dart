String chatNode(String chatId) {
  return 'chat/$chatId';
}

String userLanguage(String? userId) {
  return 'users/$userId/info/language';
}

String userInfo(String? userId) {
  return 'users/$userId/info';
}
