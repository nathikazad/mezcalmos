import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

Notification customerNotificationHandler(String key, dynamic value) {
  NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      OrderType orderType = value['orderType'].toString().toOrderType();
      mezDbgPrint(value['orderType']);
      switch (orderType) {
        case OrderType.Restaurant:
          return restaurantOrderStatusChangeNotificationHandler(key, value);
        // case OrderType.Taxi:
        //   mezDbgPrint("Taxi Notifications");
        default:
          throw StateError("Invalid Notification Type");
      }
    default:
      throw StateError("Invalid Notification Type");
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
      linkUrl: getRestaurantOrderRoute(value['orderId']),
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction(),
      variableParams: value);
}

Map<String, dynamic>? getRestaurantOrderStatusFields(
    RestaurantOrderStatus restaurantOrderStatus) {
  LanguageController lang = Get.find<LanguageController>();
  switch (restaurantOrderStatus) {
    case RestaurantOrderStatus.PreparingOrder:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["preparingOrder"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["preparingOrder"]["body"]}",
        "imgUrl": "assets/images/PrepareOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.ReadyForPickup:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["readyForPickup"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["readyForPickup"]["body"]}",
        "imgUrl": "assets/images/ReadyOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.OnTheWay:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWay"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWay"]["body"]}",
        "imgUrl": "assets/images/OnTheWayOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.Delivered:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["delivered"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["delivered"]["body"]}",
        "imgUrl": "assets/images/DroppedOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["cancelled"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["cancelled"]["title"]}",
        "imgUrl": "assets/images/CancelledOrderNotificationIcon.png",
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
      notificationAction:
          value["notificationAction"].toString().toNotificationAction(),
      variableParams: value);
}
