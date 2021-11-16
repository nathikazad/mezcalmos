import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:get/get.dart';

AppBar customerAppBar(AppBarLeftButtonType btnType) {
  return mezcalmosAppBar(btnType, actionIcons: [
    Obx(() =>
        Get.find<FBNotificationsController>().notifications.value.length > 0
            ? ActionIconsComponents.notificationIcon(true)
            : SizedBox()),
    ActionIconsComponents.orderIcon()
  ]);
}
