import 'dart:async';
import 'package:flutter/services.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as notifs;
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:soundpool/soundpool.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

StreamSubscription<notifs.Notification> initializeShowNotificationsListener() {
  return Get.find<ForegroundNotificationsController>()
      .displayNotificationsStream
      .listen((notification) {
    mezDbgPrint("Notification Displayer: ${notification.toJson()}");
    if (DateTime.now().difference(notification.timestamp) <
        Duration(minutes: 10)) {
      _displayNotification(notification);
    }
  });
}

void _displayNotification(notifs.Notification notification) async {
  Soundpool pool = Soundpool.fromOptions(
      options: SoundpoolOptions(streamType: StreamType.notification));

  int soundId = await rootBundle
      .load("assets/sounds/notif-alert.mp3")
      .then((ByteData soundData) {
    return pool.load(soundData);
  });
  await pool.play(soundId);
  mezDbgPrint(notification.imgUrl);
  if (notification.notificationAction == notifs.NotificationAction.ShowPopUp) {
    twoButtonDialog(
        title: notification.title,
        body: notification.body,
        buttonRightStyle: Container(
          width: 88,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x334c504a),
                  offset: Offset(0, 6),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
            color: const Color(0xfffdfdfd),
          ),
          child: Center(
            child: Text("View Order",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.center),
          ),
        ),
        buttonLeftStyle: Container(
          width: 88,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x2eff0000),
                  offset: Offset(0, 6),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
            color: const Color(0xffdb2846),
          ),
          child: Center(
            child: Text("Ok",
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.center),
          ),
        ),
        // leftButtonText: "Ok",
        // rightButtonText: "View Order",
        rightButtonCallback: () => Get.toNamed(notification.linkUrl));
  } else {
    notificationSnackBar(notification.imgUrl, notification.title,
        notification.body, notification.formattedTime, () async {
      mezDbgPrint("Notification route ===> ${notification.linkUrl} !");
      Get.toNamed(notification.linkUrl);
    });
  }
}
