import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/appStart/appStartNative.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/TaxiApp/authHooks.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:mezcalmos/TaxiApp/theme.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<QRoute> routes = TaxiAppRoutes.mainRoutes;

void main() {
  loadBitmaps();
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPointNative(
            appType: AppType.Taxi,
            signInCallback: signInCallback,
            appTheme: TaxiAppTheme.lightTheme,
            signOutCallback: signOutCallback,
            routes: routes,
            locationPermissionType:
                LocationPermissionType.ForegroundAndBackground,
          );
        },
      ),
    ),
  );
}

Future<void> loadBitmaps() async {
  mezDbgPrint("[+] L O A D I N G .... BITMAP_DESCRIPTORS !");
  if (await GetStorage.init()) {
    // await GetStorage().write(getxTaxiDescriptor,
    //     await bitmapDescriptorLoader(taxi_driver_marker_asset, 60, 60));

    // await GetStorage().write(getxDestinationDescriptor,
    //     await bitmapDescriptorLoader(purple_destination_marker_asset, 60, 60));
  }
}

// python launcher.py env=stage app=TaxiApp
