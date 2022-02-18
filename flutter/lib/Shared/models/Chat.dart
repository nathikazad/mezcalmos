import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

enum ParticipantType {
  Customer,
  Taxi,
  TaxiAdmin,
  Laundry,
  DeliveryAdmin,
  Restaurant,
  DeliveryDriver
}

extension ParseParticipantTypeToString on ParticipantType {
  String toFirebaseFormattedString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToParticipantType on String {
  ParticipantType toParticipantType() {
    mezDbgPrint(ParticipantType.values);
    mezDbgPrint(this);
    return ParticipantType.values
        .firstWhere((e) => e.toFirebaseFormattedString() == this);
  }
}

class Participant {
  String image;
  String name;
  String id;
  ParticipantType participantType;
  Participant(
      {required this.image,
      required this.name,
      required this.participantType,
      required this.id});
}

class Message {
  late String message;
  DateTime? timeStamp;
  String? formatedTime;
  late String userId;
  Message(message, timestamp, userId) {
    this.message = message;
    this.timeStamp = timestamp;
    this.formatedTime = timestamp == null
        ? null
        : DateFormat('HH:mm').format(timestamp).toString();
    this.userId = userId;
  }
}

class Chat {
  late String chatId;
  late String chatType;
  OrderType? orderType;
  String? orderId;
  late Map<String, Participant> participants;
  List<Message> messages = <Message>[];

  Chat(this.chatType, this.orderType, this.participants, this.messages,
      this.orderId);

  Chat.fromJson(key, _value) {
    Map<String, dynamic> value = new Map<String, dynamic>.from(_value);

    Map<String, Participant> _participants = {};
    List<Message> _messages = [];

    value['participants']?.forEach((key, p) {
      _participants[key] = Participant(
          image: p['image'],
          name: p['name'],
          participantType: p['particpantType'].toString().toParticipantType(),
          id: key);
    });

    value['messages']?.forEach((key, m) {
      try {
        _messages.add(
            Message(m['message'], DateTime.parse(m['timestamp']), m['userId']));
      } catch (e) {
        _messages.add(Message(m['message'], null, m['userId']));
      }
    });

    _messages.sort((after, before) {
      if (before.timeStamp == null || after.timeStamp == null)
        return 0;
      else
        return before.timeStamp!.compareTo(after.timeStamp!);
    });

    this.chatType = value['chatType'];
    this.chatId = key;
    this.orderId = value['orderId'];
    this.orderType = value['orderType']?.toString().toOrderType();
    this.participants = _participants;
    this.messages = _messages;
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "chatType": chatType,
        "orderType": orderType,
        "participants": participants,
        "messages": messages,
      };
}
