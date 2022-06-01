// ignore_for_file: constant_identifier_names, avoid_annotating_with_dynamic

import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

enum ParticipantType {
  Customer,
  Taxi,
  TaxiAdmin,
  Laundry,
  DeliveryAdmin,
  Restaurant,
  DeliveryDriver,
  LaundryOperator,
  RestaurantOperator
}

extension ParseParticipantTypeToString on ParticipantType {
  String toFirebaseFormattedString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension AppTypeToParticipantType on AppType {
  ParticipantType toParticipantTypefromAppType() {
    switch (this) {
      case AppType.CustomerApp:
        return ParticipantType.Customer;
      case AppType.TaxiApp:
        return ParticipantType.Taxi;
      case AppType.DeliveryApp:
        return ParticipantType.DeliveryDriver;
      case AppType.DeliveryAdminApp:
        return ParticipantType.DeliveryAdmin;
      case AppType.LaundryApp:
        return ParticipantType.LaundryOperator;
      case AppType.RestaurantApp:
        return ParticipantType.RestaurantOperator;
      default:
        throw Exception(
            "App type $this cannot be converted to participantType");
    }
  }
}

extension ParseStringToParticipantType on String {
  ParticipantType toParticipantType() {
    return ParticipantType.values.firstWhere(
        (ParticipantType participantType) =>
            participantType.toFirebaseFormattedString() == this);
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
  String message;
  DateTime timestamp;
  String get formatedTime => DateFormat('HH:mm').format(timestamp).toString();
  String userId;
  ParticipantType participantType;
  Message({
    required this.message,
    required this.timestamp,
    required this.userId,
    required this.participantType,
  });
}

class Chat {
  String chatId;
  String chatType;
  OrderType? orderType;
  String? orderId;
  Map<ParticipantType?, Map<String, Participant>> _participants =
      <ParticipantType?, Map<String, Participant>>{};
  List<Message> _messages = <Message>[];

  List<Message> get messages {
    _messages.sort((Message after, Message before) =>
        before.timestamp.compareTo(after.timestamp));
    return _messages;
  }

  Participant? getParticipant(
          ParticipantType participantType, String participantId) =>
      _participants[participantType]?[participantId];

  Map<String, Participant>? getParticipants(ParticipantType participantType) =>
      _participants[participantType];

  Chat({
    required this.chatId,
    required this.chatType,
    this.orderType,
    this.orderId,
  });

  factory Chat.fromJson(String chatId, dynamic chatData) {
    mezDbgPrint("Chat.fromJson > Participants > ${chatData['participants']}}");
    final Chat chat = Chat(
        chatId: chatId,
        chatType: chatData['chatType'],
        orderType: chatData['orderType']?.toString().toOrderType() ?? null,
        orderId: chatData['orderId'] ?? null);

    chatData['participants']
        ?.forEach((dynamic participantTypeAsString, dynamic map) {
      final ParticipantType participantType =
          participantTypeAsString.toString().toParticipantType();
      chatData['participants'][participantTypeAsString]
          .forEach((dynamic participantId, dynamic participantData) {
        if (chat._participants[participantType] == null)
          chat._participants[participantType] = <String, Participant>{};
        chat._participants[participantType]![participantId] = Participant(
            image: participantData['image'],
            name: participantData['name'],
            participantType: participantType,
            id: participantId);
      });
    });

    // ignore: avoid_annotating_with_dynamic
    chatData['messages']?.forEach((dynamic messageId, dynamic messageData) {
      try {
        mezDbgPrint("[messageData] => $messageData");
        chat._messages.add(Message(
          message: messageData['message'],
          timestamp: DateTime.parse(messageData['timestamp']),
          userId: messageData['userId'],
          participantType:
              messageData['participantType'].toString().toParticipantType(),
        ));
      } catch (e) {
        // _messages.add(Message(m['message'], null, m['userId']));
        mezDbgPrint(
            "Message add error $e ==> chatId:$chatId messageId:$messageId ");
      }
    });
    return chat;
  }

  Map<String, dynamic> toJson() => {
        "chatType": chatType,
        "orderType": orderType,
        "participants": _participants,
        "messages": _messages,
      };
}

class MessageNotificationForQueue extends NotificationForQueue {
  String message;
  String userId;
  String chatId;
  String messageId;
  ParticipantType participantType;
  String? orderId;
  MessageNotificationForQueue(
      {required this.message,
      required this.userId,
      required this.chatId,
      required this.messageId,
      required this.participantType,
      this.orderId})
      : super(
            notificationType: NotificationType.NewMessage,
            timeStamp: DateTime.now().toUtc());

  Map<String, dynamic> toFirebaseFormatJson() => {
        ...super.toFirebaseFormatJson(),
        "chatId": chatId,
        "messageId": messageId,
        "participantType": participantType.toFirebaseFormattedString(),
        "userId": userId,
        "message": message,
        "orderId": orderId
      };
}
