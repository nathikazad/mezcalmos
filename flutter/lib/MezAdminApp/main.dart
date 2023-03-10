import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/MezAdminApp/authHooks.dart';
import 'package:mezcalmos/MezAdminApp/theme.dart';
import 'package:mezcalmos/MezAdminApp/router/router.dart';
import 'package:mezcalmos/Shared/appStart/appStartBase.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<QRoute> routes = MezAdminRoutes.mainRoutes;
List<SideMenuItem> sideMenuItems = [];

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPointBase(
            appType: AppType.MezAdminApp,
            appTheme: MezAdminTheme.lightTheme,
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
