import 'dart:async';
import 'package:flutter/services.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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
        buttonRightStyle: MezDialogButtonStyle(
            buttonText: "Ok",
            buttonColor: Color(0xffffffff),
            buttonShadowColor: Color(0xfffdfdfd)),
        buttonLeftStyle: MezDialogButtonStyle(
            buttonText: notification.linkText ??
                Get.find<LanguageController>().strings['shared']['notification']
                    ['view'],
            buttonColor: Color(0xffffffff),
            buttonShadowColor: Color(0xfffdfdfd)),
        rightButtonCallback: () => Get.toNamed(notification.linkUrl));
  } else {
    notificationSnackBar(notification.imgUrl, notification.title,
        notification.body, notification.formattedTime, () async {
      mezDbgPrint("Notification route ===> ${notification.linkUrl} !");
      Get.toNamed(notification.linkUrl);
    });
  }
}


void notificationSnackBar(
    String imgUrl, String title, String msg, String time, Function onClick) {
  Get.rawSnackbar(
      onTap: (_) async {
        mezDbgPrint("ONTAP ====> $_");
        await onClick();
      },
      maxWidth: Get.width,
      margin: EdgeInsets.all(0),
      duration: Duration(milliseconds: 5000),
      icon: Container(
        height: 50,
        width: 10,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: Colors.grey.shade100,
                width: 1,
                style: BorderStyle.solid)),
        child: imgUrl.startsWith("http")
            ? Image.network(
                imgUrl,
                fit: BoxFit.cover,
                height: 50,
                width: 10,
              )
            : Image.asset(imgUrl),
      ),
      backgroundColor: Colors.white,
      borderWidth: 1,
      borderColor: const Color(0xECECEC),
      borderRadius: 0,
      messageText: Text(msg),
      titleText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontFamily: 'psb'),
          ),
          Text(time)
        ],
      ),
      padding: EdgeInsets.all(25),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED);
}
