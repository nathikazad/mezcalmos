import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:sizer/sizer.dart';

enum AppBarLeftButtonType { Back, Menu, Lang }

AppBar MezcalmosAppBar(AppBarLeftButtonType leftBtnType,
    {Color bgColor = Colors.white,
    bool autoBack = false,
    VoidCallback? onClick,
    String? title,
    bool showLeftBtn = true,
    Widget? titleWidget,
    bool showNotifications = false,
    String? ordersRoute,
    bool showLoadingEffect = false,
    PreferredSizeWidget? tabBar,
    List<Widget> actionIcons = const <Widget>[]}) {
  Widget? _getRightLeading() {
    switch (leftBtnType) {
      case AppBarLeftButtonType.Back:
        return _BackButtonAppBar(
          click: autoBack ? (onClick ?? () => MezRouter.back()) : onClick,
        );
      case AppBarLeftButtonType.Menu:
      default:
        return _MenuButtonAppBar();
    }
  }

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
            size: 18,
            color: primaryBlueColor,
          ),
        ),
      ),
    );
  }

  return AppBar(
      elevation: 0,
      bottom: tabBar,
      automaticallyImplyLeading: false,
      leading: (showLeftBtn) ? _getRightLeading() : null,
      actions: [
        if (showNotifications && Get.find<AuthController>().isUserSignedIn)
          _notificationAppBarIcon(),
        if (ordersRoute != null && Get.find<AuthController>().isUserSignedIn)
          _ordersAppBarIcon(),
        for (int i = 0; i < actionIcons.length; i++) ...<Widget>[
          actionIcons[i]
        ],
        if (leftBtnType == AppBarLeftButtonType.Lang) _LangSwitcherBtn(),
        SizedBox(
          width: 8,
        )
      ],
      title: (title != null)
          ? Text(
              title,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            )
          : (titleWidget != null)
              ? titleWidget
              : FittedBox(
                  fit: BoxFit.fitWidth,
                  child: MezcalmosSharedWidgets.fillTitle(
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
                  primaryBlueColor,
                  primaryBlueColor,
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
              offset: Offset(0, 7),
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
  return Obx(() =>
      Get.find<ForegroundNotificationsController>().notifications.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  MezRouter.toNamed(SharedRoutes.kNotificationsRoute);
                },
                child: badge.Badge(
                  badgeColor: Colors.red,
                  showBadge: true,
                  position: badge.BadgePosition.topEnd(top: 8, end: 0),
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
            )
          : Container());
}
