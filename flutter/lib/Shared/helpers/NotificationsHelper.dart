// ignore_for_file: inference_failure_on_function_invocation

import 'dart:async';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as notifs;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['helpers']
    ["NotificationsHelper"];

StreamSubscription<notifs.Notification> initializeShowNotificationsListener() {
  return Get.find<ForegroundNotificationsController>()
      .displayNotificationsStream
      .listen((notification) {
    // mezDbgPrint("Notification Displayer: ${notification.toJson()}");
    // mezDbgPrint("Notif::title ====> ${notification.title}");
    // mezDbgPrint("Notif::body ====> ${notification.body}");
    if (DateTime.now().difference(notification.timestamp) <
        Duration(minutes: 10)) {
      _displayNotification(notification);
    }
  });
}

void _displayNotification(notifs.Notification notification) async {
  await Get.find<SettingsController>().playNotificationSound();
  // mezDbgPrint(notification.imgUrl);
  if (notification.notificationAction == notifs.NotificationAction.ShowPopUp) {
    if (Get.currentRoute == notification.linkUrl)
      await oneButtonDialog(
          title: notification.title,
          body: notification.body,
          buttonStyle: MezDialogButtonStyle(
              buttonText: "Ok",
              buttonColor: Color(0xffffffff),
              buttonShadowColor: Color(0xfffdfdfd)));
    else
      await twoButtonDialog(
          title: notification.title,
          body: notification.body,
          buttonLeftStyle: MezDialogButtonStyle(
              buttonText: "Ok",
              buttonColor: Color(0xffffffff),
              buttonShadowColor: Color(0xfffdfdfd)),
          buttonRightStyle: MezDialogButtonStyle(
              buttonText: notification.linkText ?? _i18n()['view'],
              buttonColor: Color(0xffffffff),
              buttonShadowColor: Color(0xfffdfdfd)),
          rightButtonCallback: () {
            Get.back();
            return Get.toNamed(notification.linkUrl);
          },
          leftButtonCallback: () {});
  } else {
    notificationSnackBar(notification.imgUrl, notification.title,
        notification.body, notification.formattedTime, () async {
      // mezDbgPrint("Notification route ===> ${notification.linkUrl} !");
      await Get.toNamed(notification.linkUrl);
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
