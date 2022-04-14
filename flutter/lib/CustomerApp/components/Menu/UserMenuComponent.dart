import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/components/Menu/UserMenuIcon.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class UserMenu extends StatefulWidget {
  const UserMenu({
    Key? key,
    required this.padding,
  }) : super(key: key);

  final double padding;

  @override
  State<UserMenu> createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
      ['components']['Menu']['UserMenuComponent'];

  /// AuthController
  final AuthController auth = Get.find<AuthController>();

  /// OrderController
  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Object>(
      padding: EdgeInsets.only(right: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      icon: UserMenuIcon(
        padding: widget.padding,
      ),
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<int>>[
          PopupMenuItem<int>(
            child: orderMenuItem(context),
            value: 0,
          ),
          if (Get.find<ForegroundNotificationsController>()
              .notifications
              .isNotEmpty)
            PopupMenuItem<int>(
              child: notificationMenuItem(context),
              value: 1,
            ),
          PopupMenuItem<int>(
            child: Row(
              children: <Widget>[
                Icon(Ionicons.map_outline),
                const SizedBox(width: 10),
                Text(
                  _i18n()['savedLocations'],
                ),
              ],
            ),
            value: 2,
          ),
          PopupMenuItem<int>(
            child: Row(
              children: <Widget>[
                Icon(Ionicons.person_outline),
                const SizedBox(width: 10),
                Text(
                  _i18n()["userInfo"],
                ),
              ],
            ),
            value: 3,
          ),
          PopupMenuItem<int>(
            child: Row(
              children: <Widget>[
                Icon(Ionicons.exit_outline),
                const SizedBox(width: 10),
                Text(
                  _i18n()["logout"],
                ),
              ],
            ),
            value: 4,
          ),
        ];
      },
      onSelected: (Object? value) {
        switch (value) {
          case 0:
            Get.toNamed<void>(kOrdersRoute);
            break;
          case 1:
            Get.toNamed<void>(kNotificationsRoute);
            break;
          case 2:
            Get.toNamed<void>(kSavedLocations);
            break;
          case 3:
            Get.toNamed<void>(kUserProfile);
            break;
          case 5:
            Get.toNamed<void>(kInAppReview);
            // final InAppReview _inAppReview = InAppReview.instance;
            // _inAppReview.requestReview();
            break;
          case 4:
            auth.signOut();
            break;
          default:
        }
      },
    );
  }

  Row notificationMenuItem(BuildContext context) {
    return Row(
      children: <Widget>[
        Badge(
          badgeColor: Theme.of(context).primaryColorLight,
          badgeContent: Text(
            Get.find<ForegroundNotificationsController>()
                .notifications
                .length
                .toStringAsFixed(0),
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white),
          ),
          child: Icon(Ionicons.notifications_outline),
        ),
        const SizedBox(width: 10),
        Text(" ${_i18n()['notifications']}"),
      ],
    );
  }

  Row orderMenuItem(BuildContext context) {
    return Row(
      children: <Widget>[
        (orderController.currentOrders.length > 0)
            ? Badge(
                badgeColor: Theme.of(context).primaryColorLight,
                badgeContent: Text(
                  orderController.currentOrders.length.toStringAsFixed(0),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white),
                ),
                child: Icon(Ionicons.time_outline),
              )
            : Icon(Ionicons.time_outline),
        const SizedBox(width: 10),
        Text(" ${_i18n()['orders']}"),
      ],
    );
  }
}
