import 'package:badges/badges.dart' as badge;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezcalmosAppBar"];
//

enum AppBarLeftButtonType { Back, Menu, Lang }

AppBar MezcalmosAppBar(AppBarLeftButtonType leftBtnType,
    {Color bgColor = Colors.white,
    bool autoBack = false,
    VoidCallback? onClick,
    String? title,
    bool showLeftBtn = true,
    bool showUserIcon = true,
    Widget? titleWidget,
    bool showNotifications = true,
    String? ordersRoute,
    bool showLoadingEffect = false,
    PreferredSizeWidget? tabBar,
    double tabbarHeight = kToolbarHeight,
    List<Widget> actionIcons = const <Widget>[]}) {
  Widget? _getRightLeading() {
    switch (leftBtnType) {
      case AppBarLeftButtonType.Back:
        return _backButton(
          click: autoBack ? (onClick ?? () => MezRouter.back()) : onClick,
        );
      case AppBarLeftButtonType.Menu:
      default:
        return _menuButton();
    }
  }

  Widget _ordersAppBarIcon() {
    return ordersRoute != null
        ? Padding(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                MezRouter.toNamed(ordersRoute);
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
          )
        : SizedBox();
  }

  Widget _noUserButton() {
    return (showUserIcon)
        ? Container(
            // padding: const EdgeInsets.only(left: 3, right: 16),
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                SignInView.navigateAtOrderTime();
              },
              child: Ink(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryLightBlueColor,
                ),
                child: Icon(
                  Icons.person,
                  size: 20,
                  color: primaryBlueColor,
                ),
              ),
            ),
          )
        : SizedBox();
  }

  Widget _notificationAppBarIcon() {
    return showNotifications &&
            Get.find<ForegroundNotificationsController>()
                .notifications
                .isNotEmpty
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
                position: badge.BadgePosition.topEnd(top: 0, end: 0),
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
        : Container();
  }

  Widget _appbarButtons() {
    return Obx(
      () => Row(
        children: [
          SizedBox(
            width: 5,
          ),
          if (Get.find<AuthController>().user == null) _noUserButton(),
          if (Get.find<AuthController>().user != null)
            _notificationAppBarIcon(),
          if (Get.find<AuthController>().user != null) _ordersAppBarIcon(),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  return AppBar(
      elevation: 0,
      bottom: (showIntallAppBtn) ? _installAppButton() : tabBar,
      automaticallyImplyLeading: false,
      leading: (showLeftBtn) ? _getRightLeading() : null,
      actions: [
        _appbarButtons(),
        for (int i = 0; i < actionIcons.length; i++) ...<Widget>[
          actionIcons[i]
        ],
        if (leftBtnType == AppBarLeftButtonType.Lang) _langSwitcherBtn(),
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

PreferredSize _installAppButton() {
  return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: MezButton(
          label: "${_i18n()['installApp']}",
          borderRadius: 0,
          onClick: launchAppStoreLink));
}

bool get showIntallAppBtn {
  return kIsWeb &&
      ((defaultTargetPlatform == TargetPlatform.android &&
              Get.find<SettingsController>().isGooglePlayServiceAvailable) ||
          defaultTargetPlatform == TargetPlatform.iOS);
}

Widget _backButton({required VoidCallback? click}) {
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

Widget _langSwitcherBtn() {
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

Widget _menuButton() {
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
