import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

AppBar deliveryAdminAppBar(AppBarLeftButtonType leftBtnType,
    {bool withOrder = false, Function? function, PreferredSizeWidget? tabbar}) {
  return mezcalmosAppBar(leftBtnType,
      actionIcons: [
        Get.find<ForegroundNotificationsController>()
                    .notifications
                    .value
                    .length >
                0
            ? ActionIconsComponents.notificationIcon(
                hasNewNotif: true, margin: EdgeInsets.all(0))
            : SizedBox(),
      ],
      onClick: () => function?.call());
}
