import 'package:flutter/material.dart' as mat;
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/notificationHandler.dart';
import 'package:mezcalmos/LaundryApp/notificationHandler.dart';
import 'package:mezcalmos/RestaurantApp/notificationHandler.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["MezAdmin"]["notificationHandler"];

Notification mezAdminNotificationHandler(String key, value) {
  mezDbgPrint("notification value ====> ==================>$value");
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();

  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.NewOrder:
      return Notification(
          id: key,
          icon: value["orderType"].toString().toOrderType().toIcon(),
          linkUrl: value["linkUrl"],
          body: "${_i18n()['newOrderBody']}",
          imgUrl: null,
          title: "${_i18n()['newOrderTitle']}",
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewOrder,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.NewBusiness:
      return Notification(
          id: key,
          icon: mat.Icons.store,
          linkUrl: value["linkUrl"],
          body: "${_i18n()['newBusinessBody']}",
          imgUrl: null,
          title: "${_i18n()['newBusinessTitle']}",
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewBusiness,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.NewRestaurant:
      return Notification(
          id: key,
          icon: mat.Icons.flatware,
          linkUrl: value["linkUrl"],
          body: "${_i18n()['newRestaurantBody']}",
          imgUrl: null,
          title: "${_i18n()['newRestaurantTitle']}",
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewRestaurant,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.NewLaundry:
      return Notification(
          id: key,
          icon: mat.Icons.local_laundry_service,
          linkUrl: value["linkUrl"],
          body: "${_i18n()['newLaundryBody']}",
          imgUrl: null,
          title: "${_i18n()['newLaundryTitle']}",
          timestamp: DateTime.parse(value['time']),
          notificationType: NotificationType.NewLaundry,
          notificationAction:
              (value["notificationAction"] as String).toNotificationAction(),
          variableParams: value);
    case NotificationType.OrderStatusChange:
      return _orderStatusChangesHandler(key, value);

    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification _orderStatusChangesHandler(key, value) {
  final OrderType orderType = value['orderType'].toString().toOrderType();
  switch (orderType) {
    case OrderType.Restaurant:
      return restaurantOpOrderChangesNotifier(key, value);

    case OrderType.Laundry:
      return laundryOpOrderChangesNotifier(key, value);
    case OrderType.Courier:
      return deliveryOpOrderChangesNotifier(key, value);

    default:
      throw StateError("Unhandled notification order type");
  }
}

Notification newMessageNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: value["linkUrl"] ??
          SharedRoutes.getMessagesRoute(chatId: value["chatId"]),
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}
