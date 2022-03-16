import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["notificationHandler"];

Notification deliveryDriverNotificationHandler(String key, dynamic value) {
  NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    // case NotificationType.NewOrder:
    //   break;
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      switch (value['orderType'].toString().toOrderType()) {
        case OrderType.Restaurant:
          return restaurantOrderStatusChangeNotificationHandler(key, value);
        case OrderType.Laundry:
          return laundryOrderStatusChangeNotificationHandler(key, value);
        default:
          throw Exception("Unexpected Order Type $value['orderType']");
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
      linkUrl: getRestaurantOrderRoute(value["orderId"]),
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}

Map<String, dynamic>? getRestaurantOrderStatusFields(
    RestaurantOrderStatus restaurantOrderStatus) {
  switch (restaurantOrderStatus) {
    case RestaurantOrderStatus.PreparingOrder:
      return <String, dynamic>{
        "title": "${_i18n()["preparingOrderTitle"]}",
        "body": "${_i18n()["preparingOrderBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.ReadyForPickup:
      return <String, dynamic>{
        "title": "${_i18n()["readyForPickupTitle"]}",
        "body": "${_i18n()["readyForPickupBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/readyOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.CancelledByCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    default:
    // do nothing
  }
  return null;
}

Notification laundryOrderStatusChangeNotificationHandler(
    String key, dynamic value) {
  LaundryOrderStatus newOrdersStatus =
      value['status'].toString().toLaundryOrderStatus();
  Map<String, dynamic> dynamicFields =
      getLaundryOrderStatusFields(newOrdersStatus)!;
  return Notification(
      id: key,
      linkUrl: getLaundryOrderRoute(value["orderId"]),
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}

Map<String, dynamic>? getLaundryOrderStatusFields(
    LaundryOrderStatus laundryOrderStatus) {
  switch (laundryOrderStatus) {
    case LaundryOrderStatus.ReadyForDelivery:
      return <String, dynamic>{
        "title": "${_i18n()["preparingOrderTitle"]}",
        "body": "${_i18n()["preparingOrderBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.CancelledByCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
  }
  return null;
}

Notification newMessageNotification(String key, dynamic value) {
  return Notification(
      id: key,
      linkUrl: getMessagesRoute(
          chatId: value['chatId'],
          recipientType: ParticipantType.DeliveryAdmin),
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}
