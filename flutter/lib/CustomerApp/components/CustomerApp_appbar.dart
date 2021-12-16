import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/components/userMenuComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

// ignore: must_be_immutable
class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GestureTapCallback? onLeadingTaped;

  final String? title;
  final Widget? myLeading;
  final bool? center;
  final Color? color;
  final bool autoBack;
  bool? userMenu = true;
  CustomerAppBar(
      {Key? key,
      this.title,
      this.color,
      this.userMenu = true,
      required this.autoBack,
      this.myLeading,
      this.onLeadingTaped,
      this.center})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  AuthController _authController = Get.find<AuthController>();
  // getting user image;
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      centerTitle: center,
      automaticallyImplyLeading: autoBack,
      leading: myLeading != null
          ? InkWell(
              child: myLeading,
              onTap: onLeadingTaped != null ? onLeadingTaped : null)
          : null,
      title: (title != null)
          ? Text(
              title!,
              style: Theme.of(context).textTheme.headline2,
            )
          : Container(
              width: Get.width * 0.5,
              child: FittedBox(
                child: Row(
                  children: [MezcalmosSharedWidgets.fillTitle(1)],
                ),
              ),
            ),
      actions: [
        Obx(() => _authController.isUserSignedIn &&
                Get.find<RestaurantController>().cart.value.items.length > 0
            ? IconButton(
                onPressed: () {
                  Get.toNamed(kCartRoute);
                },
                padding: EdgeInsets.only(right: 8),
                icon: Badge(
                    badgeContent: Text(
                      Get.find<RestaurantController>()
                          .cart
                          .value
                          .items
                          .length
                          .toStringAsFixed(0),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.white),
                    ),
                    badgeColor: Theme.of(context).primaryColorLight,
                    child: Icon(Ionicons.cart)))
            : Container()),
        UserMenu(),
      ],
      elevation: 0.1,
    );
  }
}
