import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:get/get.dart';

AppBar deliveryAdminAppBar(AppBarLeftButtonType leftBtnType,
    {bool withOrder = false}) {
  return mezcalmosAppBar(leftBtnType, actionIcons: [
    Get.find<ForegroundNotificationsController>().notifications.value.length > 0
        ? ActionIconsComponents.notificationIcon(
            hasNewNotif: true, margin: EdgeInsets.all(0))
        : SizedBox(),
    withOrder ? ActionIconsComponents.cartIcon() : Container()
  ]);
}
