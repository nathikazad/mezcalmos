import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['notificationHandler'];

Notification customerNotificationHandler(
  String key,
  dynamic value,
) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    // case NotificationType.NewMessage:
    //   return newMessageNotification(key, value);
    //  TODO: new order made notification
    default:
      throw StateError("Invalid Notification Type");
  }
}
