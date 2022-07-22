import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/authHooks.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/adminAuthController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/DeliveryAdminApp/theme.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;
List<SideMenuItem> sideMenuItems = [
  SideMenuItem(
    onClick: () {
      if (!AdminAuthController().initialized ||
          Get.find<AdminAuthController>().admin?.authorized != true) {
      } else {
        Get.toNamed<void>(kServicesRoute);
      }
    },
    icon: Icons.store_rounded,
    title: "DeliveryAdminApp/main/services",
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
          );
        },
      ),
    ),
  );
}
