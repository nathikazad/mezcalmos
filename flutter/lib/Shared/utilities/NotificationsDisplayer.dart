import 'dart:async';
import 'package:flutter/services.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:soundpool/soundpool.dart';
import 'package:get/get.dart';

StreamSubscription<Notification> listenForNotifications() {
  return Get.find<FBNotificationsController>()
      .notificationsStream
      .listen((notification) {
    mezDbgPrint("AdminWrapper: ${notification.toJson()}");
    if (DateTime.now().difference(notification.timestamp) <
        Duration(minutes: 10)) {
      _displayNotification(notification);
    }
  });
}

void _displayNotification(Notification notification) async {
  Soundpool pool = Soundpool.fromOptions(
      options: SoundpoolOptions(streamType: StreamType.notification));

  int soundId = await rootBundle
      .load("assets/sounds/notif-alert.mp3")
      .then((ByteData soundData) {
    return pool.load(soundData);
  });
  await pool.play(soundId);
  mezDbgPrint(notification.imgUrl);
  notificationSnackBar(notification.imgUrl, notification.title,
      notification.body, notification.formattedTime, () async {
    mezDbgPrint("Notification route ===> ${notification.linkUrl} !");
    Get.toNamed(notification.linkUrl);
  });
}
