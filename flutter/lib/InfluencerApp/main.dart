import 'package:flutter/material.dart';
import 'package:mezcalmos/InfluencerApp/authHooks.dart';
import 'package:mezcalmos/InfluencerApp/router.dart';
import 'package:mezcalmos/Shared/appStart/appStartNative.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
// import 'package:mezcalmos/InfluencerApp/theme.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<QRoute> routes = InfluencerAppRoutes.mainRoutes;

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPointNative(
            appType: AppType.Influencer,
            signInCallback: signInCallback,
            // appTheme: InfluencerAppTheme.lightTheme,
            signOutCallback: signOutCallback,
            routes: routes,
            locationPermissionType: LocationPermissionType.Foreground,
          );
        },
      ),
    ),
  );
}
