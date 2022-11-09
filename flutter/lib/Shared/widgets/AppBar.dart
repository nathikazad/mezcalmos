import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

enum AppBarLeftButtonType { Back, Menu, Lang }

AppBar mezcalmosAppBar(AppBarLeftButtonType leftBtnType,
    {Color bgColor = Colors.white,
    bool autoBack = false,
    VoidCallback? onClick,
    String? title,
    Widget? titleWidget,
    bool showNotifications = false,
    String? ordersRoute,
    PreferredSizeWidget? tabBar,
    List<Widget> actionIcons = const <Widget>[]}) {
  // GET RIGHT LEADING
  Widget _getRightLeading() {
    switch (leftBtnType) {
      case AppBarLeftButtonType.Back:
        return _BackButtonAppBar(
          click: autoBack ? (onClick ?? () => MezRouter.back<void>()) : onClick,
        );
      case AppBarLeftButtonType.Menu:
        return _MenuButtonAppBar();
      case AppBarLeftButtonType.Lang:
        return _LangSwitcherBtn();
    }
  }

  // INIT ORDERS ICON
  Widget _ordersAppBarIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          if (ordersRoute != null) {
            MezRouter.toNamed(ordersRoute);
          }
        },
        child: Ink(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryLightBlueColor,
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

  return AppBar(
      // toolbarHeight: 65,
      elevation: 0,
      bottom: tabBar,
      automaticallyImplyLeading: false,
      leading: _getRightLeading(),
      actions: [
        if (showNotifications && Get.find<AuthController>().isUserSignedIn)
          _notificationAppBarIcon(),
        if (ordersRoute != null && Get.find<AuthController>().isUserSignedIn)
          _ordersAppBarIcon(),
        for (int i = 0; i < actionIcons.length; i++) ...<Widget>[
          actionIcons[i]
        ],
        SizedBox(
          width: 5,
        )
      ],
      // titleSpacing: 20,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: (title != null)
            ? Text(
                title,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              )
            : (titleWidget != null)
                ? titleWidget
                : MezcalmosSharedWidgets.fillTitle(
                    actionLength: 2,
                    showLogo: (Get.width > 320) ? true : false),
      ));
}

Widget _BackButtonAppBar({required VoidCallback? click}) {
  return Transform.scale(
    scale: 0.6,
    child: InkWell(
      onTap: click,
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
          color: click == null ? Colors.grey.shade200 : null,
          gradient: click == null
              ? null
              : LinearGradient(colors: [
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

Widget _LangSwitcherBtn() {
  return Obx(
    () => Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => Get.find<LanguageController>().changeUserLanguage(),
        child: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(Get.find<LanguageController>().oppositFlag),
            ),
          ),
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
        //  MezRouter.back();
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

Widget _notificationAppBarIcon() {
  return Obx(() {
    if (Get.find<ForegroundNotificationsController>().notifications.length >
        0) {
      return Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () {
            MezRouter.toNamed(kNotificationsRoute);
          },
          child: Badge(
            badgeColor: Colors.red,
            showBadge: true,
            position: BadgePosition.topEnd(top: 8, end: 0),
            child: Ink(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryLightBlueColor,
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
