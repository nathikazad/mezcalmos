import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
// import 'package:mezcalmos/Shared/pages/Messaging.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'dart:io' show Platform;

class TaxiApp extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    Future<void> _initializeConfig() async {
      await GetStorage()
          // .write(getxGmapBottomPaddingKey, Platform.isAndroid ? 38.0 : 63.0);
          .write(getxGmapBottomPaddingKey,
              Platform.isAndroid ? 38.0 : Get.height / 20);

      // first original user marker loading

      await GetStorage().write('user_descriptor_placeholder',
          await BitmapDescriptorLoader(logo_asset, 60, 60));

      await GetStorage().write('taxi_descriptor',
          await BitmapDescriptorLoader(taxi_driver_marker_asset, 60, 60));

      await GetStorage().write(
          'destination_descriptor',
          await BitmapDescriptorLoader(
              purple_destination_marker_asset, 60, 60));

      // Loading map asset !
      await rootBundle.loadString(map_style_asset).then(
          (jsonString) => GetStorage().write(getxMapStyleJsonKey, jsonString));
    }

    return GetMaterialApp(
      onInit: () async => await _initializeConfig(),
      debugShowCheckedModeBanner: false,
      title: 'mezcalmos',
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      color: Colors.white,
      //home: MessagingScreen(),
      getPages: XRouter.mainRoutes,
      enableLog: true,
      logWriterCallback: mezcalmosLogger,
      initialRoute: kMainAuthWrapperRoute,
    );
  }
}
