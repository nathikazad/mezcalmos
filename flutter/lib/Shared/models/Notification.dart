import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum NotificationType {
  NewMessage,
  NewAdminMessage,
  OrderStatusChange,
  NewOrder,
  NewCounterOffer
}

extension ParseNotificationTypeToString on NotificationType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToNotificationType on String {
  NotificationType toNotificationType() {
    return NotificationType.values
        .firstWhere((NotificationType e) => e.toFirebaseFormatString() == this);
  }
}

enum NotificationAction {
  ShowPopUp,
  ShowSnackBarAlways,
  ShowSnackbarOnlyIfNotOnPage
}

extension ParseNotificationActionToString on NotificationAction {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringNotificationAction on String {
  NotificationAction toNotificationAction() {
    return NotificationAction.values.firstWhere(
      (NotificationAction e) => e.toFirebaseFormatString() == this,
      orElse: () => NotificationAction.ShowSnackBarAlways,
    );
  }
}

class Notification {
  String id;
  dynamic variableParams;
  bool isEmpty = false;
  DateTime timestamp;
  IconData? icon;
  String title;
  String body;
  String imgUrl;
  String linkUrl;
  String? linkText;
  NotificationType notificationType;
  NotificationAction notificationAction;
  String? get chatId => variableParams['chatId'];
  String? get orderId => variableParams['orderId'];
  String? get orderType => variableParams['orderType'];
  Notification(
      {required this.id,
      this.variableParams,
      required this.timestamp,
      this.icon,
      required this.title,
      required this.body,
      required this.imgUrl,
      required this.linkUrl,
      required this.notificationType,
      required this.notificationAction,
      this.linkText});

  String get formattedTime =>
      DateFormat('HH:mm').format(timestamp.toLocal()).toString();
  Map<String, dynamic> toJson() => {
        "id": id,
        "variableParams": variableParams,
      };
}

abstract class NotificationForQueue {
  NotificationType notificationType;
  DateTime timeStamp;
  NotificationForQueue(
      {required this.notificationType, required this.timeStamp});
  Map<String, dynamic> toFirebaseFormatJson() => {
        "timestamp": timeStamp.toString(),
        "notificationType": notificationType.toFirebaseFormatString()
      };
}
