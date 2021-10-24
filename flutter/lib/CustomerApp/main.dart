import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/CustomerApp/authHooks.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
String appName = "CustomerApp";
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

void main() {
  runApp(
    SPoint(appName, signInCallback, signOutCallback, routes),
  );
}
