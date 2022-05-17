// ignore_for_file: inference_failure_on_function_invocation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as notifs;
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['helpers']
    ["NotificationsHelper"];

StreamSubscription<notifs.Notification> initializeShowNotificationsListener() {
  return Get.find<ForegroundNotificationsController>()
      .displayNotificationsStream
      .listen((notifs.Notification notification) {
    // mezDbgPrint("Notification Displayer: ${notification.toJson()}");
    // mezDbgPrint("Notif::title ====> ${notification.title}");
    // mezDbgPrint("Notif::body ====> ${notification.body}");
    if (DateTime.now().difference(notification.timestamp) <
        Duration(minutes: 1)) {
      _displayNotification(notification);
    }
  });
}

Future<void> _displayNotification(notifs.Notification notification) async {
  await Get.find<SettingsController>().playNotificationSound();
  // mezDbgPrint(notification.imgUrl);
  if (notification.notificationAction == notifs.NotificationAction.ShowPopUp) {
    await decideWhichButtonDialogToUse(notification);
  } else {
    notificationSnackBar(notification.imgUrl, notification.title,
        notification.body, notification.formattedTime, () async {
      // mezDbgPrint("Notification route ===> ${notification.linkUrl} !");
      await Get.toNamed(notification.linkUrl);
    });
  }
}

Future<void> decideWhichButtonDialogToUse(
    notifs.Notification notification) async {
  if (Get.currentRoute == notification.linkUrl)
    showStatusInfoDialog(Get.context!,
        status: notification.title,
        description: notification.body,
        bottomRightIcon: notification.icon);
  // await oneButtonDialog(
  //   title: notification.title,
  //   body: notification.body,
  //   buttonStyle: MezDialogButtonStyle(
  //     buttonText: "Ok",
  //     buttonColor: Color(0xffffffff),
  //     buttonShadowColor: Color(0xfffdfdfd),
  //   ),
  // );
  else
    showStatusInfoDialog(
      Get.context!,
      status: notification.title,
      description: notification.body,
      bottomRightIcon: notification.icon,
      onViewOrderClick: () => Get.toNamed(notification.linkUrl),
    );
  // await twoButtonDialog(
  //   title: notification.title,
  //   body: notification.body,
  //   leftButton: MezDialogButtonStyle(
  //     buttonText: "Ok",
  //     buttonColor: Color(0xffffffff),
  //     buttonShadowColor: Color(0xfffdfdfd),
  //   ),
  //   rightButton: MezDialogButtonStyle(
  //     buttonText: notification.linkText ?? _i18n()['view'],
  //     buttonColor: Color(0xffffffff),
  //     buttonShadowColor: Color(0xfffdfdfd),
  //   ),
  //   rightButtonCallback: () {
  //     return Get.toNamed(notification.linkUrl);
  //   },
  //   leftButtonCallback: () {},
  // );
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
          style: BorderStyle.solid,
        ),
      ),
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
      children: <Widget>[
        Flexible(
          child: Text(
            title,
            style: TextStyle(fontFamily: 'psb'),
          ),
        ),
        Text(time),
      ],
    ),
    padding: EdgeInsets.all(25),
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.GROUNDED,
  );
}
