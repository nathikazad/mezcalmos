import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

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

enum NotificationAction {
  ShowPopUp,
  ShowSnackBarAlways,
  ShowSnackbarOnlyIfNotOnPage
}

extension ParseNotificationActionToString on NotificationAction {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringNotificationAction on String {
  NotificationAction toNotificationAction() {
    return NotificationAction.values.firstWhere(
      (e) => e.toFirebaseFormatString() == this,
      orElse: () => NotificationAction.ShowSnackBarAlways,
    );
  }
}

class Notification {
  String id;
  dynamic variableParams;
  bool isEmpty = false;
  DateTime timestamp;
  String title;
  String body;
  String imgUrl;
  String linkUrl;
  String? linkText;
  NotificationType notificationType;
  NotificationAction notificationAction;
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
      required this.notificationAction,
      this.linkText});

  String get formattedTime =>
      DateFormat('HH:mm').format(this.timestamp.toLocal()).toString();
  Map<String, dynamic> toJson() => {
        "id": id,
        "variableParams": variableParams,
      };
}
