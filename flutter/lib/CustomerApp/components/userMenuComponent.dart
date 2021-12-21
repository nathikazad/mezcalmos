import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';

class UserMenu extends StatelessWidget {
  // AuthController authController = Get.find<AuthController>();

  LanguageController lang = Get.find<LanguageController>();
  AuthController auth = Get.find<AuthController>();
  OrderController? controller;
  ForegroundNotificationsController? notifController;

  RxList<PopupMenuEntry<int>> getItems(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    List<PopupMenuEntry<int>> _tmpPopUpItems = [];
    if (auth.fireAuthUser != null) {
      controller = Get.find<OrderController>();
      notifController = Get.find<ForegroundNotificationsController>();

      _tmpPopUpItems.addAll([
        PopupMenuItem(
          child: Row(
            children: [
              (controller!.currentOrders.isEmpty)
                  ? Icon(Ionicons.time_outline)
                  : Badge(
                      badgeColor: Theme.of(context).primaryColorLight,
                      badgeContent: Text(
                        controller!.currentOrders.length.toStringAsFixed(0),
                        style: txt.subtitle1!.copyWith(color: Colors.white),
                      ),
                      child: Icon(Ionicons.time_outline)),
              SizedBox(
                width: 15,
              ),
              Text("Orders"),
            ],
          ),
          value: 2,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              (notifController!.notifications.isEmpty)
                  ? Icon(Ionicons.notifications_outline)
                  : Badge(
                      badgeColor: Theme.of(context).primaryColorLight,
                      badgeContent: Text(
                        notifController!.notifications.length
                            .toStringAsFixed(0),
                        style: txt.subtitle1!.copyWith(color: Colors.white),
                      ),
                      child: Icon(Ionicons.notifications_outline)),
              SizedBox(
                width: 15,
              ),
              Text("Notification"),
            ],
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Ionicons.exit_outline),
              SizedBox(
                width: 15,
              ),
              Text(
                lang.strings['shared']['navDrawer']["logout"],
              ),
            ],
          ),
          value: 0,
        ),
      ]);
    }

    return _tmpPopUpItems.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopupMenuButton(
        padding: EdgeInsets.all(5),
        iconSize: 50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        icon: CircleAvatar(
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: auth.fireAuthUser != null
                ? CircleAvatar(
                    backgroundImage: mLoadImage(
                            url: Get.find<AuthController>()
                                .fireAuthUser
                                ?.photoURL,
                            assetInCaseFailed: aDefaultAvatar)
                        .image)
                : Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Get.toNamed(kSignInRouteOptional);
                        // Get.offNamedUntil(kSignInRouteOptional,
                        //     ModalRoute.withName("/wrapper"));
                      },
                    ),
                  ),
          ),
        ),
        itemBuilder: (context) => getItems(context),
        onSelected: (value) async {
          switch (value) {
            case 1:
              Get.toNamed(kNotificationsRoute);
              break;
            case 2:
              Get.toNamed(kOrdersRoute);
              break;

            case 0:
              auth.signOut();
              break;
            default:
          }
        },
      ),
    );
  }
}
