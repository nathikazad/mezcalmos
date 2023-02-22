import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/authHooks/customerAuthHooksBase.dart';
import 'package:mezcalmos/CustomerApp/authHooks/customerAuthHooksNative.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/CustomerApp/theme.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/appStart/appStartBase.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = CustomerAuthHooksNative.onSignInHook;
Function signOutCallback = CustomerAuthHooksNative.onSignOutHook;
List<GetPage<dynamic>> routes =
    CustomerAppRoutes.mainRoutes + NativeOnlyRoutes.routes;

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
          return StartingPointBase(
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
