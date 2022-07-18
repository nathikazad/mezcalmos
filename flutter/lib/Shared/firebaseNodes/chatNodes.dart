String messagesNode(String chatId) {
  return '${chatNode(chatId)}/messages';
}

String chatNode(String chatId) {
  return 'chat/$chatId';
}
