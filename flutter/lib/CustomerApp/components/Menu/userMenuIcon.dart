import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class UserMenuIcon extends StatelessWidget {
  UserMenuIcon({
    Key? key,
    required this.padding,
  }) : super(key: key);
  final double padding;
  AuthController auth = Get.find<AuthController>();

  OrderController orderController = Get.find<OrderController>();
  ForegroundNotificationsController notifController =
      Get.find<ForegroundNotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: ((notifController.notifications.length +
                      orderController.currentOrders.length) >
                  0)
              ? userWithBadge(context)
              : CircleAvatar(
                  backgroundImage: mLoadImage(
                          url: auth.fireAuthUser!.photoURL,
                          assetInCaseFailed: aDefaultAvatar)
                      .image),
        )));
  }

  Badge userWithBadge(BuildContext context) {
    return Badge(
      badgeColor: Theme.of(context).primaryColorLight,
      padding: EdgeInsets.all(6),
      badgeContent: Text(
        (notifController.notifications.length +
                orderController.currentOrders.length 
                )
            .toString(),
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      child: CircleAvatar(
          backgroundImage: mLoadImage(
                  url: auth.fireAuthUser!.photoURL,
                  assetInCaseFailed: aDefaultAvatar)
              .image),
    );
  }
}
