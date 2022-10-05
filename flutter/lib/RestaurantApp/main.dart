import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/RestaurantApp/authHooks.dart';
import 'package:mezcalmos/RestaurantApp/constants/assets.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/RestaurantApp/theme.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

void main() {
  loadBitmaps();
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPoint(
            appType: AppType.RestaurantApp,
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

void loadBitmaps() async {
  mezDbgPrint("[+] L O A D I N G .... BITMAP_DESCRIPTORS !");
  if (await GetStorage.init()) {
    await GetStorage().write(
      getxTaxiDescriptor,
      await bitmapDescriptorLoader(taxi_driver_marker_asset, 60, 60),
    );

    await GetStorage().write(
      getxDestinationDescriptor,
      await bitmapDescriptorLoader(purple_destination_marker_asset, 60, 60),
    );
  }
}
