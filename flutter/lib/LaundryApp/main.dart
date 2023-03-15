import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/appStart/appStartNative.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/LaundryApp/authHooks.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/LaundryApp/theme.dart';
import 'package:mezcalmos/Shared/appStart/appStartBase.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<QRoute> routes = LaundryAppRoutes.mainRoutes;

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPointNative(
            appType: AppType.LaundryApp,
            signInCallback: signInCallback,
            appTheme: LaundryAppTheme.lightTheme,
            signOutCallback: signOutCallback,
            routes: routes,
            locationPermissionType: LocationPermissionType.Foreground,
          );
        },
      ),
    ),
  );
}
