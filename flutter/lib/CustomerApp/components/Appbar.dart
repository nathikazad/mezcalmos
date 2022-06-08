import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? autoBack;
  final AppBarLeftButtonType leftBtnType;

  CustomerAppBar(
      {Key? key,
      this.title,
      this.autoBack = false,
      this.leftBtnType = AppBarLeftButtonType.Back})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (title != null)
          ? Text(
              title!,
              style: Theme.of(context).textTheme.headline2,
            )
          : Container(
              alignment: Alignment.center,
              width: 180,
              child: FittedBox(
                child: MezcalmosSharedWidgets.fillTitle(
                    actionLength: 2,
                    showLogo: (Get.width > 320) ? true : false),
              ),
            ),
      automaticallyImplyLeading: autoBack ?? false,
      leading: (leftBtnType == AppBarLeftButtonType.Menu)
          ? _MenuButtonAppBar()
          : _BackButtonAppBar(),
      actions: [getAppbarIconsButton()],
    );
  }

  Widget _BackButtonAppBar() {
    return Transform.scale(
      scale: 0.6,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 216, 225, 249),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 97, 127, 255),
              Color.fromARGB(255, 198, 90, 252),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _MenuButtonAppBar() {
    return Transform.scale(
      scale: 0.6,
      child: InkWell(
        onTap: () {
          //  Get.back();
          Get.find<SideMenuDrawerController>().openMenu();
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 216, 225, 249),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 97, 127, 255),
              Color.fromARGB(255, 198, 90, 252),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _ordersAppBarIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 12),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          Get.toNamed(kOrdersRoute);
        },
        child: Ink(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: SecondaryLightBlueColor,
          ),
          child: Icon(
            Icons.watch_later,
            size: 20,
            color: primaryBlueColor,
          ),
        ),
      ),
    );
  }

  Widget _noUserButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 12),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          Get.toNamed(kSignInRouteOptional);
        },
        child: Ink(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: SecondaryLightBlueColor,
          ),
          child: Icon(
            Icons.person,
            size: 20,
            color: primaryBlueColor,
          ),
        ),
      ),
    );
  }

  Widget _notificationAppBarIcon() {
    return Obx(() {
      if (Get.find<ForegroundNotificationsController>().notifications.length >
          0) {
        return Padding(
          padding: const EdgeInsets.only(left: 3, right: 3),
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: () {
              Get.toNamed(kNotificationsRoute);
            },
            child: Badge(
              badgeColor: Colors.red,
              showBadge: true,
              position: BadgePosition.topEnd(top: 0, end: 0),
              child: Ink(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: SecondaryLightBlueColor,
                ),
                child: Icon(
                  Icons.notifications,
                  color: primaryBlueColor,
                  size: 20,
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget getAppbarIconsButton() {
    return Obx(() {
      return Row(
        children: [
          if (!Get.find<AuthController>().isUserSignedIn) _noUserButton(),
          if (Get.find<AuthController>().isUserSignedIn)
            _notificationAppBarIcon(),
          if (Get.find<AuthController>().isUserSignedIn) _ordersAppBarIcon(),
        ],
      );
    });
  }
}
