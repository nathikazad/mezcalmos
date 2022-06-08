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

enum AppBarLeftButtonType { Back, Menu, Lang }

AppBar mezcalmosAppBar(AppBarLeftButtonType leftBtnType,
    {Color bgColor = Colors.white,
    Function? onClick,
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
        return _BackButtonAppBar();
      case AppBarLeftButtonType.Menu:
        return _MenuButtonAppBar();
      case AppBarLeftButtonType.Lang:
        return _LangSwitcherBtn();
    }
  }

  // INIT ORDERS ICON
  Widget _ordersAppBarIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 12),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          if (ordersRoute != null) {
            Get.toNamed(ordersRoute);
          }
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
      for (int i = 0; i < actionIcons.length; i++) ...<Widget>[actionIcons[i]],
    ],
    title: (title != null)
        ? Text(
            title,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 17.sp,
              color: Colors.black,
            ),
          )
        : (titleWidget != null)
            ? titleWidget
            : MezcalmosSharedWidgets.fillTitle(
                actionLength: actionIcons.length,
                showLogo: (Get.width > 320) ? true : false),
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

Widget _LangSwitcherBtn() {
  return Obx(
    () => Align(
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
