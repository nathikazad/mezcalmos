import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';

String messagesNode(String chatId) {
  return '${chatNode(chatId)}/messages';
}

String chatNode(String chatId) {
  return 'chat/$chatId';
}

String agoraChatNode(int chatId, String userId, ParticipantType type) {
  return chatNode(chatId.toString()) +
      '/participants/${type.toFirebaseFormattedString()}/$userId/agora';
}
