import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/DeliveryAdminApp/authHooks.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
String appName = "DeliveryAdminApp";
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

void main() {
  runMainGuarded(() => runApp(
        SPoint(appName, signInCallback, signOutCallback, routes),
      ));
}
