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
  final AuthController auth = Get.find<AuthController>();
  final OrderController orderController = Get.find<OrderController>();
  final ForegroundNotificationsController notifController =
      Get.find<ForegroundNotificationsController>();

  @override
  Widget build(BuildContext context) {
    notifController.notifications.listen((_) {
      mezDbgPrint("UserMenuIcon::Notifications length >>> ${_.length}");
    });
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Obx(
            () => ((notifController.notifications().length +
                        orderController.currentOrders().length) >
                    0)
                ? Badge(
                    badgeColor: Theme.of(context).primaryColorLight,
                    // padding: EdgeInsets.all(7),
                    badgeContent: Text(
                      (notifController.notifications().length +
                              orderController.currentOrders().length)
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
          )),
    );
  }
}
