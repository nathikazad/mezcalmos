import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:get/get.dart';

AppBar customerAppBar(AppBarLeftButtonType leftBtnType,
    {bool withCart = false}) {
  return mezcalmosAppBar(leftBtnType, actionIcons: [
    Obx(() =>
        Get.find<FBNotificationsController>().notifications.value.length > 0
            ? ActionIconsComponents.notificationIcon(true)
            : SizedBox()),
    ActionIconsComponents.orderIcon(),
    Obx(() => withCart &&
            Get.find<RestaurantCartController>().cart.value.items.length > 0
        ? ActionIconsComponents.cartIcon()
        : SizedBox())
  ]);
}
