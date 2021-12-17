import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/TaxiAdminApp/router.dart';

class TaxiAdminApp extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MezAdmin',
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      color: Colors.white,
      getPages: XRouter.mainRoutes,
      enableLog: true,
      logWriterCallback: mezcalmosLogger,
      initialRoute: kWrapperRoute,
    );
  }
}
