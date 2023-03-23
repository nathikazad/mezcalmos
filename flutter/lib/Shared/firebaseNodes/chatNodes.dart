import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

String messagesNode(String chatId) {
  return '${chatNode(chatId)}/messages';
}

String chatNode(String chatId) {
  return 'chat/$chatId';
}

String agoraChatNode(int chatId, String userId, ParticipantType type) {
  return chatNode(chatId.toString()) +
      '/participants/${type.toFirebaseFormatString()}/$userId/agora';
}
