import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/appStart/appStartNative.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/DeliveryAdminApp/authHooks.dart';
import 'package:mezcalmos/DeliveryAdminApp/theme.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<QRoute> routes = DeliveryAdminRoutes.mainRoutes;
List<SideMenuItem> sideMenuItems = [];

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPointNative(
            appType: AppType.DeliveryAdmin,
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
