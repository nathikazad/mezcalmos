import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/authHooks/customerAuthHooksBase.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/CustomerApp/router/router.dart';
import 'package:mezcalmos/CustomerApp/theme.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/appStart/appStartWeb.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

Function signInCallback = CustomerAuthHooksBase.onSignInHook;
Function signOutCallback = CustomerAuthHooksBase.onSignOutHook;
List<QRoute> routes = XRouter.mainRoutes +
    SharedRoutes.qRoutes +
    [
      QRoute(
        name: SharedRoutes.kMessagesRoute,
        path: SharedRoutes.kMessagesRoute,
        builder: () => BaseMessagingScreen(),
      )
    ];

List<SideMenuItem> sideMenuItems = <SideMenuItem>[
  SideMenuItem(
    onClick: () {
      // Get.find<SideMenuDrawerController>().closeMenu();
      MezRouter.toNamed<void>(kSavedCards);
    },
    icon: Icons.credit_card,
    title: "CustomerApp/main/savedCards",
    isI18nPath: true,
  ),
  SideMenuItem(
    onClick: () {
      // Get.find<SideMenuDrawerController>().closeMenu();
      MezRouter.toNamed<void>(kSavedLocations);
    },
    icon: Icons.near_me_outlined,
    title: "CustomerApp/main/savedLocations",
    isI18nPath: true,
  ),
];

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (
          BuildContext context,
          Orientation orientation,
          DeviceType deviceType,
        ) {
          return StartingPointWeb(
            appTheme: CustomerAppTheme.lightTheme,
            signInCallback: signInCallback,
            signOutCallback: signOutCallback,
            routes: routes,
            sideMenuItems: sideMenuItems,
            locationPermissionType: LocationPermissionType.Foreground,
          );
        },
      ),
    ),
  );
}
