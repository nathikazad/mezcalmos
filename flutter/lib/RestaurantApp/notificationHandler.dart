import 'package:flutter/material.dart' as mat;
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["LaundryApp"]["notificationHandler"];

Notification restaurantNotificationHandler(String key, value) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewOrder:
      return Notification(
          id: key,
          linkUrl: getROpOrderRoute(value["orderId"].toString()),
          body: '${_i18n()['newOrderBody']}',
          imgUrl:
              'assets/images/shared/notifications/prepareOrderNotificationIcon.png', // needs to be changed
          title: '${_i18n()['newOrderTitle']}',
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewMessage,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.OperatorApproved:
      return Notification(
          id: key,
          linkUrl: kWrapperRoute,
          body: (value["approved"] == true)
              ? 'You have been approved'
              : "You have been rejected",
          imgUrl: (value["approved"] == true)
              ? 'assets/images/shared/notifications/delivered.png'
              : 'assets/images/shared/notifications/cancel.png', // needs to be changed
          title:
              (value["approved"] == true) ? "Congrats !!" : "Unfortunately !",
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewMessage,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.NewDriver:
      return newDriverNotification(key, value);
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      return _restaurantOpOrderChangesNotifier(key, value);
    default:
      throw StateError("Invalid Notification Type");
  }
}

// String getLinkUrl(OrderType orderType, String orderId) {
//   switch (orderType) {
//     case OrderType.Laundry:
//       return getLaundryOrderRoute(orderId);
//     case OrderType.Restaurant:
//       return getRestaurantOrderRoute(orderId);
//     default:
//       return kHomeRoute;
//   }
// }

Notification _restaurantOpOrderChangesNotifier(String key, value) {
  final RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  final Map<String, dynamic> dynamicFields =
      _getRestaurantOrderStatusFields(newOrdersStatus)!;

  return Notification(
      id: key,
      linkUrl: getROpOrderRoute(value["orderId"].toString()),
      icon: mat.Icons.flatware,
      secondaryIcon: mat.Icons.close,
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}

Map<String, dynamic>? _getRestaurantOrderStatusFields(
    RestaurantOrderStatus restaurantOrderStatus) {
  switch (restaurantOrderStatus) {
    case RestaurantOrderStatus.Preparing:
      return <String, dynamic>{
        "title": "${_i18n()["preparingOrderTitle"]}",
        "body": "${_i18n()["preparingOrderBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.Ready:
      return <String, dynamic>{
        "title": "${_i18n()["readyForPickUpTitle"]}",
        "body": "${_i18n()["readyForPickUpBody"]}",
        "imgUrl": "assets/images/shared/notifications/onTheWay.png",
      };
    case RestaurantOrderStatus.OnTheWay:
      return <String, dynamic>{
        "title": "${_i18n()["onTheWayRestaurantTitle"]}",
        "body": "${_i18n()["onTheWayRestaurantBody"]}",
        "imgUrl": "assets/images/shared/notifications/onTheWay.png",
      };
    case RestaurantOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "${_i18n()["deliveredTitle"]}",
        "body": "${_i18n()["deliveredBody"]}",
        "imgUrl": "assets/images/shared/notifications/delivered.png",
      };
    case RestaurantOrderStatus.CancelledByAdmin:
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

Notification newMessageNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: getMessagesRoute(
          chatId: value['chatId'],
          orderLink: getROpOrderRoute(value['orderId'].toString())),
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}

Notification newDriverNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: kDriversList,
      body: "${value["newDriverName"]} has request join your drivers",
      imgUrl: value['newDriverImage'],
      title: "New driver request",
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewDriver,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}
