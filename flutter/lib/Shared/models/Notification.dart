import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

enum NotificationType { NewMessage, NewAdminMessage, OrderStatusChange }

extension ParseNotificationTypeToString on NotificationType {
  String toLowerCaseString() {
    return this.toString().split('.').last.toLowerCase();
  }
}

extension ParseStringToNotificationType on String {
  NotificationType toNotificationType() {
    return NotificationType.values
        .firstWhere((e) => e.toLowerCaseString() == this.toLowerCase());
  }
}

abstract class Notification {
  dynamic id;
  NotificationType notificationType;
  dynamic variableParams;
  bool isEmpty = false;
  DateTime timestamp;
  Notification(
      {required this.id,
      required this.notificationType,
      this.variableParams,
      required this.timestamp});

  List<Object> get props => [id, notificationType, variableParams];
  String get formattedTime =>
      DateFormat('HH:mm').format(this.timestamp.toLocal()).toString();
  String get title;
  String get body;
  String get imgUrl;
  String get linkUrl;
  factory Notification.fromJson(dynamic key, dynamic value) {
    NotificationType notificationType =
        value['notificationType'].toString().toNotificationType();
    DateTime timestamp = DateTime.parse(value['time']);
    mezDbgPrint(notificationType.toString());
    switch (notificationType) {
      case NotificationType.NewMessage:
        return NewMessageNotification(
            id: key,
            notificationType: notificationType,
            orderId: value['orderId'],
            message: value['message'],
            senderImage: value['sender']['image'],
            senderName: value['sender']['name'],
            timestamp: timestamp);
      case NotificationType.OrderStatusChange:
        return OrderStatusChangeNotification(
            id: key,
            notificationType: notificationType,
            orderId: value['orderId'],
            newOrdersStatus: value['status'].toString().toOrderStatus(),
            timestamp: timestamp);
      default:
        throw StateError("Invalid Notification Type");
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "notificationType": notificationType,
        "variableParams": variableParams,
      };
}

class OrderStatusChangeNotification extends Notification {
  String orderId;
  OrdersStatus newOrdersStatus;
  OrderStatusChangeNotification(
      {required String id,
      required NotificationType notificationType,
      required this.orderId,
      required this.newOrdersStatus,
      required DateTime timestamp})
      : super(id: id, notificationType: notificationType, timestamp: timestamp);

  String get title => this.newOrdersStatus.toShortString();
  String get body => 'Order is now ${newOrdersStatus.toShortString()}';
  String get imgUrl =>
      "assets/images/cancel.png"; //has to be made dynamic for customer app
  String get linkUrl =>
      kCurrentOrderPage; //has to be made dynamic for customer app
}

class NewMessageNotification extends Notification {
  String orderId;
  String message;
  String senderImage;
  String senderName;
  NewMessageNotification(
      {required String id,
      required NotificationType notificationType,
      required this.orderId,
      required this.message,
      required this.senderName,
      required this.senderImage,
      required DateTime timestamp})
      : super(id: id, notificationType: notificationType, timestamp: timestamp);
  String get title => this.senderName;
  String get body => this.message;
  String get imgUrl => this.senderImage;
  String get linkUrl => getMessagesRoute(this.orderId);
}
