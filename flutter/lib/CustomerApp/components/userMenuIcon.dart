import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';

class UserMenuIcon extends StatelessWidget {
  UserMenuIcon({
    Key? key,
  }) : super(key: key);

  AuthController auth = Get.find<AuthController>();

  OrderController orderController = Get.find<OrderController>();
  ForegroundNotificationsController notifController =
      Get.find<ForegroundNotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ((notifController.notifications.length +
                      orderController.currentOrders.length) >
                  0)
              ? Badge(
                  badgeColor: Theme.of(context).primaryColorLight,
                  padding: EdgeInsets.all(7),
                  badgeContent: Text(
                    (notifController.notifications.length +
                            orderController.currentOrders.length)
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white),
                  ),
                  child: CircleAvatar(
                      backgroundImage: mLoadImage(
                              url: auth.fireAuthUser!.photoURL,
                              assetInCaseFailed: aDefaultAvatar)
                          .image),
                )
              : CircleAvatar(
                  backgroundImage: mLoadImage(
                          url: auth.fireAuthUser!.photoURL,
                          assetInCaseFailed: aDefaultAvatar)
                      .image),
        ),
      ),
    );
  }
}
