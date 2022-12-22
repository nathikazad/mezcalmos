import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/authHooks.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/adminAuthController.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/router.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/theme.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;
List<SideMenuItem> sideMenuItems = [
  SideMenuItem(
    onClick: () {
      if (AdminAuthController().initialized ||
          Get.find<AdminAuthController>().admin?.authorized != true) {
      } else {
        MezRouter.toNamed<void>(kServicesRoute);
      }
    },
    icon: Icons.store_rounded,
    title: "DeliveryAdminApp/main/services",
    isI18nPath: true,
  ),
  SideMenuItem(
    onClick: () {
      if (AdminAuthController().initialized ||
          Get.find<AdminAuthController>().admin?.authorized != true) {
      } else {
        MezRouter.toNamed<void>(kAdminDashboard);
      }
    },
    icon: Icons.space_dashboard,
    title: "DeliveryAdminApp/main/dashboard",
    isI18nPath: true,
  ),
];

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPoint(
            appType: AppType.DeliveryAdminApp,
            appTheme: DeliveryAdminTheme.lightTheme,
            signInCallback: signInCallback,
            signOutCallback: signOutCallback,
            sideMenuItems: sideMenuItems,
            routes: routes,
            locationPermissionType: LocationPermissionType.Foreground,
          );
        },
      ),
    ),
  );
}
