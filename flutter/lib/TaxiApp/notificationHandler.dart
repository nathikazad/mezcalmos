import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:get/get.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["TaxiApp"]["notificationHandler"];

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
      linkUrl: dynamicFields["linkUrl"],
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          (value["notificationAction"] as String).toNotificationAction(),
      variableParams: value);
}

Map<String, dynamic>? getTaxiOrderStatusFields(
    TaxiOrdersStatus taxiOrderStatus) {
  return <String, dynamic>{
    "title": "${_i18n()["cancelledTitle"]}",
    "body": "${_i18n()["cancelledBody"]}",
    "imgUrl": "assets/images/cancel.png",
  };
}

Notification newMessageNotification(String key, dynamic value) {
  return Notification(
      id: key,
      linkUrl: value['linkUrl'],
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          value["notificationAction"]?.toString().toNotificationAction() ??
              NotificationAction.ShowSnackbarOnlyIfNotOnPage,
      variableParams: value);
}
