// ignore_for_file: constant_identifier_names, avoid_annotating_with_dynamic

import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cf;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';

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

extension HasuraAppTypeIdParser on String {
  ParticipantType toParticipantTypeFromHasuraAppTypeId() {
    final String _formatted = toLowerCase();
    switch (_formatted) {
      case 'customer_mobile':
      case 'customer_web':
        return ParticipantType.Customer;
      case 'restaurant':
        return ParticipantType.Restaurant;
      default:
        return ParticipantType.Customer;
    }
  }
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
  int id;
  ParticipantType participantType;
  Participant({
    required this.image,
    required this.name,
    required this.participantType,
    required this.id,
  });

  @override
  String toString() {
    return "{name : $name , image: $image , id: $id , type: $participantType}";
  }
}

class AgoraDetails {
  num uid;
  String token;
  AgoraDetails({required this.uid, required this.token});

  factory AgoraDetails.fromData(dynamic data) {
    mezDbgPrint("AGORAAAAAATO DATA ===> $data");
    return AgoraDetails(uid: data['uid'], token: data['token']);
  }
}

class ParticipantWithAgora extends Participant {
  AgoraDetails? agora;
  ParticipantWithAgora(
      {required String image,
      required String name,
      required ParticipantType participantType,
      required int id,
      this.agora})
      : super(
            id: id, image: image, participantType: participantType, name: name);
}

class Message {
  String message;
  DateTime timestamp;
  String get formatedTime => DateFormat('HH:mm').format(timestamp).toString();
  int userId;
  // ParticipantType participantType;
  Message({
    required this.message,
    required this.timestamp,
    required this.userId,
    // required this.participantType,
  });
}

class HasuraChatInfo {
  final String chatTite;
  final String chatImg;
  final String parentlink;

  HasuraChatInfo({
    required this.chatTite,
    required this.chatImg,
    required this.parentlink,
  });
}

class HasuraChat {
  final int id;
  final List<Message> messages;
  final HasuraChatInfo chatInfo;
  DateTime creationTime;
  List<Participant> _participants = [];

  HasuraChat({
    required this.id,
    required this.messages,
    required this.chatInfo,
    required this.creationTime,
    required List<Participant> participants,
  }) {
    _participants = participants;
  }

  // Participant? getParticipant(
  //         ParticipantType participantType, String participantId) =>
  //     _participants[participantType]?[participantId];

  // Map<String, Participant>? getParticipants(ParticipantType participantType) =>
  //     _participants[participantType];
}

class Chat {
  String chatId;
  String chatType;
  OrderType? orderType;
  String? orderId;
  Map<ParticipantType?, Map<String, ParticipantWithAgora>> _participants =
      <ParticipantType?, Map<String, ParticipantWithAgora>>{};
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
          chat._participants[participantType] =
              <String, ParticipantWithAgora>{};
        chat._participants[participantType]![participantId] =
            ParticipantWithAgora(
          image: participantData['image'],
          name: participantData['name'],
          participantType: participantType,
          id: participantId,
          agora: participantData['agora'] == null
              ? null
              : AgoraDetails.fromData(
                  participantData['agora'],
                ),
        );
      });
    });

    // ignore: avoid_annotating_with_dynamic
    chatData['messages']?.forEach((dynamic messageId, dynamic messageData) {
      try {
        // mezDbgPrint("[messageData] => $messageData");
        chat._messages.add(Message(
          message: messageData['message'],
          timestamp: DateTime.parse(messageData['timestamp']),
          userId: messageData['userId'],
          // participantType:
          //     messageData['participantType'].toString().toParticipantType(),
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
  int userId;
  String chatId;
  String messageId;
  ParticipantType participantType;
  int? orderId;
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

enum CallNotificationtType { Incoming, EndCall }

extension ParseCallNotificationtTypeToString on CallNotificationtType {
  String toFirebaseFormattedString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCallNotificationtType on String {
  CallNotificationtType toCallNotificationtType() {
    return CallNotificationtType.values.firstWhere(
        (CallNotificationtType callNotificationtType) =>
            callNotificationtType.toFirebaseFormattedString() == this);
  }
}

class CallNotificationForQueue extends NotificationForQueue {
  int chatId;
  int callerId;
  ParticipantType callerParticipantType;
  int calleeId;
  ParticipantType calleeParticipantType;
  CallNotificationtType callNotificationType;
  CallNotificationForQueue({
    required this.chatId,
    required this.callerId,
    required this.callerParticipantType,
    required this.calleeId,
    required this.calleeParticipantType,
    required this.callNotificationType,
  }) : super(
          notificationType: NotificationType.Call,
          timeStamp: DateTime.now().toUtc(),
        );

  Map<String, dynamic> toFirebaseFormatJson() => {
        ...super.toFirebaseFormatJson(),
        "chatId": chatId,
        "callerId": callerId,
        "callerParticipantType":
            callerParticipantType.toFirebaseFormattedString(),
        "calleeId": calleeId,
        "calleeParticipantType":
            calleeParticipantType.toFirebaseFormattedString(),
        "callNotificationType":
            callNotificationType.toFirebaseFormattedString(),
      };
}
