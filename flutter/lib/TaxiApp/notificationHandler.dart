import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

Notification taxiNotificationHandler(String key, dynamic value) {
  NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      return orderStatusChangeNotificationHandler(key, value);
    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification orderStatusChangeNotificationHandler(String key, dynamic value) {
  TaxiOrdersStatus newOrdersStatus =
      value['status'].toString().toTaxiOrderStatus();
  Map<String, dynamic> dynamicFields =
      getTaxiOrderStatusFields(newOrdersStatus)!;
  return Notification(
      id: key,
      linkUrl: kCurrentOrderRoute,
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}

Map<String, dynamic>? getTaxiOrderStatusFields(TaxiOrdersStatus taxiOrderStatus,
    {String? customerName}) {
  switch (taxiOrderStatus) {
    case TaxiOrdersStatus.CancelledByCustomer:
      return <String, dynamic>{
        "title": "Ride Canceled.",
        "body": "Ride has been canceled by ${customerName ?? 'customer'}",
        "imgUrl": "assets/images/cancel.png"
      };
    default:
    // do nothing
  }
}

Notification newMessageNotification(String key, dynamic value) {
  return Notification(
      id: key,
      linkUrl: getCustomerMessagesRoute(value['orderId']),
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}
