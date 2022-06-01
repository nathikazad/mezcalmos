import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/authHooks.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/CustomerApp/theme.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

List<SideMenuItem> sideMenuItems = <SideMenuItem>[
  SideMenuItem(
    onClick: () {
      Get.find<SideMenuDrawerController>().closeMenu();
      Get.toNamed<void>(kSavedLocations);
    },
    icon: Icons.near_me_outlined,
    title: "Saved Location",
  )
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
          return StartingPoint(
            appType: AppType.CustomerApp,
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
