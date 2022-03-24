import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';

class UserMenuIcon extends StatelessWidget {
  const UserMenuIcon({
    Key? key,
    required this.padding,
  }) : super(key: key);

  final double padding;

  /// AuthController
  static final AuthController auth = Get.find<AuthController>();

  /// OrderController
  static final OrderController orderController = Get.find<OrderController>();

  /// ForegroundNotificationsController
  static final ForegroundNotificationsController notifController =
      Get.find<ForegroundNotificationsController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Obx(
      () => (auth.user != null)
          ? CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: ((notifController.notifications.length +
                            orderController.currentOrders.length) >
                        0)
                    ? userWithBadge(themeData)
                    : CircleAvatar(
                        backgroundImage: mLoadImage(
                          url: auth.user!.image != null
                              ? auth.user!.image
                              : auth.fireAuthUser!.photoURL,
                          assetInCaseFailed: aDefaultAvatar,
                        ).image,
                      ),
              ),
            )
          : Container(),
    );
  }

  Badge userWithBadge(ThemeData themeData) {
    return Badge(
      badgeColor: themeData.primaryColorLight,
      padding: EdgeInsets.all(6),
      badgeContent: Text(
        (notifController.notifications.length +
                orderController.currentOrders.length)
            .toString(),
        style: themeData.textTheme.subtitle1!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      child: CircleAvatar(
          backgroundImage: mLoadImage(
        url: auth.user!.image != null
            ? auth.user!.image
            : auth.fireAuthUser!.photoURL,
        assetInCaseFailed: aDefaultAvatar,
      ).image),
    );
  }
}
