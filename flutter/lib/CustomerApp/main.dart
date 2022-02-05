import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/CustomerApp/authHooks.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/CustomerApp/theme.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

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

void main() {
  // mezDbgPrint("sTh3me@1: ${CustomerAppTheme.lightTheme}");
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return StartingPoint(
      appType: AppType.CustomerApp,
      appTheme: CustomerAppTheme.lightTheme,
      signInCallback: signInCallback,
      signOutCallback: signOutCallback,
      routes: routes,
      sideMenuItems: sideMenuItems,
      locationOn: true,
    );
  }));
}
