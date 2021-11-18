import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:get/get.dart';

AppBar deliveryAdminAppBar(AppBarLeftButtonType leftBtnType,
    {bool withOrder = false}) {
  return mezcalmosAppBar(leftBtnType, actionIcons: [
    ActionIconsComponents.notificationIcon(
        Get.find<FBNotificationsController>().notifications.value.length > 0
            ? true
            : false),
    withOrder ? ActionIconsComponents.cartIcon() : Container()
  ]);
}
