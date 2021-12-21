import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/TaxiApp/theme.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:mezcalmos/TaxiApp/authHooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

void main() {
  ScreenUtil.init(BoxConstraints(maxHeight: Get.height, maxWidth: Get.width));
  loadBitmaps();
  runMainGuarded(() => runApp(
        StartingPoint(
            appType: AppType.TaxiApp,
            signInCallback: signInCallback,
            appTheme: TaxiAppTheme.lightTheme,
            signOutCallback: signOutCallback,
            routes: routes),
      ));
}

void loadBitmaps() async {
  mezDbgPrint("[+] L O A D I N G .... BITMAP_DESCRIPTORS !");
  if (await GetStorage.init()) {
    await GetStorage().write(getxUserDescriptionPlaceHolder,
        await BitmapDescriptorLoader(logo_asset, 60, 60));

    await GetStorage().write(getxTaxiDescriptor,
        await BitmapDescriptorLoader(taxi_driver_marker_asset, 60, 60));

    await GetStorage().write(getxDestinationDescriptor,
        await BitmapDescriptorLoader(purple_destination_marker_asset, 60, 60));
  }
}
