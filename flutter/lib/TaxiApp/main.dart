import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/bindings/authBinding.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class TaxiApp extends GetView<SettingsController> {

  @override
  Widget build(BuildContext context) {

    return Obx(() => controller.isAppInitialized ? GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mezcalmos',
      theme: ThemeData(primaryColor: Colors.white , visualDensity: VisualDensity.adaptivePlatformDensity),
      color: Colors.white,
      getPages: XRouter.mainRoutes,
      enableLog: true,
      logWriterCallback:  mezcalmosLogger,
      initialRoute: kSplashRoute,
      initialBinding: AuthBinding(),
    ) 
    :
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Icon(Icons.signal_wifi_bad , color: Colors.red.shade200, size: getSizeRelativeToScreen(50, Get.height, Get.width)),
        ),
      ),
    ));

  }

}