import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class DeliveryMessage {
  final int id;
  final DvMessageEntry entry;
  final String phoneNumber;
  final String? userName;
  final String? userImage;
  final String? driverName;
  final String? driverPhone;
  final int? driverId;
  final DateTime receivedTime;
  final DateTime? finishedTime;
  final DateTime? respondedTime;
  final bool showDriverInfo;

  DeliveryMessage(
      {required this.id,
      required this.entry,
      required this.phoneNumber,
      this.driverId,
      required this.receivedTime,
      this.finishedTime,
      this.respondedTime,
      this.userImage,
      this.userName,
      this.driverName,
      this.driverPhone,
      this.showDriverInfo = false});
  bool get isResponded => respondedTime != null && driverId != null;
}

class DvMessageEntry {
  final String id;
  final String from;
  final DvTextMessage? text;
  final String type;
  final bool resolved;
  final DateTime timestamp; // Change the type to DateTime

  DvMessageEntry({
    required this.id,
    required this.from,
    this.text,
    required this.type,
    required this.resolved,
    required this.timestamp,
  });

  factory DvMessageEntry.fromJson(Map<String, dynamic> json) {
    return DvMessageEntry(
      id: json['id'] ?? '',
      from: json['from'] ?? '',
      text: DvTextMessage.fromJson(json['text'] ?? <String, dynamic>{}),
      type: json['type'] ?? '',
      resolved: json['resolved'] ?? false,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['timestamp'] ?? '0') *
              1000), // Convert timestamp to DateTime
    );
  }
}

class DvTextMessage {
  final String body;

  DvTextMessage({
    required this.body,
  });

  factory DvTextMessage.fromJson(Map<String, dynamic> json) {
    return DvTextMessage(
      body: json['body'] ?? '',
    );
  }
}

extension DvMinimalOrdersHelper on DeliveryMinimalOrder {
  DateTime get receivedTime => DateTime.parse(time);
}
