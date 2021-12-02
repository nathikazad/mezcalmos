import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/SavedLocations/savedLocationView.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/CustomerApp/authHooks.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

List<SideMenuItem> sideMenuItems = <SideMenuItem>[
  SideMenuItem(
      onPress: () {
        Get.find<SideMenuDrawerController>().closeMenu();
        Get.toNamed(kSavedLocations);
      },
      icon: Icon(
        Icons.near_me_outlined,
        color: Color.fromARGB(255, 103, 121, 254),
        size: 25,
      ),
      title: "Saved Location")
];

//@jamal TODO: pass in a list of listTiles from here to the sideMenuController
//this datastructure, should basically just have a name and a link
//the side menu controller will populate the middle of its tiles using this list
void main() {
  runMainGuarded(() => runApp(
        StartingPoint(
          AppType.CustomerApp,
          signInCallback,
          signOutCallback,
          routes,
          sideMenuItems,
        ),
      ));
}
