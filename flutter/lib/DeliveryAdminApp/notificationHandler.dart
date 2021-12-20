import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

Notification deliveryAdminNotificationHandler(String key, dynamic value) {
  NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  mezDbgPrint(notificationType.toFirebaseFormatString());
  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      return orderStatusChangeNotification(key, value);
    case NotificationType.NewOrder:
      return newOrderNotification(key, value);
    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification orderStatusChangeNotification(String key, dynamic value) {
  RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  return Notification(
      id: key,
      linkUrl: getRestaurantOrderRoute(value['orderId']),
      body: 'Order is now ${newOrdersStatus.toFirebaseFormatString()}',
      imgUrl: "assets/images/customer/cancel.png",
      title: newOrdersStatus.toFirebaseFormatString(),
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      variableParams: value,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction());
}

Notification newOrderNotification(String key, dynamic value) {
  return Notification(
      id: key,
      linkUrl: getRestaurantOrderRoute(value['orderId']),
      body: 'New order from restaurant ${value['restaurant']['name']}',
      imgUrl: value['restaurant']['image'],
      title: "New Order",
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewOrder,
      variableParams: value,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction());
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
      variableParams: value,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction());
}
