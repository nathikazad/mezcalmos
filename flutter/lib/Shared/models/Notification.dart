import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

enum NotificationType {
  NewMessage,
  NewAdminMessage,
  OrderStatusChange,
  NewOrder
}

extension ParseNotificationTypeToString on NotificationType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToNotificationType on String {
  NotificationType toNotificationType() {
    return NotificationType.values
        .firstWhere((e) => e.toFirebaseFormatString() == this);
  }
}

class Notification {
  dynamic id;
  dynamic variableParams;
  bool isEmpty = false;
  DateTime timestamp;
  String title;
  String body;
  String imgUrl;
  String linkUrl;
  NotificationType notificationType;
  bool showIfOnLinkPage;
  String? get orderId => variableParams['orderId'];
  String? get orderType => variableParams['orderType'];
  Notification(
      {required this.id,
      this.variableParams,
      required this.timestamp,
      required this.title,
      required this.body,
      required this.imgUrl,
      required this.linkUrl,
      required this.notificationType,
      this.showIfOnLinkPage = false});

  String get formattedTime =>
      DateFormat('HH:mm').format(this.timestamp.toLocal()).toString();
  Map<String, dynamic> toJson() => {
        "id": id,
        "variableParams": variableParams,
      };
}
