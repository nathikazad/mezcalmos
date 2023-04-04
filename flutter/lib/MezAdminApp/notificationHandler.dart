import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/notificationHandler.dart';
import 'package:mezcalmos/LaundryApp/notificationHandler.dart';
import 'package:mezcalmos/RestaurantApp/notificationHandler.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["MezAdmin"]["notificationHandler"];

Notification mezAdminNotificationHandler(String key, value) {
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
    case NotificationType.OrderStatusChange:
      return _orderStatusChangesHandler(key, value);

    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification _orderStatusChangesHandler(key, value) {
  OrderType orderType = value['orderType'].toString().toOrderType();
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
