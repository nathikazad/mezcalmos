import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/authHooks.dart';
import 'package:mezcalmos/DeliveryAdminApp/theme.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/appStart/appStartBase.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = DeliveryAdminRoutes.mainRoutes;
List<SideMenuItem> sideMenuItems = [];

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPointBase(
            appTheme: DeliveryDAdminTheme.lightTheme,
            signInCallback: signInCallback,
            signOutCallback: signOutCallback,
            sideMenuItems: sideMenuItems,
            routes: routes,
            locationPermissionType: LocationPermissionType.None,
          );
        },
      ),
    ),
  );
}
