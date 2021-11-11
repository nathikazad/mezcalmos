import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

Notification customerNotificationHandler(String key, dynamic value) {
  NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      OrderType orderType = value['orderType'].toString().toOrderType();
      switch (orderType) {
        case OrderType.Restaurant:
          return restaurantOrderStatusChangeNotificationHandler(key, value);
        default:
          throw StateError("Invalid Notification Type");
      }
    default:
      throw StateError("Invalid Notification Type");
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

Notification restaurantOrderStatusChangeNotificationHandler(
    String key, dynamic value) {
  RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  Map<String, dynamic> dynamicFields =
      getRestaurantOrderStatusFields(newOrdersStatus)!;
  return Notification(
      id: key,
      linkUrl: getCurrentRestaurantOrderRoute(value['orderId']),
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      variableParams: value,
      showIfOnLinkPage: true);
}

Map<String, dynamic>? getRestaurantOrderStatusFields(
    RestaurantOrderStatus restaurantOrderStatus) {
  switch (restaurantOrderStatus) {
    case RestaurantOrderStatus.PreparingOrder:
      return <String, dynamic>{
        "title": "Preparing Order",
        "body": "Order is being prepared",
        "imgUrl": "assets/images/cancel.png"
      };
    case RestaurantOrderStatus.ReadyForPickup:
      return <String, dynamic>{
        "title": "Preparing Order",
        "body": "Order is being prepared",
        "imgUrl": "assets/images/cancel.png"
      };
    case RestaurantOrderStatus.OnTheWay:
      return <String, dynamic>{
        "title": "Preparing Order",
        "body": "Order is being prepared",
        "imgUrl": "assets/images/cancel.png"
      };
    case RestaurantOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "Preparing Order",
        "body": "Order is being prepared",
        "imgUrl": "assets/images/cancel.png"
      };
    case RestaurantOrderStatus.Cancelled:
      return <String, dynamic>{
        "title": "Preparing Order",
        "body": "Order is being prepared",
        "imgUrl": "assets/images/cancel.png"
      };
    default:
    // do nothing
  }
}

Notification newMessageNotification(String key, dynamic value) {
  return Notification(
      id: key,
      linkUrl: getRestaurantMessagesRoute(
          value['orderId']), // in future make dependent on order type
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      variableParams: value);
}
