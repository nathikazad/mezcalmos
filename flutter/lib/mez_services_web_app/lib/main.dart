import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/routes/AppRoutes.dart';
import 'package:mez_services_web_app/services/theme/webAppTheme.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(builder: (
    BuildContext context,
    Orientation orientation,
    DeviceType deviceType,
  ) {
    return MyApp();
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      initialRoute: restaurants,
      theme: WebAppTheme.lightTheme,
      getPages: AppRoutes.getRoutes,
    );
  }
}
