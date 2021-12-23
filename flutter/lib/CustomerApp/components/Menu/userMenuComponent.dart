import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/components/Menu/userMenuIcon.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class UserMenu extends StatefulWidget {
  final double padding;

  const UserMenu({Key? key, required this.padding}) : super(key: key);

  @override
  State<UserMenu> createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  LanguageController lang = Get.find<LanguageController>();

  AuthController auth = Get.find<AuthController>();

  OrderController orderController = Get.find<OrderController>();
  ForegroundNotificationsController notifController =
      Get.find<ForegroundNotificationsController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return PopupMenuButton(
      padding: EdgeInsets.only(right: 12),
      iconSize: 35,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      icon: UserMenuIcon(
        padding: widget.padding,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: orderMenuItem(context),
            value: 2,
          ),
          if (notifController.notifications.isNotEmpty)
            PopupMenuItem(
              child: notificationMenuItem(context),
              value: 1,
            ),
          PopupMenuItem(
            child: Row(
              children: [
                Icon(Ionicons.map_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  lang.strings['customer']['savedLocations']['title'],
                ),
              ],
            ),
            value: 3,
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Icon(Ionicons.exit_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  lang.strings['shared']['navDrawer']["logout"],
                ),
              ],
            ),
            value: 0,
          ),
        ];
      },
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
          case 3:
            Get.toNamed(kSavedLocations);
            break;
          default:
        }
      },
    );
  }

  Row notificationMenuItem(BuildContext context) {
    return Row(
      children: [
        Badge(
            badgeColor: Theme.of(context).primaryColorLight,
            badgeContent: Text(
              notifController.notifications.length.toStringAsFixed(0),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white),
            ),
            child: Icon(Ionicons.notifications_outline)),
        SizedBox(
          width: 10,
        ),
        Text(" Notification"),
      ],
    );
  }

  Row orderMenuItem(BuildContext context) {
    return Row(
      children: [
        (orderController.currentOrders.isNotEmpty)
            ? Badge(
                badgeColor: Theme.of(context).primaryColorLight,
                badgeContent: Text(
                  orderController.currentOrders.length.toStringAsFixed(0),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white),
                ),
                child: Icon(Ionicons.time_outline))
            : Icon(Ionicons.time_outline),
        SizedBox(
          width: 10,
        ),
        Text(" Orders"),
      ],
    );
  }
}
