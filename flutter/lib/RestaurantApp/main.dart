import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/RestaurantApp/authHooks.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/RestaurantApp/theme.dart';
import 'package:mezcalmos/Shared/appStart/appStartBase.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = RestaurantAppRoutes.mainRoutes;

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPointBase(
            signInCallback: signInCallback,
            appTheme: RestaurantAppTheme.lightTheme,
            signOutCallback: signOutCallback,
            routes: routes,
            locationPermissionType: LocationPermissionType.Foreground,
          );
        },
      ),
    ),
  );
}
