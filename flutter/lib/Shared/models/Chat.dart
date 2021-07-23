class Participant {
  late String image;
  late String name;
  late String participantType;

  Participant(image, name, partcipantType);
}

class Message {
  late String message;
  late DateTime timeStamp;
  late String userId;
  Message(message, timestamp, userId);
}

class Chat {
  late String chatType;
  late String orderType;
  late Map<String, Participant> participants;
  late List<Message> messages;

  Chat(chatType, orderType, participants, messages);

  static Chat fromJson(dynamic value) {
    Map<String, Participant> participants = {};
    for (var participantId in value['participants']) {
      dynamic p = value['participants'][participantId];
      participants[participantId] =
          Participant(p.image, p.name, p.participantType);
    }
    List<Message> messages = [];
    for (var messageId in value['messages']) {
      dynamic m = value['messages'][messageId];
      messages.add(Message(m.message, DateTime.parse(m.timestamp), m.userId));
    }
    return Chat(value['chatType'], value['orderType'], participants, messages);
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "chatType": chatType,
        "orderType": orderType,
        "participants": participants,
        "messages": messages,
      };
}
