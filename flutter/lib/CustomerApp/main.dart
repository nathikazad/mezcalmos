import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/CustomerApp/authHooks.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

//@jamal TODO: pass in a list of listTiles from here to the sideMenuController
//this datastructure, should basically just have a name and a link
//the side menu controller will populate the middle of its tiles using this list
void main() {
  runMainGuarded(() => runApp(
        StartingPoint(
            AppType.CustomerApp, signInCallback, signOutCallback, routes),
      ));
}
