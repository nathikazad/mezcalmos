import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/chat/__generated/hsChat.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/env.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<HasuraChat?> get_chat_info({required int chat_id}) async {
  mezDbgPrint("[log] Called :: get_chat_info :: chat_id :: $chat_id ");
  List<Message> _get_messages(List<Object?> msgs) {
    final List<Message> RetMsgs = [];
    mezDbgPrint(
        "[log] Called :: get_chat_info :: chat_id :: type :: ${msgs.runtimeType}");

    msgs.forEach((Object? jsonString) {
      mezDbgPrint("$jsonString :: type :: ${jsonString.runtimeType}");
      // I use the timestamp as key
      if (jsonString != null) {
        final Map<String, dynamic> msg = jsonString
            as Map<String, dynamic>; //mapFromJson(jsonString as String);
        RetMsgs.add(
          Message(
            message: msg['message'],
            timestamp: DateTime.parse(msg['timestamp']).toLocal(),
            userId: msg['userId'],
          ),
        );
      }
    });

    return RetMsgs;
  }

  final QueryResult<Query$get_chat_info> _chat =
      await _hasuraDb.graphQLClient.query$get_chat_info(
    Options$Query$get_chat_info(
      variables: Variables$Query$get_chat_info(chat_id: chat_id),
    ),
  );

  if (_chat.parsedData?.chat_by_pk == null) {
    mezDbgPrint("Chat data 👋👋👋👋👋👋👋👋👋👋 =>${_chat.data}");
    throwError(_chat.exception);
  } else {
    mezDbgPrint("[+] called get_chat_info :: SUCCESS.");
    final HasuraChat RetChat = HasuraChat(
      chatInfo: HasuraChatInfo(
        chatTite: _chat.parsedData!.chat_by_pk!
            .chat_info!['${MezEnv.appType.toNormalString()}']['chatTitle'],
        phoneNumber: _chat.parsedData!.chat_by_pk!
            .chat_info!['${MezEnv.appType.toNormalString()}']['phoneNumber'],
        chatImg: _chat.parsedData!.chat_by_pk!
            .chat_info!['${MezEnv.appType.toNormalString()}']['chatImage'],
        parentlink: _chat.parsedData!.chat_by_pk!
            .chat_info!['${MezEnv.appType.toNormalString()}']['parentLink'],
      ),
      creationTime:
          DateTime.parse(_chat.parsedData!.chat_by_pk!.creation_time).toLocal(),
      id: chat_id,
      messages: _get_messages(_chat.parsedData!.chat_by_pk!.messages),
      participants: _get_participants(
        _chat.parsedData!.chat_by_pk!.chat_participants,
      ),
    );
    return RetChat;
  }
  return null;
}

Future<void> send_message(
    {required int chat_id, required Map<String, dynamic> msg}) async {
  final QueryResult<Mutation$add_message> _resp =
      await _hasuraDb.graphQLClient.mutate$add_message(
    Options$Mutation$add_message(
      variables: Variables$Mutation$add_message(chat_id: chat_id, msg: msg),
    ),
  );

  mezDbgPrint(msg);
  if (_resp.hasException ||
      _resp.parsedData?.update_chat?.affected_rows == null) {
    mezDbgPrint("[+] called send_message :: Exception :: ${_resp.exception}");
  } else {
    mezDbgPrint("[+] called send_message :: SUCCESS");
  }
}

// get_chat_info

Stream<List<Message>> listen_on_chat_messages({required int chatId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_chat_messages(
    Options$Subscription$listen_on_chat_messages(
      variables: Variables$Subscription$listen_on_chat_messages(
        chat_id: chatId,
      ),
    ),
  )
      .map<List<Message>>(
          (QueryResult<Subscription$listen_on_chat_messages> event) {
    mezDbgPrint("Event from Chat::Messages 🚀🚀🚀 $event");
    final List<Message> msgs = [];
    final List<dynamic>? chatMsgs = event.parsedData?.chat_by_pk?.messages;
    chatMsgs?.forEach((_msg) {
      final Map<String, dynamic> msg =
          _msg as Map<String, dynamic>; //mapFromJson(_msg as String);
      msgs.add(
        Message(
          message: msg['message'],
          timestamp: DateTime.parse(msg['timestamp']).toLocal(),
          userId: msg['userId'],
        ),
      );
    });
    return msgs;
  });
}

List<Participant> _get_participants(
    List<Query$get_chat_info$chat_by_pk$chat_participants> participants) {
  final List<Participant> retParticipants = [];

  if (participants.isNotEmpty) {
    participants.forEach(
        (Query$get_chat_info$chat_by_pk$chat_participants _participant) {
      retParticipants.add(
        Participant(
          image: _participant.user.image!,
          name: _participant.user.name!,
          participantType:
              _participant.app_type_id.toParticipantTypeFromHasuraAppTypeId(),
          id: _participant.user.id,
        ),
      );
    });
  }

  return retParticipants;
}
