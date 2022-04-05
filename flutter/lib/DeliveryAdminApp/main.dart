import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/authHooks.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/DeliveryAdminApp/theme.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

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
            appType: AppType.DeliveryAdminApp,
            appTheme: DeliveryAdminTheme.lightTheme,
            signInCallback: signInCallback,
            signOutCallback: signOutCallback,
            routes: routes,
            locationOn: false,
          );
        },
      ),
    ),
  );
}

// python launcher.py env=stage app=DeliveryAdminApp
